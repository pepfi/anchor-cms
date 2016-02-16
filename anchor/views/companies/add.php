<?php echo $header; ?>

<hgroup class="wrap">
	
	<h1><?php echo __('companies.create_company'); ?></h1>
</hgroup>

<session class="wrap">
	<?php echo $messages; ?>

	<form method="post" action="<?php echo Uri::to('admin/companies/add'); ?>">
         <input name="token" type="hidden" value="<?php echo $token; ?>">

         <fieldset class="split">
         	<p>
         		<label for="label-title">
         			<?php echo __('companies.title'); ?>:
         		</label>
         		<?php echo Form::text('title', Input::previous('title'),array('id' => 'label-title')); ?>
         		<em><?php echo __('companies.title_explain'); ?></em>
         	</p>
             

             <p>
             	<label for="label-slug"><?php echo __('companies.slug'); ?>:</label>
             	<?php echo Form::text('slug', Input::previous('slug'), array('id' => 'label-slug')); ?>
             	<em><?php echo __('companies.slug_explain','The slug for your category.'); ?></em>
             </p>

             <p>
             	<label for="label_description"><?php echo __('companies.description'); ?>:</label>
             	<?php echo Form::textarea('description', Input::previous('description'), array('id' => 'label-description')); ?>
             	<em><?php echo __('companies.description_explain'); ?></em>
             </p>
             <?php foreach ($fields as $field): ?>
             	<p>
             		<label for="extend_<?php echo $field->key; ?>"><?php echo $field->label; ?></label>
             		<?php echo Extend::html($field); ?>
             	</p>

             <?php endforeach; ?>

         </fieldset>

         <aside class="buttons">
               <?php echo Form::button(__('global.save'), array('type' => 'submit', 'class' => 'btn')); ?>
         </aside>
	</form> 
</session>

<script src="<?php echo asset('anchor/views/assets/js/slug.js'); ?>"></script>

<?php echo $footer; ?>