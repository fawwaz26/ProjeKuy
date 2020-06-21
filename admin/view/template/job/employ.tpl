<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-information" id="btnSubmit" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary">
          <i class="fa fa-save">
          </i>
        </button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default">
          <i class="fa fa-reply">
          </i>
        </a>
      </div>
      <h1>
        <?php echo $heading_title; ?>
      </h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li>
          <a href="<?php echo $breadcrumb['href']; ?>">
            <?php echo $breadcrumb['text']; ?>
          </a>
        </li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
<div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
    <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-information" class="form-horizontal">
		
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-package-title"><?php echo $entry_fullname;?></label>
				<div class="col-sm-10">
					<input type="text" name="fullname" value="<?php echo $fullname;?>" placeholder="<?php echo $entry_fullname;?>" id="input-package-titl" class="form-control" >
					<?php if ($error_fullname) { ?>
					<div class="text-danger"><?php echo $error_fullname; ?></div>
					<?php } ?>
				</div>
			</div>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-package-title"><?php echo $entry_email;?></label>
				<div class="col-sm-10">
					<input type="text" name="email" value="<?php echo $email;?>" placeholder="<?php echo $entry_email;?>" id="input-package-titl" class="form-control">
					<?php if ($error_email) { ?>
					<div class="text-danger"><?php echo $error_email; ?></div>
					<?php } ?>
				</div>
			</div>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-package-title">
					<?php echo $entry_password;?>
				</label>
				<div class="col-sm-10">
					<input type="password" id="txtPassword" name="password" value="" placeholder="<?php echo $entry_password;?>" id="input-package-titl" class="form-control"/>
					<?php if ($error_password) { ?>
					<div class="text-danger"><?php echo $error_password; ?></div>
					<?php } ?>
				</div>
			</div>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-package-title"><?php echo $entry_confirm_password;?></label>
				<div class="col-sm-10">
					<input type="password" name="confirm_password" value="" placeholder="<?php echo $entry_confirm_password;?>" id="txtConfirmPassword" class="form-control">
					<?php if ($error_confirm_password) { ?>
					<div class="text-danger"><?php echo $error_confirm_password; ?></div>
					<?php } ?>
				</div>
			</div>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="gender">
					<?php echo $entry_gender;?>
				</label>
				<div class="col-sm-10">
					<select class="form-control" value="" id="gender" name="gender">
						<option value="1" <?php if(isset($gender) && $gender==1) { echo "selected"; }?>><?php echo $text_male?></option>
						<option value="0" <?php if(isset($gender) && $gender==0) { echo "selected"; }?>><?php echo $text_female?></option>
					</select>
					<?php if ($error_gender) { ?>
					<div class="text-danger"><?php echo $error_gender; ?></div>
					<?php } ?>
				</div>	 
			</div>
    <!---->
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="gender">
					<?php echo $entry_jobtype;?>
				</label>
				<div class="col-sm-10">
					<select name="jobtype_id" class="jobtype form-control selectpicker">
					 <option selected="" value="0"><?php echo $text_select; ?></option>
					   <option <?php if($jobtype_id==1) { echo "selected"; }  ?> value="1"><?php echo $entry_partime; ?></option>
				   	<option  <?php if($jobtype_id==2) { echo "selected"; } ?> value="2"><?php echo $entry_fultime; ?>
				   	</option>
					</select>
					
				</div>	 
			</div>


			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-package-title"><?php echo $entry_jobcategoty;?></label>
				<div class="col-sm-10">
					<input class="form-control" id="input-job" placeholder="e.g. PHP, Web designer, Manager *" value="<?php echo $cat_name ?>" name="jobcategory" type="text">
					<input type="hidden" name="category_id" value="<?php echo $category_id ?>">
				</div>
			</div>

			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-package-title"><?php echo $entry_aboutself;?></label>
				<div class="col-sm-10">	
					<textarea  name="about_self"  placeholder="<?php echo $entry_aboutself;?>" id="input-about_self" class="form-control"><?php echo $about_self;?></textarea>
				</div>
			</div>
        <!---->
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-date-available"><?php echo $entry_birth_date; ?></label>
				<div class="col-sm-3">
					<div class="input-group date">
						<input type="text" name="date_of_birth" value="<?php echo $date_of_birth;?>" placeholder="<?php echo $entry_birth_date; ?>" data-date-format="YYYY-MM-DD" id="input-date-available" class="form-control" />
						<span class="input-group-btn">
						<button class="btn btn-default" id="btnSubmit" type="button"><i class="fa fa-calendar"></i></button>
						</span>
					</div>
					<?php if ($error_date_of_birth) { ?>
					<div class="text-danger"><?php echo $error_date_of_birth; ?></div>
					<?php } ?>
				</div>
			</div>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-package-title"><?php echo $entry_address;?></label>
				<div class="col-sm-10">
					<textarea name="address"  placeholder="<?php echo $entry_address; ?>"  class="form-control" ><?php echo $address;?></textarea>
					<?php if ($error_address) { ?>
					<div class="text-danger"><?php echo $error_address; ?></div>
					<?php } ?>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"><?php echo $entry_image; ?></label>
				<div class="col-sm-10"><a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
					<input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-customer"><?php echo $entry_country; ?></label>
				<div class="col-sm-10">
					<select  name="country_id" id="input-country_id" class="form-control">
						<option value=""><?php echo $text_select?></option>
						<?php foreach($countrys as $result){ ?>
						<option value="<?php echo $result['country_id']; ?>" <?php if(isset($country_id) && $country_id==$result['country_id']) { echo "selected"; }?>><?php echo $result['name']; ?></option> 
						<?php } ?>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-customer"><?php echo $entry_state; ?></label>
				<div class="col-sm-10">
					<select  name="zone_id" id="input-zone_id" class="form-control">
						<option value=""><?php echo $text_select?></option>
						<?php foreach($zone as $result){ ?>
						<option value="<?php echo $result['zone_id']; ?>" <?php if(isset($zone_id) && $zone_id==$result['zone_id']) { echo "selected"; }?>><?php echo $result['name']; ?></option> 
						<?php } ?>
					</select>
				</div>
			</div>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-package-title"><?php echo $entry_city;?></label>
				<div class="col-sm-10">
					<input type="text" name="city" value="<?php echo $city;?>" placeholder="<?php echo $entry_city;?>" id="input-package-titl" class="form-control">
					<?php if ($error_city) { ?>
					<div class="text-danger"><?php echo $error_city; ?></div>
					<?php } ?>
			    </div>
			</div>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-package-title"><?php echo $entry_pincode;?></label>
				<div class="col-sm-10">
					<input type="text" name="pincode" value="<?php echo $pincode;?>" placeholder="<?php echo $entry_pincode;?>" id="input-package-titl" class="form-control">
					<?php if ($error_pincode) { ?>
					<div class="text-danger"><?php echo $error_pincode; ?></div>
					<?php } ?>
				</div>
			</div>
			
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-package-title"><?php echo $entry_mobile_phone;?></label>
				<div class="col-sm-10">
					<input type="text" name="mobile_phone" value="<?php echo $mobile_phone;?>" placeholder="<?php echo $entry_mobile_phone;?>" id="input-package-titl" class="form-control">
					<?php if ($error_mobile_phone) { ?>
				    <div class="text-danger"><?php echo $error_mobile_phone; ?></div>
					<?php } ?>
				</div>
			</div>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-package-title"><?php echo $entry_home_phone;?></label>
				<div class="col-sm-10">
					<input type="text" name="home_phone" value="<?php echo $home_phone;?>" placeholder="<?php echo $entry_home_phone;?>" id="input-package-titl" class="form-control">
					 <?php if ($error_home_phone) { ?>
					<div class="text-danger"><?php echo $error_home_phone; ?></div>
					<?php } ?>
				</div>
			</div>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-package-title"><?php echo $entry_experience;?></label>
				<div class="col-sm-10">
					<input type="text" name="experience" value="<?php echo $experience;?>" placeholder="<?php echo $entry_experience;?>" id="input-package-titl" class="form-control">
					<?php if ($error_experience) { ?>
					<div class="text-danger"><?php echo $error_experience; ?></div>
					<?php } ?>
				</div>
			</div>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-package-title"><?php echo $entry_profissional;?></label>
				<div class="col-sm-10">
					<input type="text" name="profissional" value="<?php echo $profissional;?>" placeholder="<?php echo $entry_profissional;?>" id="input-package-titl" class="form-control">
					<?php if ($error_profissional) { ?>
					<div class="text-danger"><?php echo $error_profissional; ?></div>
					<?php } ?>
				</div>
			</div>

			<div class="form-group required">
			<label class="col-sm-2" for="input-package-title"><?php echo $entry_additional;?></label>
			<div class="col-sm-10">
				<input type="text" name="interest" value="<?php echo $interest; ?>" placeholder="<?php echo $entry_interest;?>" id="input-additional" class="form-control">
				<input type="text" name="career" value="<?php echo $career; ?>" placeholder="<?php echo $entry_career;?>" id="input-additional" class="form-control">

				<input type="text" name="achievement" value="<?php echo $achievement; ?>" placeholder="<?php echo $entry_achievement;?>" id="input-additional" class="form-control">


				
			</div>
		</div>

		<div class="form-group required">
						<label class="col-sm-2 control-label" for="status">
							<?php echo $entry_status;?>
						</label>
						<div class="col-sm-10">
							<select name="status" id="input-status" class="form-control">
								<?php if ($status) { ?>
								<option value="1" selected="selected"><?php echo $text_enable; ?></option>
								<option value="0"><?php echo $text_disable; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enable; ?></option>
								<option value="0" selected="selected"><?php echo $text_disable; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
			


			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-package-title"><?php echo $entry_education;?></label>
				<div class="col-sm-10">
				<?php foreach ($languages as $language) { ?>
				<div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
					<table id="educations<?php echo $language['language_id']; ?>" class="table table-striped">
						<thead>
							<tr>
								<td class="text-left"><?php echo $entry_degree; ?></td>
								<td class="text-left"><?php echo $entry_collage; ?></td>
								<td class="text-left"><?php echo $entry_passed; ?></td>
								<td class="text-left"><?php echo $entry_percentage; ?></td>
								<td class="text-left"><?php echo $entry_button; ?></td>
							</tr>
						</thead>
						<tbody>
							<?php $education_row = 0; ?>
							<?php if (isset($education_rowss[$language['language_id']])) { ?>
							<?php foreach ($education_rowss[$language['language_id']] as $education_rows) { ?>
							<tr id="education-row<?php echo $education_row; ?>">
								<td class="text-left">
									<input name="education_rows[<?php echo $language['language_id']; ?>][<?php echo $education_row; ?>][degree]" value="<?php echo $education_rows['degree']; ?>" class="form-control">
								</td>
								
								<td class="text-left">
									<input name="education_rows[<?php echo $language['language_id']; ?>][<?php echo $education_row; ?>][collage]" value="<?php echo $education_rows['collage']; ?>" class="form-control">
								</td>
								
								<td class="text-left">
									<input name="education_rows[<?php echo $language['language_id']; ?>][<?php echo $education_row; ?>][passed_year]" value="<?php echo $education_rows['passed_year']; ?>" class="form-control">
								</td>
								
								<td class="text-left">
									<input name="education_rows[<?php echo $language['language_id']; ?>][<?php echo $education_row; ?>][percentage]" value="<?php echo $education_rows['percentage']; ?>" class="form-control">
								</td>
								 <td class="text-left">
									<button type="button" onclick="$('#education-row<?php echo $education_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
								</td>
							</tr>
							<?php $education_row++; ?>
							<?php } ?>
									<?php } ?>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="3"></td>
								<td class="text-right"><button type="button" onclick="addAducation('<?php echo $language['language_id']; ?>');" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			<?php } ?>
			</div>
		</div>		

		</form>
    </div>
</div>
  </div>
  <script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
  <script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>  
  <script type="text/javascript"><!--
$('#language a:first').tab('show');
//--></script>

<script type="text/javascript"><!--
var education_row = <?php echo $education_row; ?>;
function addAducation(language_id) {
	html  = '<tr id="education-row' + education_row + '">';
	
	html += '<td class="text-right"><input name="education_rows[' + language_id + '][' + education_row + '][degree]" placeholder="<?php echo $entry_degree; ?>" class="form-control"></td>';
	
	html += '<td class="text-right"><input name="education_rows[' + language_id + '][' + education_row + '][collage]" placeholder="<?php echo $entry_collage; ?>" class="form-control"></td>';
	
	html += '<td class="text-right"><input name="education_rows[' + language_id + '][' + education_row + '][passed_year]" placeholder="<?php echo $entry_passed; ?>" class="form-control"></td>';
  	
	html += '<td class="text-right"><input name="education_rows[' + language_id + '][' + education_row + '][percentage]" placeholder="<?php echo $entry_percentage; ?>" class="form-control"></td>';
	
	html += '<td class="text-left"><button type="button" onclick="$(\'#education-row' + education_row  + ', .tooltip\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';
	
   $('#educations' + language_id + ' tbody').append(html);
  education_row++;
}
//--></script>



<script type="text/javascript"><!--
$('.date').datetimepicker({
pickTime: false
});

$('.time').datetimepicker({
pickDate: false
});

$('.datetime').datetimepicker({
pickDate: true,
pickTime: true
});
//--></script>
 <script type="text/javascript">
    $(function () {
        $("#btnSubmit").click(function () {
            var password = $("#txtPassword").val();
            var confirmPassword = $("#txtConfirmPassword").val();
            if (password != confirmPassword) {
                alert("Passwords do not match.");
                return false;
            }
            return true;
        });
    });
</script>

<script type="text/javascript">
$('input[name=\'jobcategory\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=job/employ/autocompletecategory&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
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
<?php echo $footer; ?></div>