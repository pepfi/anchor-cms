<?php echo $header; ?>

<hgroup class="wrap">
      <h1><?php echo __('companies.companies'); ?></h1>

	<nav>
		<?php echo Html::link('admin/companies/add',__('companies.create_company'), array('class' => 'btn')); ?>
	</nav>

</hgroup>

<section class="wrap">
	<?php echo $messages; ?>

	<ul class="list">
		<?php foreach ($companies->results as $company): ?>
             <li>
             	<a href="<?php echo Uri::to('admin/companies/edit/' . $company->id); ?>">
             	<strong><?php echo $company->title; ?></strong>

             	<span><?php echo $company->slug; ?></span>
             </li>
		<?php endforeach; ?>
	</ul>
     
     <aside class="pading"><?php echo $companies->links(); ?></aside>
</section>

<?php echo $footer; ?>