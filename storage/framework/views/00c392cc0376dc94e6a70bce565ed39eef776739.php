<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">

    <title><?php echo $__env->yieldContent('title'); ?><?php echo e(Setting::get('site_title', 'Tranxit')); ?></title>
    <link rel="shortcut icon" type="image/png" href="<?php echo e(Setting::get('site_icon')); ?>"/>


    <!-- Styles -->
    <link href="/css/app.css" rel="stylesheet">
    <link href="<?php echo e(asset('asset/css/bootstrap.min.css')); ?>" rel="stylesheet">
    <link href="<?php echo e(asset('asset/font-awesome/css/font-awesome.min.css')); ?>" rel="stylesheet">
    <link href="<?php echo e(asset('asset/css/style.css')); ?>" rel="stylesheet">

    <!-- Scripts -->
    <script>
        window.Laravel = <?php echo json_encode([
            'csrfToken' => csrf_token(),
        ]); ?>
    </script>
</head>
<body>
    <div class="full-page-bg" style="background-image: url(<?php echo e(asset('asset/img/login-bg.jpg')); ?>);">
        <div class="log-overlay"></div>
            <div class="full-page-bg-inner">
                <div class="row no-margin">
                    <div class="col-md-6 log-left">
                        <span class="login-logo" style="background-color: white;"><img src="<?php echo e(Setting::get('site_logo', asset('logo-black.png'))); ?>" style="height: 79px;"></span>
                        <h2><?php echo e(Setting::get('site_title','Tranxit')); ?> needs partners like you.</h2>
                        <p>Drive with <?php echo e(Setting::get('site_title','Tranxit')); ?> and earn great money as an independent contractor. Get paid weekly just for helping our community of riders get rides around town. Be your own boss and get paid in fares for driving on your own schedule.</p>
                    </div>
                    <div class="col-md-6 log-right">
                        <div class="login-box-outer">
                            <div class="login-box row no-margin">
                                <?php echo $__env->yieldContent('content'); ?>
                            </div>
                            <div class="log-copy"><p class="no-margin"><?php echo e(Setting::get('site_copyright', '&copy; '.date('Y').' Appoets')); ?></p></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="<?php echo e(asset('asset/js/jquery.min.js')); ?>"></script>
    <script src="<?php echo e(asset('asset/js/bootstrap.min.js')); ?>"></script>
    <script src="<?php echo e(asset('asset/js/scripts.js')); ?>"></script>

    <?php echo $__env->yieldContent('scripts'); ?>
    
    <?php if(Setting::get('demo_mode', 0) == 1): ?>
        <!-- Start of LiveChat (www.livechatinc.com) code -->
        <script type="text/javascript">
            window.__lc = window.__lc || {};
            window.__lc.license = 8256261;
            (function() {
                var lc = document.createElement('script'); lc.type = 'text/javascript'; lc.async = true;
                lc.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'cdn.livechatinc.com/tracking.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(lc, s);
            })();
        </script>
        <!-- End of LiveChat code -->
    <?php endif; ?>
</body>
</html>
