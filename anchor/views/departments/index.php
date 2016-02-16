<?php echo $header; ?>
     <hgroup class="wrap">
     	<h1>
     		<?php echo __('departments.departments'); ?>
     	</h1>
        
        <nav>
        	<?php echo Html::link('admin/departments/add',__('departments.create_department'), array('class' => 'btn')); ?>
        </nav>

     </hgroup>

     <section class="wrap">
     	  <?php echo $messages; ?>

     	  <ul class="list">
     	  	   <?php foreach ($departments->results as $department): ?>

     	  	   	<li>
     	  	   		<a href="<?php echo Uri::to('admin/departments/edit/' . $department->id); ?>">
     	  	   		<strong><?php echo $department->title; ?></strong>

     	  	   		<span><?php echo $department->slug; ?></span>
     	  	   	</li>
     	  	   <?php endforeach; ?>
     	  
            </ul>

     	  <aside class="pading"><?php echo $departments->links(); ?></aside>
     </section>
<?php echo $footer; ?>