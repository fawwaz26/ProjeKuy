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
      <p><?php echo $text_account_already; ?></p>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset id="account">
          <legend><?php echo $text_your_details; ?></legend>
          <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-package-title">
                  <?php echo $entry_full_name;?>
                </label>
                <div class="col-sm-10">
                  <input type="text" name="full_name" value="" placeholder="<?php echo $entry_full_name;?>" id="input-package-titl" class="form-control"/>
									<?php if ($error_full_name) { ?>
                  <div class="text-danger"><?php echo $error_full_name; ?></div>
									<?php } ?>
                </div>
              </div>
							
							<div class="form-group required">
                <label class="col-sm-2 control-label" for="input-package-title">
                  <?php echo $entry_company_name;?></label>
                <div class="col-sm-10">
                  <input type="text" name="company_name" value="" placeholder="<?php echo $entry_company_name;?>" id="input-package-titl" class="form-control"/>
									<?php if ($error_company_name) { ?>
                  <div class="text-danger"><?php echo $error_company_name; ?></div>
									<?php } ?>
								</div>
              </div>
							
							<div class="form-group required">
                <label class="col-sm-2 control-label" for="input-package-title">
                  <?php echo $entry_email;?></label>
                <div class="col-sm-10">
                  <input type="text" name="email" value="" placeholder="<?php echo $entry_email;?>" id="input-package-titl" class="form-control"/>
									<?php if ($error_email) { ?>
                  <div class="text-danger"><?php echo $error_email; ?></div>
									<?php } ?>
                </div>
              </div>
	
							<div class="form-group required">
                <label class="col-sm-2 control-label" for="input-package-title">
                  <?php echo $entry_landline_phone;?></label>
                <div class="col-sm-10">
                  <input type="text" name="landline_phone" value="" placeholder="<?php echo $entry_landline_phone;?>" id="input-package-titl" class="form-control"/>
									<?php if ($error_landline_phone) { ?>
                  <div class="text-danger"><?php echo $error_landline_phone; ?></div>
									<?php } ?>
                </div>
              </div>
							
							<div class="form-group required">
                <label class="col-sm-2 control-label" for="input-package-title">
                  <?php echo $entry_cell_phone;?></label>
                <div class="col-sm-10">
                  <input type="text" name="cell_phone" value="" placeholder="<?php echo $entry_cell_phone;?>" id="input-package-titl" class="form-control"/>
									<?php if ($error_cell_phone) { ?>
                  <div class="text-danger"><?php echo $error_cell_phone; ?></div>
									<?php } ?>
                </div>
              </div>
							
        </fieldset>
        <fieldset id="address">
				<legend><?php echo $text_your_address; ?></legend>
          <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-package-title">
                  <?php echo $entry_fax;?></label>
                <div class="col-sm-10">
                  <input type="text" name="fax" value="" placeholder="<?php echo $entry_fax;?>" id="input-package-titl" class="form-control"/>
									<?php if ($error_fax) { ?>
                  <div class="text-danger"><?php echo $error_fax; ?></div>
									<?php } ?>
                </div>
              </div>
							
							<div class="form-group required">
                <label class="col-sm-2 control-label" for="input-package-title">
                  <?php echo $entry_address;?></label>
                <div class="col-sm-10">
                  <textarea type="text" name="address" value="" placeholder="<?php echo $entry_address;?>" id="input-package-titl" class="form-control"></textarea>
									<?php if ($error_address) { ?>
                  <div class="text-danger"><?php echo $error_address; ?></div>
									<?php } ?>
                </div>
              </div>
							
					
							
							<div class="form-group required">
            <label class="col-sm-2 control-label" for="input-country"><?php echo $entry_country; ?></label>
            <div class="col-sm-10">
              <select name="country_id" id="input-country" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($countries as $country) { ?>
                <?php if ($country['country_id'] == $country_id) { ?>
                <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
              <?php if ($error_country) { ?>
              <div class="text-danger"><?php echo $error_country; ?></div>
              <?php } ?>
            </div>
          </div>

          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-zone"><?php echo $entry_zone; ?></label>
            <div class="col-sm-10">
              <select name="zone_id" id="input-zone" class="form-control">
              </select>
              </div>
            </div>
							
							<div class="form-group required">
                <label class="col-sm-2 control-label" for="input-package-city">
                  <?php echo $entry_city;?></label>
                <div class="col-sm-10">
                  <input type="text" name="city" value="" placeholder="<?php echo $entry_city;?>" id="input-package-titl" class="form-control"/>
									<?php if ($error_city) { ?>
                  <div class="text-danger"><?php echo $error_city; ?></div>
									<?php } ?>
                </div>
              </div>
							
							<div class="form-group required">
                <label class="col-sm-2 control-label" for="input-package-pincode">
                  <?php echo $entry_pincode;?></label>
                <div class="col-sm-10">
                  <input type="text" name="pincode" value="" placeholder="<?php echo $entry_pincode;?>" id="input-package-titl" class="form-control"/>
									<?php if ($error_pincode) { ?>
                  <div class="text-danger"><?php echo $error_pincode; ?></div>
									<?php } ?>
                </div>
              </div>
							
							<div class="form-group required">
                <label class="col-sm-2 control-label" for="input-package-website">
                  <?php echo $entry_company_website;?></label>
                <div class="col-sm-10">
                  <input type="text" name="company_website" value="" placeholder="<?php echo $entry_company_website;?>" id="input-package-titl" class="form-control"/>
									<?php if ($error_company_website) { ?>
                  <div class="text-danger"><?php echo $error_company_website; ?></div>
									<?php } ?>
                </div>
              </div>
							
							<div class="form-group required">
                <label class="col-sm-2 control-label" for="input-package-employees">
                  <?php echo $entry_no_of_employees;?></label>
                <div class="col-sm-10">
                  <input type="text" name="no_employees" value="" placeholder="<?php echo $entry_no_of_employees;?>" id="input-package-titl" class="form-control"/>
									<?php if ($error_no_of_employees) { ?>
                  <div class="text-danger"><?php echo $error_no_of_employees; ?></div>
									<?php } ?>
                </div>
              </div>
							
							<div class="form-group required">
                <label class="col-sm-2 control-label" for="input-package-description">
                  <?php echo $entry_company_description;?></label>
                <div class="col-sm-10">
                  <input type="text" name="company_description" value="" placeholder="<?php echo $entry_company_description;?>" id="input-package-titl" class="form-control"/>
									<?php if ($error_company_description) { ?>
                  <div class="text-danger"><?php echo $error_company_description; ?></div>
									<?php } ?>
                </div>
              </div>
							
							<div class="form-group required">
                <label class="col-sm-2 control-label" for="input-package-companylogo">
                  <?php echo $entry_company_logo;?></label>
                <div class="col-sm-10">
                  <input type="text" name="company_logo" value="" placeholder="<?php echo $entry_company_logo;?>" id="input-package-titl" class="form-control"/>
									<?php if ($error_company_logo) { ?>
                  <div class="text-danger"><?php echo $error_company_logo; ?></div>
									<?php } ?>
                </div>
							</div>	
        </fieldset>
				<fieldset>
          <legend><?php echo $text_your_password; ?></legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
            <div class="col-sm-10">
              <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
              <?php if ($error_password) { ?>
              <div class="text-danger"><?php echo $error_password; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-confirm"><?php echo $entry_confirm_password; ?></label>
            <div class="col-sm-10">
              <input type="password" name="confirm_password" value="" placeholder="<?php echo $entry_confirm_password; ?>" id="input-confirm" class="form-control" />
              <?php if ($error_confirm_password) { ?>
              <div class="text-danger"><?php echo $error_confirm_password; ?></div>
              <?php } ?>
            </div>
          </div>
        </fieldset>
        <?php if ($text_agree) { ?>
        <div class="buttons">
          <div class="pull-right"><?php echo $text_agree; ?>
            <?php if ($agree) { ?>
            <input type="checkbox" name="agree" value="1" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="agree" value="1" />
            <?php } ?>
            &nbsp;
            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
          </div>
        </div>
        <?php } else { ?>
        <div class="buttons">
          <div class="pull-right">
            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
          </div>
        </div>
        <?php } ?>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
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
<script type="text/javascript"><!--
$('select[name=\'country_id\']').on('change', function() {
  $.ajax({
    url: 'index.php?route=company/register/country&country_id=' + this.value,
    dataType: 'json',
    beforeSend: function() {
      $('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
    },
    complete: function() {
      $('.fa-spin').remove();
    },
    success: function(json) {
      if (json['postcode_required'] == '1') {
        $('input[name=\'postcode\']').parent().parent().addClass('required');
      } else {
        $('input[name=\'postcode\']').parent().parent().removeClass('required');
      }

      html = '<option value=""><?php echo $text_select; ?></option>';

      if (json['zone'] && json['zone'] != '') {
        for (i = 0; i < json['zone'].length; i++) {
          html += '<option value="' + json['zone'][i]['zone_id'] + '"';

          if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
            html += ' selected="selected"';
          }

          html += '>' + json['zone'][i]['name'] + '</option>';
        }
      } else {
        html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
      }

      $('select[name=\'zone_id\']').html(html);
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});

$('select[name=\'country_id\']').trigger('change');
//--></script>