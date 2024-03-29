@extends('admin.layout.base')

@section('title', $page)

@section('content')

    <div class="content-area py-1">
        <div class="container-fluid">
            <div class="box box-block bg-white">
            	<h3>{{$page}}</h3>

            	<div style="text-align: center;padding: 20px;color: blue;font-size: 24px;">
            		<p><strong>
            			<span>Over All Earning : {{currency($revenue[0]->overall)}}</span>
            			<br>
            			<span>Over All Commission : {{currency($revenue[0]->commission)}}</span>
            		</strong></p>
            	</div>

            	<div class="row">

	            	<div class="col-lg-4 col-md-6 col-xs-12">
						<div class="box box-block bg-white tile tile-1 mb-2">
							<div class="t-icon right"><span class="bg-danger"></span><i class="ti-rocket"></i></div>
							<div class="t-content">
								<h6 class="text-uppercase mb-1">Total No. of Rides</h6>
								<h1 class="mb-1">{{$rides->count()}}</h1>
								<span class="text-muted font-90">% down from cancelled Request</span>
							</div>
						</div>
					</div>


					<div class="col-lg-4 col-md-6 col-xs-12">
						<div class="box box-block bg-white tile tile-1 mb-2">
							<div class="t-icon right"><span class="bg-success"></span><i class="ti-bar-chart"></i></div>
							<div class="t-content">
								<h6 class="text-uppercase mb-1">Revenue</h6>
								<h1 class="mb-1">{{currency($revenue[0]->overall)}}</h1>
								<i class="fa fa-caret-up text-success mr-0-5"></i><span>from {{$rides->count()}} Rides</span>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 col-xs-12">
						<div class="box box-block bg-white tile tile-1 mb-2">
							<div class="t-icon right"><span class="bg-warning"></span><i class="ti-archive"></i></div>
							<div class="t-content">
								<h6 class="text-uppercase mb-1">Cancelled Rides</h6>
								<h1 class="mb-1">{{$cancel_rides}}</h1>
								<i class="fa fa-caret-down text-danger mr-0-5"></i><span>for @if($cancel_rides == 0) 0.00 @else {{round($cancel_rides/$rides->count(),2)}}% @endif Rides</span>
							</div>
						</div>
					</div>

						<div class="row row-md mb-2" style="padding: 15px;">
							<div class="col-md-12">
									<div class="box bg-white">
										<div class="box-block clearfix">
											<h5 class="float-xs-left">Earnings</h5>
											<div class="float-xs-right">
											</div>
										</div>

										@if(count($rides) != 0)
								            <table class="table table-striped table-bordered dataTable" id="table-2" style="width: 100% !important;">
								                <thead>
								                   <tr>
														<td>Booking ID</td>
														<td>Dated on</td>
														<td>Provider Name</td>
														<td>User Name</td>
														<td>Trip Amount</td>
														<td>GST</td>
														<!-- <td>Toll/Parking</td>
														<td>Deduction</td> -->
														<td>User Paid</td>
														<td>Kal-Taxi Commission</td>
														<!-- <td>TDS</td> -->
														<td>Driver Earning</td>
														<td>Status</td>
														<td>Mode</td>
														<td>Request Details</td>
													</tr>
								                </thead>
								                <tbody>
								                <?php $diff = ['-success','-info','-warning','-danger']; ?>
														@foreach($rides as $index => $ride)
															<tr>
																<td>{{$ride->booking_id}}</td>
																<td>
																	<span class="text-muted">{{date('d M Y',strtotime($ride->created_at))}}</span>
																</td>
																<td>
																	{{@$ride->provider->first_name}}{{@$ride->provider->last_name}}
																</td>
																<td>
																	{{@$ride->user->first_name}}{{@$ride->user->last_name}}
																</td>

																<td>{{currency($ride->payment['total'])}}</td>
																<td>{{currency($ride->payment['tax'])}}</td>
																<td>{{currency($ride->payment['payable'])}}</td>
																<td>{{currency($ride->payment['provider_commission'])}}</td>
																<td>{{currency($ride->payment['provider_pay'])}}</td>  
																<td>
																	@if($ride->status == "COMPLETED")
																		<span class="tag tag-success">{{$ride->status}}</span>
																	@elseif($ride->status == "CANCELLED")
																		<span class="tag tag-danger">{{$ride->status}}</span>
																	@else
																		<span class="tag tag-info">{{$ride->status}}</span>
																	@endif
																</td>
																<td>{{$ride->payment_mode}}</td> 
																<td>
																	@if($ride->status != "CANCELLED")
																		<a class="text-primary" href="{{route('admin.requests.show',$ride->id)}}"><span class="underline">View Ride Details</span></a>
																	@else
																		<span>No Details Found </span>
																	@endif									
																</td>

															</tr>
														@endforeach
															
								                <tfoot>
								                    <tr>
														<td>Booking ID</td>
														<td>Dated on</td>
														<td>Provider Name</td>
														<td>User Name</td>
														<td>Trip Amount</td>
														<td>GST</td>
														<!-- <td>Toll/Parking</td>
														<td>Deduction</td> -->
														<td>User Paid</td>
														<td>Kal-Taxi Commission</td>
														<!-- <td>TDS</td> -->
														<td>Driver Earning</td>
														<td>Status</td>
														<td>Mode</td>
														<td>Request Details</td>
													</tr>
								                </tfoot>
								            </table>
								            @else
								            <h6 class="no-result">No results found</h6>
								            @endif 

									</div>
								</div>

							</div>

            	</div>

            </div>
        </div>
    </div>

@endsection
