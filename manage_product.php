<div class="col-lg-4">
			<form action="" id="manage-product">
				<div class="card">
					<div class="card-header">
						    Product Form
				  	</div>
					<div class="card-body">
							<input type="hidden" name="id">
							<div class="form-group">
								<label class="control-label">SKU</label>
								<input type="text" class="form-control" name="sku" value="<?php echo $sku ?>">
							</div>
							
					</div>
					<div class="card-body">
					<div class="form-group">
							<label class="control-label">Item Category</label>
							<select name="category_id" id="" class="custom-select browser-default select2">
								<option></option>
							<?php 

							$cat = $conn->query("SELECT * FROM item_categories order by item_category_name asc");
							while($row=$cat->fetch_assoc()):
								$type_arr[$row['item_category_id']] = $row['item_category_name'];
							?>
								<option value="<?php echo $row['item_category_id'] ?>"><?php echo $row['item_category_name'] ?></option>
							<?php endwhile; ?>
							</select>
						</div>
						<div class="form-group">
							<label class="control-label">Item Group</label>
							<select name="group_id" id="" class="custom-select browser-default select2">
							<option></option>
							<?php 
							$cat = $conn->query("SELECT * FROM drug_group order by drug_group_name asc");
							while($row=$cat->fetch_assoc()):
								$cat_arr[$row['drug_group_id']] = $row['drug_group_name'];
							?>
								<option value="<?php echo $row['drug_group_id'] ?>"><?php echo $row['drug_group_name'] ?></option>
							<?php endwhile; ?>
							</select>
						</div>
						<div class="form-group">
							<label class="control-label">Item Units</label>
							<select name="units" id="" class="custom-select browser-default select2">
								<option></option>
							<?php 
							$cat = $conn->query("SELECT * FROM item_units order by item_units_name asc");
							while($row=$cat->fetch_assoc()):
								$type_arr[$row['item_units_id']] = $row['item_units_name'];
							?>
								<option value="<?php echo $row['item_units_id'] ?>"><?php echo $row['item_units_name'] ?></option>
							<?php endwhile; ?>
							</select>
						</div>
						<div class="form-group">
							<label class="control-label">Item Name</label>
							<input type="text" class="form-control" name="name"  required="">
						</div>
						<div class="form-group">
							<label class="control-label">Measurement</label>
							<input type="text" class="form-control" name="measurement"  required="">
						</div>
						<div class="form-group">
							<label class="control-label">Description</label>
							<textarea class="form-control" cols="30" rows="3" name="description" ></textarea>
						</div>
						<div class="form-group invoo" >
							<label class="control-label">Product Price</label>
							<input type="number" step="any" class="form-control text-right" name="price" >
						</div>
						<div class="form-group invoo">
							<label class="control-label">Wholesale Price</label>
							<input type="number" step="any" class="form-control text-right" name="wholesale_price" >
						</div>	
						<div class="form-group">
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="1" id="prescription" name="prescription" >
							  <label class="form-check-label" for="prescription">
							    Medicine requires prescription.
							  </label>
							</div>
						</div>	
					</div>
					<div class="card-footer">
						<div class="row">
							<div class="col-md-12">
								<button type="submit" class="btn btn-sm btn-primary col-sm-3 offset-md-3"> Save</button>
								<button class="btn btn-sm btn-default col-sm-3" type="button" onclick="frm_reset()"> Cancel</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			</div>