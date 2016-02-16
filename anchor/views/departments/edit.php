<?php echo $header; ?>

<hgroup class="wrap">
	<h1><?php echo __('departments.edit_department', $department->title); ?></h1>
</hgroup>

<section class="wrap">
	<?php echo $messages; ?>

	<form method="post" action="<?php echo Uri::to('admin/departments/edit/' . $department->id); ?>" novalidate>

		<input name="token" type="hidden" value="<?php echo $token; ?>">

		<fieldset class="split">
			<p>
				<label for="label-title"><?php echo __('departments.title'); ?>:</label>
				<?php echo Form::text('title', Input::previous('title', $department->title), array('id' => 'label-title')); ?>
				<em><?php echo __('departments.title_explain'); ?></em>
			</p>
			<p>
				<label for="label-slug"><?php echo __('departments.slug'); ?>:</label>
				<?php echo Form::text('slug', Input::previous('slug', $department->slug), array('id' => 'label-slug')); ?>
				<em><?php echo __('departments.slug_explain'); ?></em>
			</p>
			<p>
				<label for="label-description"><?php echo __('departments.description'); ?>:</label>
				<?php echo Form::textarea('description', Input::previous('description', $department->description), array('id' => 'label-description')); ?>
				<em><?php echo __('departments.description_explain'); ?></em>
			</p>
			<?php foreach($fields as $field): ?>
			<p>
				<label for="extend_<?php echo $field->key; ?>"><?php echo $field->label; ?>:</label>
				<?php echo Extend::html($field); ?>
			</p>
			<?php endforeach; ?>
		</fieldset>

		<aside class="buttons">
			<?php echo Form::button(__('global.save'), array('type' => 'submit', 'class' => 'btn')); ?>

			<?php echo Html::link('admin/departments/delete/' . $department->id, __('global.delete'), array(
				'class' => 'btn delete red'
			)); ?>
		</aside>
	</form>
</section>

<script src="<?php echo asset('anchor/views/assets/js/slug.js'); ?>"></script>

<?php echo $footer; ?>
