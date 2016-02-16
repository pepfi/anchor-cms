<?php echo $header; ?>
    <hgroup class="wrap">
	
    	<h1><?php echo __('companies.edit_company', $company->title); ?></h1>
    	

    </hgroup>
    <section class="wrap"> 
    	<?php echo $messages; ?>
    	
<form method="post" action="<?php echo Uri::to('admin/companies/edit/' . $company->id); ?>" novalidate>

		<input name="token" type="hidden" value="<?php echo $token; ?>">

		<fieldset class="split">
			<p>
				<label for="label-title"><?php echo __('companies.title'); ?>:</label>
				<?php echo Form::text('title', Input::previous('title', $company->title), array('id' => 'label-title')); ?>
				<em><?php echo __('companies.title_explain'); ?></em>
			</p>
			<p>
				<label for="label-slug"><?php echo __('companies.slug'); ?>:</label>
				<?php echo Form::text('slug', Input::previous('slug', $company->slug), array('id' => 'label-slug')); ?>
				<em><?php echo __('companies.slug_explain'); ?></em>
			</p>
			<p>
				<label for="label-description"><?php echo __('companies.description'); ?>:</label>
				<?php echo Form::textarea('description', Input::previous('description', $company->description), array('id' => 'label-description')); ?>
				<em><?php echo __('companies.description_explain'); ?></em>
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

			<?php echo Html::link('admin/companies/delete/' . $company->id, __('global.delete'), array(
				'class' => 'btn delete red'
			)); ?>
		</aside>
	</form>
</section>

<script src="<?php echo asset('anchor/views/assets/js/slug.js'); ?>"></script>

<?php echo $footer; ?>

