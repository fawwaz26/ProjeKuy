<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
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
      <h1><?php echo $heading_title; ?></h1>
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
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
						<option value="">-------- Please Select --------</option>
						<option value="1" <?php if(isset($gender) && $gender=1) { echo "selected"; }?>><?php echo $text_male?></option>
						<option value="0" <?php if(isset($gender) && $gender=0) { echo "selected"; }?>><?php echo $text_female?></option>
					</select>
					<?php if ($error_gender) { ?>
					<div class="text-danger"><?php echo $error_gender; ?></div>
					<?php } ?>
				</div>	 
            </div>
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
			<div class="form-group required">
                <label class="col-sm-2 control-label" for="input-parent"><?php echo $entry_country; ?></label>
                <div class="col-sm-10">
					<select type="text" name="country_id" value="<?php echo $country_id;?>" id="input-parent" class="form-control" >
						<?php foreach($countrys as $result){ ?>
						<option value="<?php echo $result['country_id']; ?>"><?php echo $result['name']; ?></option> 
						<?php } ?>
					</select>
					<?php if ($error_country) { ?>
                    <div class="text-danger"><?php echo $error_country; ?></div>
					<?php } ?>
                </div>
            </div>
			<div class="form-group required">
                <label class="col-sm-2 control-label" for="input-parent"><?php echo $entry_state; ?></label>
                <div class="col-sm-10">
                 <select type="text" name="state_id" value="<?php echo $state_id;?>" id="input-parent" class="form-control" >
								 <?php foreach($zone as $result){ ?>
									<option value="<?php echo $result['zone_id']; ?>"><?php echo $result['name']; ?></option> 
									<?php } ?>
								 </select>
								  <?php if ($error_state) { ?>
              <div class="text-danger"><?php echo $error_state; ?></div>
              <?php } ?>
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
                <label class="col-sm-2 control-label" for="input-parent"><?php echo $entry_nationality; ?></label>
                <div class="col-sm-10">
                 <select type="text" name="nationality_id" value="" id="input-parent" class="form-control" >
								 <?php foreach($nationality as $result){ ?>
									<option value="<?php echo $result['country_id']; ?>"><?php echo $result['name']; ?></option> 
									<?php } ?>
								 </select>
									<?php if ($error_nationality) { ?>
                  <div class="text-danger"><?php echo $error_nationality; ?></div>
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
        <div class="buttons">
          <div class="pull-right">
            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
          </div>
        </div>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
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