<?php $__env->startSection('title', 'Dashboard '); ?>

<?php $__env->startSection('styles'); ?>
	<link rel="stylesheet" href="<?php echo e(asset('main/vendor/jvectormap/jquery-jvectormap-2.0.3.css')); ?>">
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>

<div class="content-area py-1">
<div class="container-fluid">
    <div class="row row-md">
		<div class="col-lg-3 col-md-6 col-xs-12">
			<div class="box box-block bg-white tile tile-1 mb-2">
				<div class="t-icon right"><span class="bg-danger"></span><i class="ti-rocket"></i></div>
				<div class="t-content">
					<h6 class="text-uppercase mb-1"><?php echo app('translator')->get('admin.dashboard.Rides'); ?></h6>
					<h1 class="mb-1"><?php echo e($rides->count()); ?></h1>
					<span class="tag tag-danger mr-0-5"><?php if($cancel_rides == 0): ?> 0.00 <?php else: ?> <?php echo e(round($cancel_rides/$rides->count(),2)); ?>% <?php endif; ?></span>
					<span class="text-muted font-90">% down from cancelled Request</span>
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-md-6 col-xs-12">
			<div class="box box-block bg-white tile tile-1 mb-2">
				<div class="t-icon right"><span class="bg-success"></span><i class="ti-bar-chart"></i></div>
				<div class="t-content">
					<h6 class="text-uppercase mb-1"><?php echo app('translator')->get('admin.dashboard.Revenue'); ?></h6>
					<h1 class="mb-1"><?php echo e(currency($revenue)); ?></h1>
					<i class="fa fa-caret-up text-success mr-0-5"></i><span>from <?php echo e($rides->count()); ?> Rides</span>
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-md-6 col-xs-12">
			<div class="box box-block bg-white tile tile-1 mb-2">
				<div class="t-icon right"><span class="bg-primary"></span><i class="ti-view-grid"></i></div>
				<div class="t-content">
					<h6 class="text-uppercase mb-1"><?php echo app('translator')->get('admin.dashboard.total_user'); ?></h6>
					<h1 class="mb-1"><?php echo e($user_count); ?></h1>
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-md-6 col-xs-12">
			<div class="box box-block bg-white tile tile-1 mb-2">
				<div class="t-icon right"><span class="bg-warning"></span><i class="ti-archive"></i></div>
				<div class="t-content">
					<h6 class="text-uppercase mb-1"><?php echo app('translator')->get('admin.dashboard.total_provider'); ?></h6>
					<h1 class="mb-1"><?php echo e($provider_count); ?></h1>
					<?php $__currentLoopData = $service; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?> 
					<span><?php echo e($value->name); ?> : </span> <span class="tag tag-danger mr-0-5"><?php echo e($value->count); ?></span><br>
					<?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
				</div>
			</div>
		</div>
	</div>
	<div class="row row-md">
		<div class="col-lg-3 col-md-6 col-xs-12">
			<div class="box box-block bg-white tile tile-1 mb-2">
				<div class="t-icon right"><span class="bg-primary"></span><i class="ti-view-grid"></i></div>
				<div class="t-content">
					<h6 class="text-uppercase mb-1"><?php echo app('translator')->get('admin.dashboard.cancel_count'); ?></h6>
					<h1 class="mb-1"><?php echo e($user_cancelled); ?></h1>
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-md-6 col-xs-12">
			<div class="box box-block bg-white tile tile-1 mb-2">
				<div class="t-icon right"><span class="bg-danger"></span><i class="ti-bar-chart"></i></div>
				<div class="t-content">
					<h6 class="text-uppercase mb-1"><?php echo app('translator')->get('admin.dashboard.provider_cancel_count'); ?></h6>
					<h1 class="mb-1"><?php echo e($provider_cancelled); ?></h1>
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-md-6 col-xs-12">
			<div class="box box-block bg-white tile tile-1 mb-2">
				<div class="t-icon right"><span class="bg-warning"></span><i class="ti-rocket"></i></div>
				<div class="t-content">
					<h6 class="text-uppercase mb-1"><?php echo app('translator')->get('admin.dashboard.fleets'); ?></h6>
					<h1 class="mb-1"><?php echo e($fleet); ?></h1>
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-md-6 col-xs-12">
			<div class="box box-block bg-white tile tile-1 mb-2">
				<div class="t-icon right"><span class="bg-success"></span><i class="ti-bar-chart"></i></div>
				<div class="t-content">
					<h6 class="text-uppercase mb-1"><?php echo app('translator')->get('admin.dashboard.scheduled'); ?></h6>
					<h1 class="mb-1"><?php echo e($scheduled_rides); ?></h1>
				</div>
			</div>
		</div>
	</div>

	<div class="row row-md mb-2">
		<div class="col-md-12">
				<div class="box bg-white">
					<div class="box-block clearfix">
						<h5 class="float-xs-left"><?php echo app('translator')->get('admin.dashboard.Recent_Rides'); ?></h5>
						<div class="float-xs-right">
							<button class="btn btn-link btn-sm text-muted" type="button"><i class="ti-close"></i></button>
						</div>
					</div>
					<table class="table mb-md-0">
						<tbody>
						<?php $diff = ['-success','-info','-warning','-danger']; ?>
						<?php $__currentLoopData = $rides; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $ride): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
							<tr>
								<th scope="row"><?php echo e($index + 1); ?></th>
								<td><?php echo e($ride->user->first_name); ?> <?php echo e($ride->user->last_name); ?></td>
								<td>
									<?php if($ride->status != "CANCELLED"): ?>
										<a class="text-primary" href="<?php echo e(route('admin.requests.show',$ride->id)); ?>"><span class="underline"><?php echo app('translator')->get('admin.dashboard.View_Ride_Details'); ?></span></a>
									<?php else: ?>
										<span><?php echo app('translator')->get('admin.dashboard.No_Details_Found'); ?> </span>
									<?php endif; ?>									
								</td>
								<td>
									<span class="text-muted"><?php echo e($ride->created_at->diffForHumans()); ?></span>
								</td>
								<td>
									<?php if($ride->status == "COMPLETED"): ?>
										<span class="tag tag-success"><?php echo e($ride->status); ?></span>
									<?php elseif($ride->status == "CANCELLED"): ?>
										<span class="tag tag-danger"><?php echo e($ride->status); ?></span>
									<?php else: ?>
										<span class="tag tag-info"><?php echo e($ride->status); ?></span>
									<?php endif; ?>
								</td>
							</tr>
							<?php if($index==10) break; ?>
						<?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
							
						</tbody>
					</table>
				</div>
			</div>

		</div>

	</div>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.layout.base', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>