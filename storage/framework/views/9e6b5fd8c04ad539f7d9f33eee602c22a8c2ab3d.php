<?php $__env->startSection('title', 'Add Sub Admin '); ?>

<?php $__env->startSection('content'); ?>

<div class="content-area py-1">
    <div class="container-fluid">
    	<div class="box box-block bg-white">
            <a href="<?php echo e(route('admin.subadmin.index')); ?>" class="btn btn-default pull-right"><i class="fa fa-angle-left"></i> <?php echo app('translator')->get('admin.back'); ?></a>

			<h5 style="margin-bottom: 2em;"><?php echo app('translator')->get('admin.users.Add_SubUser'); ?></h5>

            <form class="form-horizontal" action="<?php echo e(route('admin.subadmin.store')); ?>" method="POST" enctype="multipart/form-data" role="form">
            	<?php echo e(csrf_field()); ?>

				<div class="form-group row">
					<label for="name" class="col-xs-12 col-form-label"><?php echo app('translator')->get('admin.name'); ?></label>
					<div class="col-xs-10">
						<input class="form-control" type="text" value="<?php echo e(old('name')); ?>" name="name" required id="name" placeholder="Name">
					</div>
				</div>

				<div class="form-group row">
					<label for="email" class="col-xs-12 col-form-label"><?php echo app('translator')->get('admin.email'); ?></label>
					<div class="col-xs-10">
						<input class="form-control" type="email" required name="email" value="<?php echo e(old('email')); ?>" id="email" placeholder="Email">
					</div>
				</div>

				<div class="form-group row">
					<label for="password" class="col-xs-12 col-form-label"><?php echo app('translator')->get('admin.password'); ?></label>
					<div class="col-xs-10">
						<input class="form-control" type="password" name="password" id="password" placeholder="Password">
					</div>
				</div>

				<div class="form-group row">
					<label for="password_confirmation" class="col-xs-12 col-form-label"><?php echo app('translator')->get('admin.account.password_confirmation'); ?></label>
					<div class="col-xs-10">
						<input class="form-control" type="password" name="password_confirmation" id="password_confirmation" placeholder="Re-type Password">
					</div>
				</div>

				<div class="form-group row">
					<label for="picture" class="col-xs-12 col-form-label"><?php echo app('translator')->get('admin.picture'); ?></label>
					<div class="col-xs-10">
						<input type="file" accept="image/*" name="picture" class="dropify form-control-file" id="picture" aria-describedby="fileHelp">
					</div>
				</div>



				<div class="form-group row">
					<label for="picture" class="col-xs-12 col-form-label"><?php echo app('translator')->get('admin.role'); ?></label>
					<div class="col-xs-10">
						<select name="role_id" class="col-xs-12 col-form-label">
								<option value="">Select Role</option>
								<?php
									foreach( $role as $list_role) {
								?>
								<option value="<?php echo e($list_role->id); ?>"><?php echo e($list_role->role_name); ?></option>
								<?php } ?>

						</select>
					</div>
				</div>

	
				<div class="form-group row">
					<label for="zipcode" class="col-xs-12 col-form-label"></label>
					<div class="col-xs-10">
						<button type="submit" class="btn btn-primary"><?php echo app('translator')->get('admin.users.Add_User'); ?></button>
						<a href="<?php echo e(route('admin.user.index')); ?>" class="btn btn-default"><?php echo app('translator')->get('admin.cancel'); ?></a>
					</div>
				</div>
			</form>
		</div>
    </div>
</div>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.layout.base', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>