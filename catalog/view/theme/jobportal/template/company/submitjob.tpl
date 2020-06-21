<?php echo $header; ?>
<div class="top-breadcrumb">
	<div class="container">
		<h1><?php echo $heading_title; ?></h1>
		<ul class="breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
			<?php } ?>
		</ul>
	</div>
</div>	
<div class="submit-job-form">
<div class="container">
<?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>	
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
	<!-- submit-form start here -->
		<div class="submit-form">
			<div class="border"></div>
			<div class="border1"></div>
			<form class="form-horizontal" method="post" action="<?php echo $action ?>">
				<fieldset>
					<div class="form-group">
						<div class="col-sm-6">
							<label><?php echo $entry_youremail ?></label>
							<input class="form-control" id="input-email" placeholder="you@yourdomain.com *" value="<?php echo $companyemail ?>" name="email" type="text">
							<?php if ($error_email) { ?>
							<div class="text-danger"><?php echo $error_email; ?></div>
							<?php } ?>
						</div>
						<div class="col-sm-6">
							<label><?php echo $entry_jobtitle ?></label>
							<input class="form-control" placeholder="" id="input-jobtitle" value="<?php echo $title ?>" name="title"  type="text">
							<?php if ($error_title) { ?>
							<div class="text-danger"><?php echo $error_title; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-6">
							<label><?php echo $entry_location; ?> <?php echo $entry_optional; ?> </label>
							<input class="form-control" id="input-location" placeholder="e.g. Canada *" value="<?php echo $location ?>" name="location" type="text">
						</div>
						<div class="col-sm-6">
							<label><?php echo $entry_jobtype; ?></label>
							<select name="jobtype_id" class="jobtype form-control selectpicker">
								<option selected="" value="0"><?php echo $text_select; ?></option>
								<option <?php if($jobtype_id==1) { echo "selected"; }  ?> value="1"><?php echo $entry_partime; ?></option>
								<option  <?php if($jobtype_id==2) { echo "selected"; } ?> value="2"><?php echo $entry_fultime; ?></option>
							</select>
							<?php if ($error_jobtype_id) { ?>
							<div class="text-danger"><?php echo $error_jobtype_id; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-6">
							<label><?php echo $entry_jobcategory; ?></label>
							<input class="form-control" id="input-job" placeholder="apakek*" value="<?php echo $cat_name ?>" name="jobcategory" type="text">
							<?php if ($error_jobcategory) { ?>
							<div class="text-danger"><?php echo $error_jobcategory; ?></div>
							<?php } ?>
						</div>
						<input type="hidden" name="category_id" value="<?php echo $category_id ?>">
						<div class="col-sm-6">
							<label><?php echo $entry_salary; ?></label>
							<input class="form-control" placeholder=" e.g. Rp Gratis wkwk *" id="input-salary" value="<?php echo $salary ?>" name="salary" type="text">
							<?php if ($error_salary) { ?>
							<div class="text-danger"><?php echo $error_salary; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-6">
							<label><?php echo $entry_description; ?></label>
							<textarea class="form-control" id="input-enquiry" rows="10" name="description" placeholder="Your message *"><?php echo $description ?></textarea>
							<?php if ($error_description) { ?>
							<div class="text-danger"><?php echo $error_description; ?></div>
							<?php } ?>
						</div>
						<div class="col-sm-6">

				        <div class="form-group">
						  <label class="col-sm-12" for="input-company-image"><?php echo $entry_banner; ?></label>
							<div class="col-md-12 col-sm-12 col-xs-12 file text-center ">
								<div class="imagebox">
								<span id="thumb-image"><img src="<?php echo $thumb; ?>" alt="" title="" height="75" width="75" 	/></span>
								</div>
								 <button type="button" id="button-upload" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?>
								</button>
								<input type="hidden" name="banner" value="<?php echo $banner; ?>" id="input-image" />
																	
							</div>	
						</div>
						</div>
					</div>
					<input type="hidden" name="company_id" value="<?php echo $company_id ?>">
					
					<div class="col-md-12 col-sm-12 col-xs-12 file text-center "></div>
                   <div class="form-group">
					<div class="col-sm-12">
							<label><?php echo $entry_tagline ?> <?php echo $entry_optional; ?> </label>
							<input class="form-control" placeholder="Berikan Kata Kata Penyemangat! *" id="input-tagline" value="<?php echo $tag; ?>" name="tag" type="text">
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-12">
							<label><?php echo $entry_url; ?></label>
							<input class="form-control" id="input-url" placeholder="Enter an email address or website URL *" value="<?php echo $url ?>" name="url" type="text">
							
						</div>
					</div>



						<div class="form-group">
						<div class="col-sm-12">
							<label><?php echo $entry_experience; ?></label>
							<input class="form-control" id="input-experience" placeholder="<?php echo $entry_experience; ?>" value="<?php echo $experience ?>" name="experience" type="text">
						
						</div>
					</div>


                  <div class="hide">
					<h5><?php echo $entry_company_details ?></h5>
					<div class="form-group">
						<div class="col-sm-4">
							<label><?php echo $entry_company_name ?></label>
							<input class="form-control" placeholder=" Enter the company name *" id="input-company" value="<?php echo $company_name; ?>" name="company_name"  type="text">
							
						</div>
						<div class="col-sm-4">
							<label><?php echo $entry_website ?><?php echo $entry_optional; ?> </label>
							<input class="form-control" placeholder=" http:// *" id="input-website" value="<?php echo $company_website; ?>" name="website" type="text">
							
						</div>
						
					</div>
					<div class="form-group">
						<div class="col-sm-6">
							<label><?php echo $entry_description ?></label>
							<textarea class="form-control" id="input-desc" rows="10" name="enquiry" placeholder="Your message *"></textarea>
							
						</div>
						<div class="col-sm-6">
							<label><?php echo $entry_socialprofiles ?> <?php echo $entry_optional; ?> </label>
							<div class="fb">
								<i class="fa fa-facebook" aria-hidden="true"></i>
								<input class="form-control pull-right" placeholder="Enter page URL *" id="input-tagline1" value="" name="fb" type="text">
							</div>	
							<div class="twitter">
								<i class="fa fa-twitter" aria-hidden="true"></i>
								<input class="form-control pull-right" placeholder="@ yourcompany *" id="input-tagline2" value="" name="twitter" type="text">
							</div>	
							<div class="google">
								<i class="fa fa-google-plus" aria-hidden="true"></i>
								<input class="form-control pull-right" placeholder="Enter page URL *" id="input-tagline3" value="" name="gplus" type="text">
							</div>	
						</div>
						</div>
					</div>
					<div class="buttons">
						<button type="submit" value="Submit" class="btn btn-primary btnus"><?php echo $entry_submitjob ?></button>
					</div>
				</fieldset>
			</form>
		</div>
	<!-- submit-form end here -->
     <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
</div>

<script type="text/javascript">
$('input[name=\'jobcategory\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=company/submitjob/autocomplete&filter_name=' +  encodeURIComponent(request),
			type: 'GET',
			dataType: 'json',
			success: function(json) {
				json.unshift({
					category_id: 0,
					name:'<?php echo $text_none; ?>'
				});

				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['category_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'jobcategory\']').val(item['label']);
		$('input[name=\'category_id\']').val(item['value']);
	}
});
</script>
<script type="text/javascript">
			
$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=company/submitjob/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						var imageurl="<?php echo str_replace('http:','',HTTP_SERVER)?>";
						$("#thumb-image").html('<img src="'+imageurl+"image/"+json['location1']+'" alt="" title="" width="100"/>');
						$("#input-image").val(json['location1']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});

</script>


<?php echo $footer; ?>
