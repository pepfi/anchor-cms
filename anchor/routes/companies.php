<?php

Route::collection(array('before' => 'auth,csrf'),
	function(){
	
	Route::get(array('admin/companies','admin/companies/(:num)'),function($page = 1){
		$vars['messages'] = Notify::read();
		$vars['companies'] = Company::paginate($page,Config::get('meta.posts_per_page'));
   
		return View::create('companies/index',$vars)
		   ->partial('header', 'partials/header')
		   ->partial('footer', 'partials/footer');
			
	});

	Route::get('admin/companies/edit/(:num)',function($id) {
		$vars['messages'] = Notify::read();
		$vars['token'] = Csrf::token();
		$vars['company'] = Company::find($id);

		$vars['fields'] = Extend::fields('company',$id);

		return View::create('companies/edit',$vars)
			->partial('header', 'partials/header')
			->partial('footer', 'partials/footer');
	});

	Route::post('admin/companies/edit/(:num)',function($id) {
		$input = Input::get(array('title','slug','description'));
	    $validator = new validator($input);

	    $validator->check('title')
	        ->is_max(3,__('companies.title_missing'));

	    if($errors = $validator->errors()){
	    	Input::flash();

	    	Notify::error($errors);

	    	return Response::redirect('admin/companies/edit/' .$id);
	    }

	    if(empty($input['slug'])) {
	    	$input['slug'] = $input['title'];
	    }

	    $input['slug'] = slug($input['slug']);

	    Company::update($id,$input);
	    Extend::process('company', $id);

	    Notify::successs(__('companies.update'));

	    return Response::redirect('admin/companies/edit/' . $id);
	});

	Route::get('admin/companies/add', function() {
		$vars['messages'] = Notify::read();
		$vars['token'] = Csrf::token();

		$vars['fields'] = Extend::fields('company');

		return View::create('companies/add',$vars)
			->partial('header', 'partials/header')
			->partial('footer', 'partials/footer');
	});

	Route::post('admin/companies/add', function() {
		$input = Input::get(array('title', 'slug', 'description'));

		$validator = new validator($input);

		$validator->check('title')
		    ->is_max(3,__('companies.title_missing'));

		if($errors = $validator->errors()) {
			Input::flash();

			Notify::error($errors);

			return Response::redirect('admin/companies/add');
		}

		if(empty($input['slug'])) {
			$input['slug'] = $input['title'];
		}

		$input['slug'] = slug($input['slug']);

		$company = Company::create($input);
		Extend::process('company',$company->id);

		Notify::success(__('companies.created'));

		return Response::redirect('admin/companies');
	});

	Route::get('admin/companies/delete/(:num)',function($id) {
		$total = Company::count();

		if($total == 1) {

			Notify::error(__('companies.delete_error'));

			return Response::redirect('admin/companies/edit/' .$id);

		}

		$company = Company::where('id', '<>',$id)->fetch();

		Company::find($id)->delete();

		Post::where('company', '=', $id)->update(array('company' => $company->id));

		Notify::success(__('companies.deleted'));

		return Response::redirect('admin/companies');
	});
});
?>