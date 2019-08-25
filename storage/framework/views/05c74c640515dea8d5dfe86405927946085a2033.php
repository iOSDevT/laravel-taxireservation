<?php $__env->startSection('title', 'Users '); ?>

<?php $__env->startSection('content'); ?>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<script type="text/javascript">
    
    $(document).ready(function () {
        $('#seleted_delete').hide();
        $('input[type="checkbox"]').click(function () {
            var checked_count = $('input:checkbox:checked').length;
            if(checked_count >= 1) {
            $('#seleted_delete').show();
            }
            else
            {
            $('#seleted_delete').hide();
            }
        });
        $('body').on('click', '#selectAll', function () { 
          if ($(this).hasClass('allChecked')) { 
             $('input[type="checkbox"]').prop('checked', false);
             $('#seleted_delete').hide();
          } else { 
           $('input[type="checkbox"]').prop('checked', true);
           $('#seleted_delete').show();
           }
           $(this).toggleClass('allChecked');
         })
           

        $('body').on('click', '#seleted_delete', function () {
             var deleted = [];
             var deleted_id = [];
             <?php 
                foreach($users as $key => $data)
                { ?>
                    
                    if($('.delete<?php echo e($data->id); ?>').prop('checked'))
                    { 
                        deleted_id[<?php echo e($key); ?>]= '<?php echo e($data->id); ?>'; 
                    }
                    


                <?php }
                ?>
                
                $.post( "user/seleted_delete", { deleted_id: deleted_id }) 
                 .done(function( data ) {
                    //alert( "Data Loaded: " + data );
                    window.location.replace("<?php echo e(url('admin/user')); ?>");
                  });

        })
    });
</script>
<style type="text/css"> 
 .pagination {
    display: inline-flex;
    border-radius: .25rem;
}
    .pagination li {
    border: 1px solid #f0f1f2;
    width: 25px;
    height: 25px;
    text-align: center;
    list-style: none;
}
</style>

<!-- Delete Model -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog modal-sm">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Are you sure?</h4>
            </div> 
            <div class="modal-footer">
            <button type="button" id="seleted_delete" style="margin-left: 1em;" class="btn btn-info btn-md"> Delete</button>
              <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
          </div>
        </div>
      </div>
