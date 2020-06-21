<div class="modal-dialog modal-lg">
 <div class="modal-content">
  <div class="modal-body">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
<div class="row">
<div class="col-sm-12">
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
		<form action="" method="post" enctype="multipart/form-data" class="form-horizontal candidate-single">
			<div class="form-group">
				<div class="col-sm-5">
					<img src="<?php echo $thumb?>" alt="my_profile" title="my_profile" class="img-responsive">
				</div>
				<div class="col-sm-7">
					<div class="matter">
						<label><?php echo $entry_fullname;?></label>
						<span><?php echo $fullname;?></span>
					</div>	
					<div class="matter">
						<label><?php echo $entry_gender;?></label>
						<span><?php echo $gender; ?></span>
					</div>	
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12">
					<div class="matter">
						<label><?php echo $entry_birth_date; ?></label>
						<span><?php echo $date_of_birth;?></span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12">
					<div class="matter">
						<label><?php echo $entry_country; ?></label>
						<span><?php echo $country; ?></span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12">
					<div class="matter">
						<label><?php echo $entry_zone; ?></label>
						<span><?php echo $zone; ?></span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12">
					<div class="matter">
						<label><?php echo $entry_city; ?></label>
						<span><?php echo $city; ?></span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12">
					<div class="matter">
						<label><?php echo $entry_address; ?></label>
						<span><?php echo $address; ?></span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12">
					<div class="matter">
						<label><?php echo $entry_pincode; ?></label>
						<span><?php echo $pincode; ?></span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12">
					<div class="matter">
						<label><?php echo $entry_mobile; ?></label>
						<span><?php echo $mobile_phone; ?></span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12">
					<div class="matter">
						<label><?php echo $entry_home_phone;?></label>
						<span><?php echo $home_phone; ?></span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12">
					<div class="matter">
						<label><?php echo $entry_profissional; ?></label>
						<span><?php echo $profissional; ?></span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12">
					<div class="matter">
						<label><?php echo $entry_experience; ?></label>
						<span><?php echo $experience; ?></span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12">
					<div class="matter">
						<label><?php echo $entry_education; ?></label>
						<table class="table">
							<tr>
								<td><b><?php echo $entry_degree ?></b></td>
								<td><b><?php echo $entry_collage; ?></b></td>
								<td><b><?php echo $entry_passed; ?></b></td>
								<td><b><?php echo $entry_percentage ?></b></td>
							</tr>
							<?php if(isset($educations)){?>
							<?php foreach ($educations as $education) { ?>
							<tr>
								<td><?php echo $education['degree']; ?></td>
								<td><?php echo $education['collage']; ?></td>
								<td><?php echo $education['passed_year']; ?></td>
								<td><?php echo $education['percentage']; ?></td>
							</tr>
							<?php } ?>
								<?php } ?>
						</table>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12">
					<div class="matter">
						<label><?php echo $entry_my_information; ?></label>
							<table class="table">
							<tr>
								<td><?php echo $entry_interest; ?></td>
								<td class="bor"><?php echo $interest; ?></td>
							</tr>
							<tr>
								<td><?php echo $entry_career; ?></td>
								<td class="bor"><?php echo $career; ?></td>
							</tr>
							<tr>
								<td><?php echo $entry_achievement; ?></td>
								<td class="bor"><?php echo $achievement; ?></td>
							</tr>	
						</table>
					</div>
				</div>
			</div>
           <?php if(!empty($Logged)){ ?>
			<div class="button">
				<div class="pull-left">
					<button type="submit" value="Submit" class="btn btn-primary btnus"><?php echo $button_contact; ?></button>
				</div>
				<div class="pull-right">
				 <?php if(!empty($resumecv)){ ?>	
				   <a href="<?php echo $resumecv;?>" target="_blank" class="btn btn-primary btnus" download><?php echo $button_download; ?></a>

                   <?php } ?>
				</div>
			</div>
			<?php } ?>
      </form>
      <br/>
</div>
 </div>
</div>
</div>
</div>