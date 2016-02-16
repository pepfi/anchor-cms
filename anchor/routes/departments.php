<?php

Route::collection(array('before' => 'auth,csrf'),
 	function(){
 		Route::get(array('admin/departments','admin/departments/(:num)'),function($page = 1){
 			$vars['messages'] = Notify::read();
 			$vars['departments'] = Department::paginate($page,Config::get('meta.posts_per_page'));

 			return View::create('departments/index',$vars)
 			    ->partial('header', 'partials/header')
 			    ->partial('footer', 'partials/footer');
 		});

 		Route::get('admin/departments/edit/(:num)',function($id) {
		$vars['messages'] = Notify::read();
		$vars['token'] = Csrf::token();
		$vars['department'] = Department::find($id);

		$vars['fields'] = Extend::fields('department',$id);

		return View::create('departments/edit',$vars)
			->partial('header', 'partials/header')
			->partial('footer', 'partials/footer');
	});

	Route::post('admin/departments/edit/(:num)',function($id) {
		$input = Input::get(array('title','slug','description'));
	    $validator = new validator($input);

	    $validator->check('title')
	        ->is_max(3,__('departments.title_missing'));

	    if($errors = $validator->errors()){
	    	Input::flash();

	    	Notify::error($errors);

	    	return Response::redirect('admin/departments/edit/' .$id);
	    }

	    if(empty($input['slug'])) {
	    	$input['slug'] = $input['title'];
	    }

	    $input['slug'] = slug($input['slug']);

	    department::update($id,$input);
	    Extend::process('department', $id);

	    Notify::successs(__('departments.update'));

	    return Response::redirect('admin/departments/edit/' . $id);
	});

	Route::get('admin/departments/add', function() {
		$vars['messages'] = Notify::read();
		$vars['token'] = Csrf::token();

		$vars['fields'] = Extend::fields('department');

		return View::create('departments/add',$vars)
			->partial('header', 'partials/header')
			->partial('footer', 'partials/footer');
	});

	Route::post('admin/departments/add', function() {
		$input = Input::get(array('title', 'slug', 'description'));

		$validator = new validator($input);

		$validator->check('title')
		    ->is_max(3,__('departments.title_missing'));

		if($errors = $validator->errors()) {
			Input::flash();

			Notify::error($errors);

			return Response::redirect('admin/departments/add');
		}

		if(empty($input['slug'])) {
			$input['slug'] = $input['title'];
		}

		$input['slug'] = slug($input['slug']);

		$department = department::create($input);
		Extend::process('department',$department->id);

		Notify::success(__('departments.created'));

		return Response::redirect('admin/departments');
	});

	Route::get('admin/departments/delete/(:num)',function($id) {
		$total = department::count();

		if($total == 1) {

			Notify::error(__('departments.delete_error'));

			return Response::redirect('admin/departments/edit/' .$id);

		}

		$department = department::where('id', '<>',$id)->fetch();

		department::find($id)->delete();

		Post::where('department', '=', $id)->update(array('department' => $department->id));

		Notify::success(__('departments.deleted'));

		return Response::redirect('admin/departments');
	});
});
?>