<div class="content-area py-1">
    <div class="container-fluid">
        <div class="box box-block bg-white">
           <?php if(Setting::get('demo_mode') == 1): ?>
        <div class="col-md-12" style="height:50px;color:red;">
                    ** Demo Mode : No Permission to Edit and Delete.
                </div>
                <?php endif; ?>
            <h5 class="mb-1">
                <?php echo app('translator')->get('admin.users.Users'); ?>
                <?php if(Setting::get('demo_mode', 0) == 1): ?>
                <span class="pull-right">(*personal information hidden in demo)</span>
                <?php endif; ?>
            </h5> 
            <div class="col-md-12"> 
            <div class="col-md-3">
            <button type="button" class="btn btn-info btn-md pull-left" data-toggle="modal" data-target="#myModal" style="margin-left: -30PX;"><span class="glyphicon glyphicon-trash"></span> Seleted Delete</button>
            </div>
            <div class="col-md-6">
            <form action="<?php echo e(route('admin.user.index')); ?>" method="GET"> 
            <div class="col-md-6">
            <input type="text" class="form-control col-md-6" name="search" value="<?php echo e($search); ?>">
            </div>
            <div class="col-md-6"> 
            <button type="submit" class="btn btn-success col-md-6" ><span class="glyphicon glyphicon-search" style="font-size: 15px;"> Search</span></button>
            </div> 
            </form>
            </div>
            <!-- <div class="col-md-2">
            <a href="<?php echo e(url('admin/user/export/excel')); ?>" class="btn btn-primary form-control col-md-6" >Download Excel</a>
            </div>  -->
            <div class="col-md-3" style="text-align: right;">
            <a href="<?php echo e(route('admin.user.create')); ?>" style="margin-left: 1em;" class="btn btn-primary"><i class="fa fa-plus"></i> Add New User</a> 
            </div> 
            </div> <br> <br>
            <table class="table table-striped table-bordered dataTable" id="cus-table-2">
                <thead>
                    <tr>
                        <th><button type="button" id="selectAll" class="main">
                        <span class="sub"></span> All </button></th>
                        <th><?php echo app('translator')->get('admin.id'); ?></th> 
                        <th>Joined At</th>
                        <th><?php echo app('translator')->get('admin.first_name'); ?></th>
                        <th><?php echo app('translator')->get('admin.last_name'); ?></th>
                        <th>Joined At</th>
                        <th><?php echo app('translator')->get('admin.email'); ?></th>
                        <th><?php echo app('translator')->get('admin.mobile'); ?></th>
                        <th><?php echo app('translator')->get('admin.users.Rating'); ?></th>
                        <th><?php echo app('translator')->get('admin.users.Wallet_Amount'); ?></th>
                        <th><?php echo app('translator')->get('admin.action'); ?></th>
                    </tr>
                </thead>
                <tbody> <?php ($page_plus=$page-10); ?>
                    <?php $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $user): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
                    <tr>
                        <td><input type="checkbox" class="delete<?php echo e($user->id); ?>" data-id="<?php echo e($user->id); ?>"></td>
                        <td><?php echo e($index + 1 + $page_plus); ?></td>
                        <td><?php echo e(date('d M Y', strtotime($user->created_at) )); ?></td>
                        <td><?php echo e($user->first_name); ?></td>
                        <td><?php echo e(date('d M Y', strtotime($user->created_at) )); ?></td>
                        <td><?php echo e($user->last_name); ?></td>
                        <?php if(Setting::get('demo_mode', 0) == 1): ?>
                            <td><?php echo e(substr($user->email, 0, 3).'****'.substr($user->email, strpos($user->email, "@"))); ?></td>
                        <?php else: ?>
                            <td><?php echo e($user->email); ?></td>
                        <?php endif; ?>
                        <?php if(Setting::get('demo_mode', 0) == 1): ?>
                            <td><?php echo e(substr($user->mobile, 0, 5).'********'); ?></td>
                        <?php else: ?>
                            <td><?php echo e($user->mobile); ?></td>
                        <?php endif; ?>
                        <td><?php echo e($user->rating); ?></td>
                        <td><?php echo e(currency($user->wallet_balance)); ?></td>
                        <td>
                            <form action="<?php echo e(route('admin.user.destroy', $user->id)); ?>" method="POST">
                                <?php echo e(csrf_field()); ?>

                                <input type="hidden" name="_method" value="DELETE">
                                <a href="<?php echo e(route('admin.user.request', $user->id)); ?>" class="btn btn-info"><i class="fa fa-search"></i> <?php echo app('translator')->get('admin.History'); ?></a>
                                <?php if( Setting::get('demo_mode') == 0): ?>
                                <a href="<?php echo e(route('admin.user.edit', $user->id)); ?>" class="btn btn-info"><i class="fa fa-pencil"></i> <?php echo app('translator')->get('admin.edit'); ?></a>
                                <button class="btn btn-danger" onclick="return confirm('Are you sure?')"><i class="fa fa-trash"></i> <?php echo app('translator')->get('admin.delete'); ?></button>
                                <?php endif; ?>
                            </form>
                        </td>
                    </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
                </tbody> 
                <tfoot>
                    <tr>
                        <th><button type="button" id="selectAll" class="main">
                        <span class="sub"></span> All </button></th>
                        <th><?php echo app('translator')->get('admin.id'); ?></th>
                        <th>Joined At</th>
                        <th><?php echo app('translator')->get('admin.first_name'); ?></th>
                        <th><?php echo app('translator')->get('admin.last_name'); ?></th>
                        <th>Joined At</th>
                        <th><?php echo app('translator')->get('admin.email'); ?></th>
                        <th><?php echo app('translator')->get('admin.mobile'); ?></th>
                        <th><?php echo app('translator')->get('admin.users.Rating'); ?></th>
                        <th><?php echo app('translator')->get('admin.users.Wallet_Amount'); ?></th>
                        <th><?php echo app('translator')->get('admin.action'); ?></th>
                    </tr>
                </tfoot>
            </table>
            <?php echo e($users->appends(['search' => $search])->links()); ?> 
        </div> 
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.layout.base', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>