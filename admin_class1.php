<?php
session_start();
ini_set('display_errors', 1);
include 'db_connect.php';
Class Action {
	private $db;

	public function __construct() {
		ob_start();
   	include 'db_connect.php';
    
    $this->db = $conn;
	}
	function __destruct() {
	    $this->db->close();
	    ob_end_flush();
	}

	function login(){
		extract($_POST);
		// $sql="SELECT * FROM users where `username` ='".$username."' and `password`='".$password."'";
		// $res=mysqli_query($conn,$sql);
		// if ($res) {
		// 	$row=mysqli_fetch_array($res);
		// 	foreach($row as $key => $value){
		// 		if($key != 'passwors' && !is_numeric($key))
		// 				$_SESSION['login_'.$key] = $value;
		// 	}
		// 	return 1;
		// }else {
		// 	return 2;
		// }
		$qry = $this->db->query("SELECT * FROM users where `username` ='".$username."' and `password`='".$password."'");
		if($qry){
			if($qry->num_rows > 0){
				foreach ($qry->fetch_array() as $key => $value) {
					if($key != 'passwors' && !is_numeric($key))
						$_SESSION['login_'.$key] = $value;
				}
					return 1;
			}
		}else{
			return 3;
		}
	}
	function login2(){
		extract($_POST);
		$qry = $this->db->query("SELECT * FROM user_info where email = '".$email."' and password = '".md5($password)."' ");
		if($qry->num_rows > 0){
			foreach ($qry->fetch_array() as $key => $value) {
				if($key != 'passwors' && !is_numeric($key))
					$_SESSION['login_'.$key] = $value;
			}
			$ip = isset($_SERVER['HTTP_CLIENT_IP']) ? $_SERVER['HTTP_CLIENT_IP'] : isset($_SERVER['HTTP_X_FORWARDED_FOR']) ? $_SERVER['HTTP_X_FORWARDED_FOR'] : $_SERVER['REMOTE_ADDR'];
			$this->db->query("UPDATE cart set user_id = '".$_SESSION['login_user_id']."' where client_ip ='$ip' ");
				return 1;
		}else{
			return 3;
		}
	}
	function logout(){
		session_destroy();
		foreach ($_SESSION as $key => $value) {
			unset($_SESSION[$key]);
		}
		header("location:login.php");
	}
	function logout2(){
		session_destroy();
		foreach ($_SESSION as $key => $value) {
			unset($_SESSION[$key]);
		}
		header("location:../index.php");
	}

	function save_user(){
		extract($_POST);
		$data = " name = '$name' ";
		$data .= ", username = '$username' ";
		$data .= ", password = '$password' ";
		if(isset($type))
		$data .= ", type = '$type' ";
		if(empty($id)){
			$save = $this->db->query("INSERT INTO users set ".$data);
		}else{
			$save = $this->db->query("UPDATE users set ".$data." where id = ".$id);
		}
		if($save){
			return 1;
		}
	}
	function save_role(){
		extract($_POST);
		$creator=$_SESSION['login_id'];
		date_default_timezone_set("Africa/Nairobi");
		$date=date("y-m-d h:i:sa");	
		if (empty($role_id)) {
			$data = " role_id = '' ";
			$data .= ", role_name = '$RoleName' ";
			$data .= ", Description = '$Description'";
			$data .= ", creator='$creator'";
			$data .= ", date_created='$date'";
			$save_role=$this->db->query("INSERT INTO user_role set ".$data);
			$inserted_role_id=$this->db->insert_id;
			foreach($role_privilages as $k => $v){
				$data = " user_role_privieges_id = '' ";
				$data .= ", user_role_id = '$inserted_role_id' ";
				$data .= ", role_privileges_id = '$role_privilages[$k]' ";
				$data .= ", creator= '$creator' ";
				$data .= ", date_created= '$date' ";
				$save_privilege_on_role[]=$this->db->query("INSERT INTO user_role_privieges set ".$data);
			}
			if (isset($save_privilege_on_role)) {
				if ($save_role) {
					return 1;
				}
			}
		}else {
			date_default_timezone_set("Africa/Nairobi");
			$date=date("y-m-d h:i:sa");
			$changer = $_SESSION['login_id'];
			$datechanged = $date;
			$creator=$_SESSION['login_id'];
			// $data = " role_id = '' ";
			$data = " role_name = '$RoleName' ";
			$data .= ", Description = '$Description' ";
			$data .= ", changed_by = '$changer' ";
			$data .= ", date_changed = '$datechanged' ";
			$update_role=$this->db->query("UPDATE user_role SET {$data} WHERE role_id= {$role_id} ");
			if ($update_role) {
				$delete_role_on_update=$this->db->query("DELETE FROM user_role_privieges WHERE user_role_id ={$role_id}");
					foreach($role_privilages as $k => $v){
						$data = " user_role_privieges_id = '' ";
						$data .= ", user_role_id = '$role_id' ";
						$data .= ", role_privileges_id = '$role_privilages[$k]' ";
						$data .= ", creator= '$creator' ";
						$data .= ", date_created= '$date' ";
						$update_privilege_on_role[]=$this->db->query("INSERT INTO user_role_privieges set ".$data);
					}
					if ($update_privilege_on_role) {
						return 2;
					}
			}	
		}
	}
	function delete_role(){
		extract($_POST);

	}
	function signup(){
		extract($_POST);
		$data = " first_name = '$first_name' ";
		$data .= ", last_name = '$last_name' ";
		$data .= ", mobile = '$mobile' ";
		$data .= ", address = '$address' ";
		$data .= ", email = '$email' ";
		$data .= ", password = '".md5($password)."' ";
		$chk = $this->db->query("SELECT * FROM user_info where email = '$email' ")->num_rows;
		if($chk > 0){
			return 2;
			exit;
		}
			$save = $this->db->query("INSERT INTO user_info set ".$data);
		if($save){
			$login = $this->login2();
			return 1;
		}
	}

	function save_settings(){
		extract($_POST);
		$data = " name = '$name' ";
		$data .= ", email = '$email' ";
		$data .= ", contact = '$contact' ";
		$data .= ", about_content = '".htmlentities(str_replace("'","&#x2019;",$about))."' ";
		if($_FILES['img']['tmp_name'] != ''){
						$fname = strtotime(date('y-m-d H:i')).'_'.$_FILES['img']['name'];
						$move = move_uploaded_file($_FILES['img']['tmp_name'],'../assets/img/'. $fname);
					$data .= ", cover_img = '$fname' ";

		}
		
		// echo "INSERT INTO system_settings set ".$data;
		$chk = $this->db->query("SELECT * FROM system_settings");
		if($chk->num_rows > 0){
			$save = $this->db->query("UPDATE system_settings set ".$data." where id =".$chk->fetch_array()['id']);
		}else{
			$save = $this->db->query("INSERT INTO system_settings set ".$data);
		}
		if($save){
		$query = $this->db->query("SELECT * FROM system_settings limit 1")->fetch_array();
		foreach ($query as $key => $value) {
			if(!is_numeric($key))
				$_SESSION['setting_'.$key] = $value;
		}

			return 1;
				}
	}
	function save_min_max_stock_product(){
		extract($_POST);
		if (empty($product_stock_levels_id)) {
			$creator = $_SESSION['login_id'];
			date_default_timezone_set("Africa/Nairobi");
			$date=date("y-m-d h:i:sa");
			$data = " product_stock_levels_id = ' ' ";	
			$data .= ", product_id = '$product' ";
			$data .= ", item_units_id = '$units' ";
			$data .= ", min_stock_level = '$minlevel' ";
			$data .= ", max_stock_level = '$maxlevel' ";
			$data .= ", creator  = '$creator' ";
			$data .= ", date_created = '$date' ";
			$save = $this->db->query("INSERT INTO product_stock_levels set ".$data);
			if ($save) {
				return 1;
			}else {
				return mysqli_error($this->db);
			}
		}else{
			$changed_by=$_SESSION['login_id'];
			date_default_timezone_set("Africa/Nairobi");
			$date_changed=date("y-m-d h:i:sa");
			$data = " product_id = '$product' ";	
			$data .= ", item_units_id = '$units' ";
			$data .= ", min_stock_level = '$minlevel' ";
			$data .= ", max_stock_level = '$maxlevel' ";
			$data .= ", changed_by = '$changed_by' ";
			$data .= ", date_changed = '$date_changed' ";
			$save = $this->db->query("UPDATE product_stock_levels SET {$data} WHERE product_stock_levels_id=".$product_stock_levels_id);
			if ($save) {
				return 2;
			}else {
				return mysqli_error($this->db);
			}
		}
		
	}
	function delete_min_max_stock_product(){
		extract($_POST);
		$delete = $this->db->query("DELETE FROM product_stock_levels where product_stock_levels_id =".$product_stock_levels_id);
		if ($delete) {
			return 1;
		}else {
			return mysqli_error($this->db);
		}
	}
	function save_category(){
		extract($_POST);
		$data = "item_category_name= '$name' ";
		if(empty($id)){
			$creator=$_SESSION['login_id'];
			date_default_timezone_set("Africa/Nairobi");
			$date=date("y-m-d h:i:sa");
			// $datecreated= new DateTime('now');
			$data .= ", creator='$creator'";
			$data .= ", date_created='$date'";
			$save = $this->db->query("INSERT INTO item_categories set ".$data);
			if ($save) {
				return 1;
			}
		}else{
			date_default_timezone_set("Africa/Nairobi");
			$date=date("y-m-d h:i:sa");
			$changer=$_SESSION['login_id'];
			$datechanged= $date;
			$data .= ", changed_by='$changer'";
			$data .= ", date_changed='$datechanged'";
			$save = $this->db->query("UPDATE item_categories set ".$data." where item_category_id=".$id);
			if($save)
				return 2;
		}
	}
	function delete_category(){
		extract($_POST);
		$delete = $this->db->query("DELETE FROM item_categories where item_category_id=".$id);
		if($delete)
			return 1;
	}

	function save_group(){
		extract($_POST);
		$data = " drug_group_name = '$name' ";
		if(empty($id)){
			$creator=$_SESSION['login_id'];
			date_default_timezone_set("Africa/Nairobi");
			$date=date("y-m-d h:i:sa");
			// $datecreated= new DateTime('now');
			$data .= ", creator='$creator'";
			$data .= ", date_created='$date'";
			$save = $this->db->query("INSERT INTO drug_group set ".$data);
			if($save)
				return 1;
		}else{
			date_default_timezone_set("Africa/Nairobi");
			$date=date("y-m-d h:i:sa");
			$changer=$_SESSION['login_id'];
			$datechanged= $date;
			$data .= ", changed_by='$changer'";
			$data .= ", date_changed='$datechanged'";
			$save = $this->db->query("UPDATE drug_group set ".$data." where drug_group_id=".$id);
			if($save)
				return 2;
		}
		
	}
	function delete_group(){
		extract($_POST);
		$delete = $this->db->query("DELETE FROM drug_group where drug_group_id = ".$id);
		if($delete)
			return 1;
	}
	function save_type(){
		extract($_POST);
		$data = " item_units_name = '$name' ";
		if(empty($id)){
			$creator=$_SESSION['login_id'];
			date_default_timezone_set("Africa/Nairobi");
			$date=date("y-m-d h:i:sa");
			// $datecreated= new DateTime('now');
			$data .= ", creator='$creator'";
			$data .= ", date_created='$date'";
			$save = $this->db->query("INSERT INTO item_units set ".$data);
		}else{
			date_default_timezone_set("Africa/Nairobi");
			$date=date("y-m-d h:i:sa");
			$changer=$_SESSION['login_id'];
			$datechanged= $date;
			$data .= ", changed_by='$changer'";
			$data .= ", date_changed='$datechanged'";
			$save = $this->db->query("UPDATE item_units set ".$data." where item_units_id=".$id);
		}
		if($save)
			return 1;
	}
	function delete_type(){
		extract($_POST);
		$delete = $this->db->query("DELETE FROM item_units where item_units_id=".$id);
		if($delete)
			return 1;
	}
	function save_supplier(){
		extract($_POST);
		$data = " supplier_name = '$name' ";
		$data .= ", contact = '$contact' ";
		$data .= ", address = '$address' ";
		if(empty($id)){
			$save = $this->db->query("INSERT INTO supplier_list set ".$data);
		}else{
			$save = $this->db->query("UPDATE supplier_list set ".$data." where id=".$id);
		}
		if($save)
			return 1;
	}
	function delete_supplier(){
		extract($_POST);
		$delete = $this->db->query("DELETE FROM supplier_list where id = ".$id);
		if($delete)
			return 1;
	}
	function save_product(){
		extract($_POST);
		if(empty($sku)){
			$sku = mt_rand(1,99999999);
			$sku = sprintf("%'08d\n", $sku);
			$i = 1;
			while($i == 1){
				$chk = $this->db->query("SELECT * FROM product_list where sku ='$sku'")->num_rows;
				if($chk > 0){
					$sku = mt_rand(1,99999999);
					$sku = sprintf("%'08d\n", $sku);
				}else{
					$i=0;
				}
			}
		}
		$data = " item_category_id = '$category_id' ";
		$data .="=, drug_group_id = '$group_id' ";
		$data .= ", item_units_id = '$units' ";
		$data .= ", sku = '$sku' ";
		// $data .= ", price = '$price' ";
		// $data .= ", wholesale_price = '$wholesale_price' ";
		$data .= ", name = '$name' ";
		// $data .= ", category_id = '".implode(",",$category_id)."' ";
		$data .= ", measurement = '$measurement' ";
		$data .= ", description = '$description' ";
		if(!isset($prescription)){
			$prescription='';
		}else {
			$prescription;
		}
		$data .= ", prescription = '$prescription' ";
		if(empty($id)){
			$creator=$_SESSION['login_id'];
			date_default_timezone_set("Africa/Nairobi");
			$date=date("y-m-d h:i:sa");
			// $datecreated= new DateTime('now');
			$data .= ", creator = '$creator' ";
			$data .= ", date_created = '$date' ";
			// $save = $this->db->query("INSERT INTO `product_list` set ".$data);
			// $save= $this->db->query("INSERT INTO `product_list`(`id`, `item_category_id`, `drug_group_id`, `item_units_id`, `sku`, `price`, `wholesale_price`, `name`, `measurement`, `description`, `prescription`, `creator`, `date_created`)
			// 						 VALUES ('','".$category_id."','".$group_id."','".$units."','".$sku."','".$price."','".$wholesale_price."','".$name."','".$measurement."','".$description."','".$prescription."','".$creator."','".$date."')");
			// $sql1="INSERT INTO `product_list`(`id`, `item_category_id`, `drug_group_id`, `item_units_id`, `sku`, `price`, `wholesale_price`, `name`, `measurement`, `description`, `prescription`, `creator`, `date_created`) VALUES ('','".$category_id."','".$group_id."','".$units."','".$sku."','".$price."','".$wholesale_price."','".$name."','".$measurement."','".$description."','".$prescription."','".$creator."','".$date."') ";
			$sql1="INSERT INTO `product_list`(`id`, `item_category_id`, `drug_group_id`, `item_units_id`, `sku`,`name`, `measurement`, `description`, `prescription`, `creator`, `date_created`) VALUES ('','".$category_id."','".$group_id."','".$units."','".$sku."','".$name."','".$measurement."','".$description."','".$prescription."','".$creator."','".$date."') ";
			$save= $this->db->query($sql1);
			if($save){
				return 1;
			}
		}else{
			date_default_timezone_set("Africa/Nairobi");
			$date=date("y-m-d h:i:sa");
			$changer=$_SESSION['login_id'];
			$datechanged= $date;
			$data .= ", changed_by = '$changer' ";
			$data .= ", date_changed= '$datechanged' ";
			// return 2;
			// $save = $this->db->query("UPDATE product_list SET category_id='".$category_id."',type_id='".$type_id."',price='".$price."',wholesale_price='".$wholesale_price."',name='".$name."',measurement='".$measurement."',description='".$description."',prescription='".$prescription."',changed_by='".$changer."',date_changed='".$datechanged."' WHERE sku='".$sku."'");
			$sql_update="UPDATE `product_list` SET `item_category_id`='".$category_id."',`drug_group_id`='".$group_id."',`item_units_id`='".$units."',`sku`='".$sku."',`price`='".$price."',`wholesale_price`='".$wholesale_price."',`name`='".$name."',`measurement`='".$measurement."',`description`='".$description."',`prescription`='".$prescription."',`changed_by`='".$changer."',`date_changed`='".$datechanged."' WHERE `id`='".$id."'";
			$save = $this->db->query($sql_update);
			if($save){
				return 2;
			}
		}
		
	}

	function delete_product(){
		extract($_POST);
		$delete = $this->db->query("DELETE FROM product_list where id = ".$id);
		if($delete)
			return 1;
	}
	function delete_user(){
		extract($_POST);
		$delete = $this->db->query("DELETE FROM users where id = ".$id);
		if($delete)
			return 1;
	}

	function save_receiving(){
		extract($_POST);
		$data = " supplier_id = '$supplier_id' ";
		$data .= ", total_amount = '$tamount' ";
		
		if(empty($id)){
			$ref_no = sprintf("%'08d\n", $ref_no);
			$i = 1;

			while($i == 1){
				$chk = $this->db->query("SELECT * FROM receiving_list where ref_no ='$ref_no'")->num_rows;
				if($chk > 0){
					$ref_no = mt_rand(1,99999999);
					$ref_no = sprintf("%'.08d\n", $ref_no);
				}else{
					$i=0;
				}
			}
			$data .= ", ref_no = '$ref_no' ";
			$save = $this->db->query("INSERT INTO receiving_list set ".$data);
			$id =$this->db->insert_id;
			$creator=$_SESSION['login_id'];
			function check_item_available_quantity_by_batch($product_id,$batch_no){
				include 'db_connect.php';
				$inn = mysqli_query($conn,"SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = '".$product_id."' and batch_no = '".$batch_no."'");
				$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
				$out = mysqli_query($conn,"SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = '".$product_id."' and batch_no = '".$batch_no."'");
				$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
				$ex = mysqli_query($conn,"SELECT sum(qty) as ex FROM expired_product where product_id = '".$product_id."' and batch_no = '".$batch_no."'");
				$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
				$available_by_batch = $inn - $out - $ex;
				
				return $available_by_batch;
			}
			foreach($product_id as $k => $v){
				$kk=$product_id[$k];
				$data = " form_id = '$id' ";
				$data .= ", product_id = '$product_id[$k]' ";
				$data .= ", item_units_id = '$units[$k]' ";
				$data .=", batch_no = '$batch_no[$k]' ";
				$data .= ", qty = '$qty[$k]' ";
				$data .= ", price = '$bprice[$k]' ";
				$data .= ", expiry_date = '$expiry_date[$k]' ";
				$data .= ", type = '1' ";
				$data .= ", stock_from = 'receiving' ";
				$details = json_encode(array('price'=>$bprice[$k],'qty'=>$qty[$k]));
				$data .= ", other_details = '$details' ";
				$data .= ", remarks = 'Stock from Receiving-".$ref_no."' ";
				
				$prod =" price = '$sprice[$k]' ";
				$prod .=" ,wholesale_price = '$wprice[$k]' ";

				date_default_timezone_set("Africa/Nairobi");
				$date=date("y-m-d h:i:sa");

				$update =" voided= '1' ";
				$update .=", voided_by = '$creator' ";
				$update .=", voided_date = '$date' ";

				$price =" product_id = '$product_id[$k]' ";
				$price .=", price_list_selling_price = '$sprice[$k]' ";
				$price .=", price_list_buying_pice = '$bprice[$k]' ";
				$price .=", price_list_wholesale_price = '$wprice[$k]' ";
				$price .=", creator = '$creator' ";

				$saveUpdate=$this->db->query("UPDATE price_list set ".$update." where product_id =".$kk);
				$save=$this->db->query("UPDATE product_list set ".$prod." where id =".$kk);

				$save1=$this->db->query("INSERT INTO price_list set".$price);
				$on_batch_available=check_item_available_quantity_by_batch($product_id[$k],$batch_no[$k]);
				$save2[]= $this->db->query("INSERT INTO inventory set ".$data);
				$inventory_id=$this->db->insert_id;
				$batch =" product_by_batch_id = '' ";
				$batch .=", product_id = '$product_id[$k]' ";
				$batch .=", batch_no = '$batch_no[$k]' ";
				$batch .=", qty = '$qty[$k]' ";
				$batch .=", inventory_id = '$inventory_id' ";
				$batch .=", expiredate = '$expiry_date[$k]' ";
				$batch .=", batch_preference = '0'";
				$batch .=", creator = '$creator' ";
				// $batch .=" date_created = '' ";
				$save4[]=$this->db->query("INSERT INTO product_by_batch set".$batch);
				$triggerphph1="UPDATE `product_by_batch` SET batch_preference=0 WHERE product_id='".$product_id[$k]."'AND transaction_type_id=1 AND expired_confirmed=0";
				$save5=$this->db->query($triggerphph1);
				$triggerphph="UPDATE `product_by_batch` SET batch_preference=1 WHERE product_id='".$product_id[$k]."' AND expired_confirmed=0 AND transaction_type_id=1 AND expiredate=(SELECT MIN(date(expiredate)) FROM product_by_batch)";
				$save7=$this->db->query($triggerphph);
				$on_hand_by_batch =" product_on_hand_by_batch_id = '' ";
				$on_hand_by_batch .=", product_id = '$product_id[$k]' ";
				$on_hand_by_batch .=", batch_no = '$batch_no[$k]' ";
				$on_hand_by_batch .=", qty_before = '$on_batch_available' ";
				$on_hand_by_batch .=", qty_consumed = '$qty[$k]' ";
				$after_batch=$on_batch_available+$qty[$k];
				$on_hand_by_batch .=", qty_after = '$after_batch' ";
				// $on_hand_by_batch .=", inventory_id = '' ";
				$on_hand_by_batch .=", transaction_type = '1' "; 
				$on_hand_by_batch .=", creator = '$creator' ";
				$save6=$this->db->query("INSERT INTO product_on_hand_by_batch SET".$on_hand_by_batch);
			}
			if($save2){
				if ($save4) {
					return 1;
				}
			}
		}else{
			$save = $this->db->query("UPDATE receiving_list set ".$data." where id =".$id);
			$ids = implode(",",$inv_id);
			$this->db->query("DELETE FROM inventory where type = 1 and form_id = '$id' and id NOT IN (".$ids.") ");
			foreach($product_id as $k => $v){
				$data = " form_id = '$id' ";
				$data .= ", product_id = '$product_id[$k]' ";
				$data .= ", qty = '$qty[$k]' ";
				$data .= ", price = '$bprice[$k]' ";
				$data .= ", type = '1' ";
				$data .= ", stock_from = 'receiving' ";
				$details = json_encode(array('price'=>$bprice[$k],'qty'=>$qty[$k]));
				$data .= ", other_details = '$details' ";
				$data .= ", remarks = 'Stock from Receiving-".$ref_no."' ";
				if(!empty($inv_id[$k])){
					$save2[]= $this->db->query("UPDATE inventory set ".$data." where id=".$inv_id[$k]);
				}else{
					$save2[]= $this->db->query("INSERT INTO inventory set ".$data);
				}
			}
			if(isset($save2)){
				
				return 2;
			}

		}
	}
	function import_receiving(){
		include ("db_connect.php");   
			// validate to check uploaded file is a valid csv file
			function check_item_available_quantity_by_batch($product_id,$batch_no){
				include 'db_connect.php';
				$inn = mysqli_query($conn,"SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = '".$product_id."' and batch_no = '".$batch_no."'");
				$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
				$out = mysqli_query($conn,"SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = '".$product_id."' and batch_no = '".$batch_no."'");
				$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
				$ex = mysqli_query($conn,"SELECT sum(qty) as ex FROM expired_product where product_id = '".$product_id."' and batch_no = '".$batch_no."'");
				$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
				$available_by_batch = $inn - $out - $ex;
				
				return $available_by_batch;
			}
			$file_mimes = array('text/x-comma-separated-values', 'text/comma-separated-values', 'application/octet-stream', 'application/vnd.ms-excel', 'application/x-csv', 'text/x-csv', 'text/csv', 'application/csv', 'application/excel', 'application/vnd.msexcel', 'text/plain');
			if(!empty($_FILES['file']['name']) && in_array($_FILES['file']['type'],$file_mimes)){
				if(is_uploaded_file($_FILES['file']['tmp_name'])){   
					$csv_file = fopen($_FILES['file']['tmp_name'], 'r');           
					//fgetcsv($csv_file); 
					fgetcsv($csv_file);           
					// get data records from csv file
					while(($column = fgetcsv($csv_file)) !== FALSE){
						//store column data into variables
						$product_id=$column[0];
						$units=$column[1];
						$batch_no=$column[3];
						$qty=$column[4];
						$bprice=$column[5];
						$sprice=$column[6];
						$wprice=$column[7];
						$expiry_date=$column[8];
						// $expiry_date=date('y-m-d',$expiry_date);
						// Check if product aalready exists with same batch
						$checkBatchifExist=check_item_available_quantity_by_batch($product_id,$batch_no);

						// $sql_query = "SELECT emp_id, emp_name, emp_salary, emp_age FROM emp WHERE emp_email = '".$column[1]."'";
						// $resultset = mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));
						// if product with the batch  already exist then update details
						// if(mysqli_num_rows($resultset)) {                     
						// 	$sql_update = "UPDATE emp set emp_name='".$column[1]."', emp_salary='".$column[3]."', emp_age='".$column[4]."' WHERE emp_email = '".$column[2]."'";
						// 	$kk=mysqli_query($conn, $sql_update) or die("database error:". mysqli_error($conn));
						// } 
						// if product with the batch  already exist then update details
						// if ($checkBatchifExist >0) {
							
						// }
						// // if product with the batch  doesnot exist then otherwise insert new record
						// else{
							$ref_no = mt_rand(1,99999999);
							$ref_no = sprintf("%'.08d\n", $ref_no);
							$tamount=$qty*$bprice;
							$data = " supplier_id = '1' ";
							$data .= ", total_amount = '$tamount' ";
							$ref_no = sprintf("%'08d\n", $ref_no);
							$i = 1;
							while($i == 1){
								$chk = $this->db->query("SELECT * FROM receiving_list where ref_no ='$ref_no'")->num_rows;
								if($chk > 0){
									$ref_no = mt_rand(1,99999999);
									$ref_no = sprintf("%'.08d\n", $ref_no);
								}else{
									$i=0;
								}
							}
							$data .= ", ref_no = '$ref_no' ";
							$save = $this->db->query("INSERT INTO receiving_list set ".$data);
							$id =$this->db->insert_id;
							$creator=$_SESSION['login_id'];
							date_default_timezone_set("Africa/Nairobi");
							$date=date("y-m-d h:i:sa");
								//preparation to store product into table inventory
								$kk=$product_id;
								$data = " form_id = '$id' ";
								$data .= ", product_id = '$product_id' ";
								$data .= ", item_units_id = '$units' ";
								$data .=", batch_no = '$batch_no' ";
								$data .= ", qty = '$qty' ";
								$data .= ", price = '$bprice' ";
								$data .= ", expiry_date = '$expiry_date' ";
								$data .= ", type = '1' ";
								$data .= ", stock_from = 'receiving' ";
								$details = json_encode(array('price'=>$bprice,'qty'=>$qty));
								$data .= ", other_details = '$details' ";
								$data .= ", remarks = 'Stock from Receiving-".$ref_no."' ";
								$data .= ", date_updated = '$date' ";

								//preparation to Update price in table product_list
								$prod =" price = '$sprice' ";
								$prod .=" ,wholesale_price = '$wprice' ";

								date_default_timezone_set("Africa/Nairobi");
								$date=date("y-m-d h:i:sa");
								//void the price for the specific product id
								$update =" voided= '1' ";
								$update .=", voided_by = '$creator' ";
								$update .=", voided_date = '$date' ";
								
								//Insert new price template for specific item id
								$price =" product_id = '$product_id' ";
								$price .=", price_list_selling_price = '$sprice' ";
								$price .=", price_list_buying_pice = '$bprice' ";
								$price .=", price_list_wholesale_price = '$wprice' ";
								$price .=", creator = '$creator' ";
								$price .=", date_created = '$date' ";

								$saveUpdate=$this->db->query("UPDATE price_list set ".$update." where product_id =".$product_id);
								$save=$this->db->query("UPDATE product_list set ".$prod." where id =".$kk);

								$save1[]=$this->db->query("INSERT INTO price_list set".$price);
								$on_batch_available=check_item_available_quantity_by_batch($product_id,$batch_no);
								$save2[]= $this->db->query("INSERT INTO inventory set ".$data);
								$inventory_id=$this->db->insert_id;
								$batch =" product_by_batch_id = '' ";
								$batch .=", product_id = '$product_id' ";
								$batch .=", batch_no = '$batch_no' ";
								$batch .=", qty = '$qty' ";
								$batch .=", inventory_id = '$inventory_id' ";
								$batch .=", expiredate = '$expiry_date' ";
								$batch .=", batch_preference = '0'";
								$batch .=", creator = '$creator' ";
								$batch .=", date_created = '$date' ";

								$save4[]=$this->db->query("INSERT INTO product_by_batch set".$batch);
								$triggerphph1="UPDATE `product_by_batch` SET batch_preference=0 WHERE product_id='".$product_id."'AND transaction_type_id=1 AND expired_confirmed=0";
								$save5=$this->db->query($triggerphph1);
								$triggerphph="UPDATE `product_by_batch` SET batch_preference=1 WHERE product_id='".$product_id."' AND expired_confirmed=0 AND transaction_type_id=1 AND expiredate=(SELECT MIN(date(expiredate)) FROM product_by_batch)";
								$save7=$this->db->query($triggerphph);
								$on_hand_by_batch =" product_on_hand_by_batch_id = '' ";
								$on_hand_by_batch .=", product_id = '$product_id' ";
								$on_hand_by_batch .=", batch_no = '$batch_no' ";
								$on_hand_by_batch .=", qty_before = '$on_batch_available' ";
								$on_hand_by_batch .=", qty_consumed = '$qty' ";
								$after_batch=$on_batch_available+$qty;
								$on_hand_by_batch .=", qty_after = '$after_batch' ";
								$on_hand_by_batch .=", inventory_id = '$inventory_id' ";
								$on_hand_by_batch .=", transaction_type = '1' "; 
								$on_hand_by_batch .=", creator = '$creator' ";
								$on_hand_by_batch .=", date_created = '$date' ";
								$save6[]=$this->db->query("INSERT INTO product_on_hand_by_batch SET".$on_hand_by_batch);
						// }
					}
					// if($save2){
					// 	if ($save4) {
					// 		$kkk=$save4;
					// 	}
					// }
					if ($save4) {
						fclose($csv_file);
						$import_status = '?import_status=success';
					}else {
						$import_status =  mysqli_error($conn);
					}            
					
				} else {
					$import_status = '?import_status=error';
				}
			} else {
				$import_status = '?import_status=invalid_file';
			}
		// $import_status = '?import_status=invalid_file';
		return $import_status;
	}
	function delete_receiving(){
		extract($_POST);
		$del1 = $this->db->query("DELETE FROM receiving_list where id = $id ");
		$del2 = $this->db->query("DELETE FROM inventory where type = 1 and form_id = $id ");
		if($del1 && $del2)
			return 1;
	}
	function save_customer(){
		extract($_POST);
		$data = " name = '$name' ";
		$data .= ", contact = '$contact' ";
		$data .= ", address = '$address' ";
		if(empty($id)){
			$save = $this->db->query("INSERT INTO customer_list set ".$data);
			if($save)
				return 1;
		}else{
			$save = $this->db->query("UPDATE customer_list set ".$data." where id=".$id);
			if($save)
				return 2;
		}
		
	}
	function delete_customer(){
		extract($_POST);
		$delete = $this->db->query("DELETE FROM customer_list where id = ".$id);
		if($delete)
			return 1;
	}

	function chk_prod_availability(){
		extract($_POST);
		extract($_GET);
		$price = $this->db->query("SELECT * FROM product_list where id = ".$id)->fetch_assoc()['price'];
		$inn = $this->db->query("SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = ".$id);
		$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
		$out = $this->db->query("SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = ".$id);
		$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
		$ex = $this->db->query("SELECT sum(qty) as ex FROM expired_product where product_id = ".$id);
		$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
		$available = $inn - $out - $ex;
		$prescribe = $this->db->query("SELECT * FROM product_list where id = ".$id)->fetch_assoc()['prescription'];
		return json_encode(array('available'=>$available,'price'=>$price,'prescribe'=>$prescribe));

	}
	function chk_prod_availability_for_invoice(){
		extract($_POST);
		extract($_GET);
		$price = $this->db->query("SELECT * FROM product_list where id = ".$id)->fetch_assoc()['wholesale_price'];
		$inn = $this->db->query("SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = ".$id);
		$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
		$out = $this->db->query("SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = ".$id);
		$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
		$ex = $this->db->query("SELECT sum(qty) as ex FROM expired_product where product_id = ".$id);
		$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
		$available = $inn - $out - $ex;
		return json_encode(array('available'=>$available,'price'=>$price));

	}
	function check_item_available_quantity($product_id){
		include 'db_connect.php';
		$inn = mysqli_query($conn,"SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = ".$product_id);
		$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
		$out = mysqli_query($conn,"SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = ".$product_id);
		$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
		$ex = mysqli_query($conn,"SELECT sum(qty) as ex FROM expired_product where product_id = ".$product_id);
		$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
		$available = $inn - $out - $ex;
		
		return $available;
	}
	function check_item_available_quantity_by_batch($product_id , $batch_no){
		include 'db_connect.php';
		extract($_GET);
		$inn = mysqli_query($conn,"SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = ".$product_id." and batch_no = ".$batch_no);
		$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
		$out = mysqli_query($conn,"SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = ".$product_id." and batch_no = ".$batch_no);
		$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
		$ex = mysqli_query($conn,"SELECT sum(qty) as ex FROM expired_product where product_id = ".$product_id." and batch_no = ".$batch_no);
		$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
		$available_by_batch = $inn - $out - $ex;
		
		return $available_by_batch;
	}
	function check_item_available_quantity_by_batch_for_sale($product_id,$batch_no){
		include 'db_connect.php';
		extract($_GET);
		$inn = mysqli_query($conn,"SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = '".$product_id."' and batch_no = '".$batch_no."'");
		$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
		$out = mysqli_query($conn,"SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = '".$product_id."' and batch_no = '".$batch_no."'");
		$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
		$ex = mysqli_query($conn,"SELECT sum(qty) as ex FROM expired_product where product_id = '".$product_id."' and batch_no = '".$batch_no."'");
		$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
		$available_by_batch = $inn - $out - $ex;
		
		return $available_by_batch;
	}
	function save_wholesale(){
		extract($_POST);
		$type=1;
		$transaction_type=2;
		if(empty($id_wholesale)){
			$ref_no = sprintf("%'.08d\n", $ref_no);
			$i = 1;

			while($i == 1){
				$chk = $this->db->query("SELECT * FROM sales_list where ref_no ='$ref_no'")->num_rows;
				if($chk > 0){
					$ref_no = mt_rand(1,99999999);
					$ref_no = sprintf("%'.08d\n", $ref_no);
				}else{
					$i=0;
				}
			}
			$creator=$_SESSION['login_id'];
			date_default_timezone_set("Africa/Nairobi");
			$date=date("y-m-d h:i:sa");
		$name =" customer_id = ''";
		$name .=", customer_name ='$customer_name'";
		$name .=", creator = '$creator' ";
		$name .=", date_created = '$date' ";
		$save_customer=$this->db->query("INSERT INTO customers SET".$name);
		$customer_id =$this->db->insert_id;
		$data = " customer_id = '$customer_id' ";
		$data .= ", total_amount = '$tamount' ";
		$data .=", sales_type = '$type' ";
		$data .= ", amount_tendered = '$amount_tendered' ";
		$data .= ", amount_change = '$change' ";
		$data .=", creator = '$creator' ";
			date_default_timezone_set("Africa/Nairobi");
			$number=date('Ymd',strtotime(date("y-m-d h:i:sa")))."-".$ref_no;
			$data .= ", ref_no = '$ref_no' ";
			
			$data .=", sales_invoice_number = '$number' ";
			$save = $this->db->query("INSERT INTO sales_list set ".$data);
			$id_wholesale =$this->db->insert_id;
			function check_item_available_quantity($product_id){
				include 'db_connect.php';
				$inn = mysqli_query($conn,"SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = ".$product_id);
				$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
				$out = mysqli_query($conn,"SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = ".$product_id);
				$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
				$ex = mysqli_query($conn,"SELECT sum(qty) as ex FROM expired_product where product_id = ".$product_id);
				$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
				$available = $inn - $out - $ex;
				
				return $available;
			}
			foreach($product_id as $k => $v):
				$creator=$_SESSION['login_id'];
				date_default_timezone_set("Africa/Nairobi");
				$date=date("y-m-d h:i:sa");
				$available=check_item_available_quantity($product_id[$k]);
				$data =" product_on_hand_id = '' ";
				$data .=", product_id = '$product_id[$k]' ";
				$data .= ", item_units_id = '$units[$k]' ";
				
				$data .=", qty_before = '$available' ";
				
				$qty_after=$available-$qty[$k];
				$data .=", qty_after = '$qty_after' ";
				$data .=", qty_consumed = '$qty[$k]' ";
				$data .=", sales_list_id = '$id_wholesale' ";
				$data .=", creator = '$creator'";
				$data .=", transaction_type  = '$transaction_type'";
				$data .=", date_created = '$date' ";
				$save1[]=$this->db->query("INSERT INTO product_on_hand set ".$data);
			endforeach;
			function check_item_available_quantity_by_batch_for_sale($product_id,$batch_no){
				include 'db_connect.php';
				$inn = mysqli_query($conn,"SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = '".$product_id."' and batch_no = '".$batch_no."'");
				$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
				$out = mysqli_query($conn,"SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = '".$product_id."' and batch_no = '".$batch_no."'");
				$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
				$ex = mysqli_query($conn,"SELECT sum(qty) as ex FROM expired_product where product_id = '".$product_id."' and batch_no = '".$batch_no."'");
				$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
				$available_by_batch = $inn - $out - $ex;
				
				return $available_by_batch;
			}
			function check_the_batch_for_product($product_id){
				include 'db_connect.php';
				$batchNo=mysqli_query($conn,"SELECT batch_no as batch_no from product_by_batch where batch_preference=1 and product_id =".$product_id);
				$batchNo = $batchNo && $batchNo->num_rows > 0 ? $batchNo->fetch_array()['batch_no'] : '';
				return $batchNo;
			}
			function product_sales_by_batch_algorism($product_id,$qty,$id,$creator){
				include 'db_connect.php';
				$type=1;
				$batchNo=check_the_batch_for_product($product_id);
				$available_by_batch_on_sales=check_item_available_quantity_by_batch_for_sale($product_id,$batchNo);
						if ($available_by_batch_on_sales > $qty):
							$data1 = " product_on_hand_by_batch_id = '' ";
							$data1 .= ", product_id = '$product_id' ";
							$data1 .= ", batch_no = '$batchNo' ";
							$data1 .= ", qty_before = '$available_by_batch_on_sales' ";
							$remained=$available_by_batch_on_sales-$qty;
							$qty_after_by_batch=$remained;
							$data1 .= ", qty_consumed = '$available_by_batch_on_sales' ";
							$data1 .= ", qty_after = '$qty_after_by_batch' ";
							$data1 .= ", sales_list_id = '$id_wholesale' ";
							date_default_timezone_set("Africa/Nairobi");
							$date=date("y-m-d h:i:sa");
							$data1 .= ", transaction_type = '$transaction_type' ";
							$data1 .= ", creator = '$creator' ";
							$data1 .= ", date_created = '$date' ";
							$save4[] = mysqli_query($conn,"INSERT INTO product_on_hand_by_batch SET".$data1);
							if ($save4) :
								$success=1;
								return $success;
								exit();
							endif;
						else:
							$data1 = " product_on_hand_by_batch_id = '' ";
							$data1 .= ", product_id = '$product_id' ";
							$data1 .= ", batch_no = '$batchNo' ";
							$data1 .= ", qty_before = '$available_by_batch_on_sales' ";
							$remained=$qty-$available_by_batch_on_sales;
							$qty_after_by_batch=0;
							$qty=$remained;
							$data1 .= ", qty_consumed = '$available_by_batch_on_sales' ";
							$data1 .= ", qty_after = '$qty_after_by_batch' ";
							$data1 .= ", sales_list_id = '$id_wholesale' ";
							date_default_timezone_set("Africa/Nairobi");
							$date=date("y-m-d h:i:sa");
							$data1 .= ", transaction_type = '$transaction_type' ";
							$data1 .= ", creator = '$creator' ";
							$data1 .= ", date_created = '$date' ";
							$save4[] = mysqli_query($conn,"INSERT INTO product_on_hand_by_batch SET".$data1);
							if ($save4) :
								product_sales_by_batch_algorism($product_id,$qty,$id,$type,$creator);
							endif;
						endif;
					}

			foreach($product_id as $k =>$v):
				$batchNo=check_the_batch_for_product($product_id[$k]);
				$available_by_batch_on_sales=check_item_available_quantity_by_batch_for_sale($product_id[$k],$batchNo);
				$ppid=$qty[$k];
				if ($qty[$k] <= $available_by_batch_on_sales):
						$data = " product_on_hand_by_batch_id = '' ";
						$data .= ", product_id = '$product_id[$k]' ";
						$data .= ", batch_no = '$batchNo' ";
						$data .= ", qty_before = '$available_by_batch_on_sales' ";
						$consumed=$qty[$k];
						$qty_after_by_batch=$available_by_batch_on_sales-$qty[$k];
						$data .= ", qty_after = '$qty_after_by_batch' ";
						$data .= ", qty_consumed = '$consumed' ";
						$data .= ", sales_list_id = '$id_wholesale' ";
						date_default_timezone_set("Africa/Nairobi");
						$date=date("y-m-d h:i:sa");
						$data .= ", transaction_type = '$transaction_type' ";
						$data .= ", creator = '$creator' ";
						$data .= ", date_created = '$date' ";
						$save41[]= $this->db->query("INSERT INTO product_on_hand_by_batch SET".$data);
						$product_on_hand_by_batch_id=$this->db->insert_id;		
				else:
					$mm= product_sales_by_batch_algorism($product_id[$k],$qty[$k],$id,$creator);
				endif;

			endforeach;
			
			foreach($product_id as $k => $v){
				$batchNo=check_the_batch_for_product($product_id[$k]);
				$data = " form_id = '$id_wholesale' ";
				$data .= ", product_id = '$product_id[$k]' ";
				$data .=", batch_no = '$batchNo' ";
				$data .= ", qty = '$qty[$k]' ";
				$data .= ", price = '$price[$k]' ";
				$data .= ", type = '2' ";
				$data .= ", stock_from = 'Sales' ";
				$details = json_encode(array('price'=>$price[$k],'qty'=>$qty[$k]));
				$data .= ", other_details = '$details' ";
				$data .= ", remarks = 'Stock out from Sales-".$ref_no."' ";
				
				$save2[]= $this->db->query("INSERT INTO inventory set ".$data);	
			}
			if(isset($save2) ){
				foreach($product_id as $k => $v):
				$creator=$_SESSION['login_id'];
				date_default_timezone_set("Africa/Nairobi");
				$date=date("y-m-d h:i:sa");
				$data ="product_on_sales_list_id = ''";
				$data .=", product_id = '$product_id[$k]' ";
				$data .=", qty = '$qty[$k]' ";
				$data .=", rate_price = '$price[$k]' ";
				$amount1=$price[$k]*$qty[$k];
				$data .=", total_amount = '$amount1'";
				$data .=", sales_invoice_number = '$number'";
				$data .=", creator = '$creator' ";
				$data .=", date_created = '$date' ";

				$save3[]=$this->db->query("INSERT INTO product_on_sales_lists set ".$data);
				endforeach;
				if ($save2) {
					if ($save3) {
						return $id_wholesale;
					}
				}
			}
			
		}else{
			$save = $this->db->query("UPDATE sales_list set ".$data." where id=".$id);
			$ids = implode(",",$inv_id);
			$this->db->query("DELETE FROM inventory where type = 1 and form_id ='$id' and id NOT IN (".$ids.") ");
			foreach($product_id as $k => $v){
				$data = " form_id = '$id' ";
				$data .= ", product_id = '$product_id[$k]' ";
				$data .= ", qty = '$qty[$k]' ";
				$data .= ", type = '2' ";
				$data .= ", stock_from = 'Sales' ";
				$details = json_encode(array('price'=>$price[$k],'qty'=>$qty[$k]));
				$data .= ", other_details = '$details' ";
				$data .= ", remarks = 'Stock out from Sales-".$ref_no."' ";

				if(!empty($inv_id[$k])){
					$save2[]= $this->db->query("UPDATE inventory set ".$data." where id=".$inv_id[$k]);
				}else{
					$save2[]= $this->db->query("INSERT INTO inventory set ".$data);
				}
			}
			if(isset($save2)){
				return $id;
			}
		}
	}
	function save_sales(){
		extract($_POST);
		$type=2;
		if(empty($id)){
			$ref_no = sprintf("%'.08d\n", $ref_no);
			$i = 1;

			while($i == 1){
				$chk = $this->db->query("SELECT * FROM sales_list where ref_no ='$ref_no'")->num_rows;
				if($chk > 0){
					$ref_no = mt_rand(1,99999999);
					$ref_no = sprintf("%'.08d\n", $ref_no);
				}else{
					$i=0;
				}
			}
			$creator=$_SESSION['login_id'];
		$name =" customer_id = ''";
		$name .=", customer_name ='$customer_name'";
		$name .=", creator = '$creator' ";
		$name .=", date_created = '' ";
		$save_customer=$this->db->query("INSERT INTO customers SET".$name);
		$customer_id =$this->db->insert_id;
		$prescribers =" prescription_id = '' ";
		$prescribers .=", prescription_source = '$source_of_prescription' ";
		$prescribers .=", prescriber = '$name_of_prescriber' ";
		$prescribers .=", prescribed_date = '$prescribed_date' ";
		$prescribers .=", creator = '$creator' ";
		$save_presciption=$this->db->query("INSERT INTO prescription SET".$prescribers);
		$prescription_id=$this->db->insert_id;
		// $creator=$_SESSION['login_id'];
		$data = " customer_id = '$customer_id' ";
		$data .= ", total_amount = '$tamount' ";
		$data .=", sales_type = '$type' ";
		$data .= ", amount_tendered = '$amount_tendered' ";
		$data .= ", amount_change = '$change' ";
		if($save_presciption){
			$data .= ", prescription = '$prescription_id' ";
		}
		$data .=", creator = '$creator' ";
			date_default_timezone_set("Africa/Nairobi");
			$number=date('Ymd',strtotime(date("y-m-d h:i:sa")))."-".$ref_no;
			$data .= ", ref_no = '$ref_no' ";
			
			$data .=", sales_invoice_number = '$number' ";
			$save = $this->db->query("INSERT INTO sales_list set ".$data);
			$id =$this->db->insert_id;
			function check_item_available_quantity($product_id){
				include 'db_connect.php';
				$inn = mysqli_query($conn,"SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = ".$product_id);
				$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
				$out = mysqli_query($conn,"SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = ".$product_id);
				$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
				$ex = mysqli_query($conn,"SELECT sum(qty) as ex FROM expired_product where product_id = ".$product_id);
				$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
				$available = $inn - $out - $ex;
				
				return $available;
			}
			foreach($product_id as $k => $v):
				$creator=$_SESSION['login_id'];
				date_default_timezone_set("Africa/Nairobi");
				$date=date("y-m-d h:i:sa");
				$available=check_item_available_quantity($product_id[$k]);
				$data =" product_on_hand_id = '' ";
				$data .=", product_id = '$product_id[$k]' ";
				$data .= ", item_units_id = '$units[$k]' ";
				$data .=", qty_before = '$available' ";
				
				$qty_after=$available-$qty[$k];
				$data .=", qty_after = '$qty_after' ";
				$data .=", qty_consumed = '$qty[$k]' ";
				$data .=", sales_list_id = '$id' ";
				// $amount1=$price[$k]*$qty[$k];
				// $creator=$_SESSION['login_id'];
				$data .=", creator = '$creator'";
				$data .=", transaction_type  = '$type'";
				// $data .=", creator = '$creator' ";
				$data .=", date_created = '$date' ";

				$save1[]=$this->db->query("INSERT INTO product_on_hand set ".$data);
			endforeach;
			function check_item_available_quantity_by_batch_for_sale($product_id,$batch_no){
				include 'db_connect.php';
				$inn = mysqli_query($conn,"SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = '".$product_id."' and batch_no = '".$batch_no."'");
				$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
				$out = mysqli_query($conn,"SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = '".$product_id."' and batch_no = '".$batch_no."'");
				$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
				$ex = mysqli_query($conn,"SELECT sum(qty) as ex FROM expired_product where product_id = '".$product_id."' and batch_no = '".$batch_no."'");
				$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
				$available_by_batch = $inn - $out - $ex;
				
				return $available_by_batch;
			}
			function check_the_batch_for_product($product_id){
				include 'db_connect.php';
				$batchNo=mysqli_query($conn,"SELECT batch_no as batch_no from product_by_batch where batch_preference=1 and product_id =".$product_id);
				$batchNo = $batchNo && $batchNo->num_rows > 0 ? $batchNo->fetch_array()['batch_no'] : '';
				return $batchNo;
			}
			function product_sales_by_batch_algorism($product_id,$qty,$id,$creator){
				include 'db_connect.php';
				$type=2;
				$batchNo=check_the_batch_for_product($product_id);
				$available_by_batch_on_sales=check_item_available_quantity_by_batch_for_sale($product_id,$batchNo);
						if ($available_by_batch_on_sales > $qty):
							$data1 = " product_on_hand_by_batch_id = '' ";
							$data1 .= ", product_id = '$product_id' ";
							$data1 .= ", batch_no = '$batchNo' ";
							$data1 .= ", qty_before = '$available_by_batch_on_sales' ";
							$remained=$available_by_batch_on_sales-$qty;
							$qty_after_by_batch=$remained;
							$data1 .= ", qty_consumed = '$available_by_batch_on_sales' ";
							$data1 .= ", qty_after = '$qty_after_by_batch' ";
							$data1 .= ", sales_list_id = '$id' ";
							date_default_timezone_set("Africa/Nairobi");
							$date=date("y-m-d h:i:sa");
							$data1 .= ", transaction_type = '$type' ";
							$data1 .= ", creator = '$creator' ";
							$data1 .= ", date_created = '$date' ";
							$save4[] = mysqli_query($conn,"INSERT INTO product_on_hand_by_batch SET".$data1);
							if ($save4) :
								$success=1;
								return $success;
								exit();
							endif;
						else:
							$data1 = " product_on_hand_by_batch_id = '' ";
							$data1 .= ", product_id = '$product_id' ";
							$data1 .= ", batch_no = '$batchNo' ";
							$data1 .= ", qty_before = '$available_by_batch_on_sales' ";
							$remained=$qty-$available_by_batch_on_sales;
							$qty_after_by_batch=0;
							$qty=$remained;
							$data1 .= ", qty_consumed = '$available_by_batch_on_sales' ";
							$data1 .= ", qty_after = '$qty_after_by_batch' ";
							$data1 .= ", sales_list_id = '$id' ";
							date_default_timezone_set("Africa/Nairobi");
							$date=date("y-m-d h:i:sa");
							$data1 .= ", transaction_type = '$type' ";
							$data1 .= ", creator = '$creator' ";
							$data1 .= ", date_created = '$date' ";
							$save4[] = mysqli_query($conn,"INSERT INTO product_on_hand_by_batch SET".$data1);
							if ($save4) :
								product_sales_by_batch_algorism($product_id,$qty,$id,$type,$creator);
							endif;
						endif;
					}

			foreach($product_id as $k =>$v):
				$batchNo=check_the_batch_for_product($product_id[$k]);
				$available_by_batch_on_sales=check_item_available_quantity_by_batch_for_sale($product_id[$k],$batchNo);
				$ppid=$qty[$k];
				if ($qty[$k] <= $available_by_batch_on_sales):
						$data = " product_on_hand_by_batch_id = '' ";
						$data .= ", product_id = '$product_id[$k]' ";
						$data .= ", batch_no = '$batchNo' ";
						$data .= ", qty_before = '$available_by_batch_on_sales' ";
						$consumed=$qty[$k];
						$qty_after_by_batch=$available_by_batch_on_sales-$qty[$k];
						$data .= ", qty_after = '$qty_after_by_batch' ";
						$data .= ", qty_consumed = '$consumed' ";
						$data .= ", sales_list_id = '$id' ";
						date_default_timezone_set("Africa/Nairobi");
						$date=date("y-m-d h:i:sa");
						$data .= ", transaction_type = '$type' ";
						$data .= ", creator = '$creator' ";
						$data .= ", date_created = '$date' ";
						$save41[]= $this->db->query("INSERT INTO product_on_hand_by_batch SET".$data);
						$product_on_hand_by_batch_id=$this->db->insert_id;		
				else:
					$mm= product_sales_by_batch_algorism($product_id[$k],$qty[$k],$id,$creator);
				endif;

			endforeach;
			
			foreach($product_id as $k => $v){
				$batchNo=check_the_batch_for_product($product_id[$k]);
				$data = " form_id = '$id' ";
				$data .= ", product_id = '$product_id[$k]' ";
				$data .= ", item_units_id = '$units[$k]' ";
				$data .=", batch_no = '$batchNo' ";
				$data .= ", qty = '$qty[$k]' ";
				$data .= ", price = '$price[$k]' ";
				$data .= ", type = '2' ";
				$data .= ", stock_from = 'Sales' ";
				$details = json_encode(array('price'=>$price[$k],'qty'=>$qty[$k]));
				$data .= ", other_details = '$details' ";
				$data .= ", remarks = 'Stock out from Sales-".$ref_no."' ";
				
				$save2[]= $this->db->query("INSERT INTO inventory set ".$data);	
			}
			if(isset($save2) ){
				foreach($product_id as $k => $v):
				$creator=$_SESSION['login_id'];
				date_default_timezone_set("Africa/Nairobi");
				$date=date("y-m-d h:i:sa");
				$data ="product_on_sales_list_id = ''";
				$data .=", product_id = '$product_id[$k]' ";
				$data .=", qty = '$qty[$k]' ";
				$data .=", rate_price = '$price[$k]' ";
				$amount1=$price[$k]*$qty[$k];
				$data .=", total_amount = '$amount1'";
				$data .=", sales_invoice_number = '$number'";
				$data .=", creator = '$creator' ";
				$data .=", date_created = '$date' ";

				$save3[]=$this->db->query("INSERT INTO product_on_sales_lists set ".$data);
				endforeach;
				if ($save2) {
					if ($save3) {
						return $id;
					}
				}
			}
			
		}else{
			$save = $this->db->query("UPDATE sales_list set ".$data." where id=".$id);
			$ids = implode(",",$inv_id);
			$this->db->query("DELETE FROM inventory where type = 1 and form_id ='$id' and id NOT IN (".$ids.") ");
			foreach($product_id as $k => $v){
				$data = " form_id = '$id' ";
				$data .= ", product_id = '$product_id[$k]' ";
				$data .= ", item_units_id = '$units[$k]' ";
				$data .= ", qty = '$qty[$k]' ";
				$data .= ", type = '2' ";
				$data .= ", stock_from = 'Sales' ";
				$details = json_encode(array('price'=>$price[$k],'qty'=>$qty[$k]));
				$data .= ", other_details = '$details' ";
				$data .= ", remarks = 'Stock out from Sales-".$ref_no."' ";

				if(!empty($inv_id[$k])){
					$save2[]= $this->db->query("UPDATE inventory set ".$data." where id=".$inv_id[$k]);
				}else{
					$save2[]= $this->db->query("INSERT INTO inventory set ".$data);
				}
			}
			if(isset($save2)){
				return $id;
			}
		}
	}
	function delete_sales(){
		extract($_POST);
		$del1 = $this->db->query("DELETE FROM sales_list where id = $id ");
		$del2 = $this->db->query("DELETE FROM inventory where type = 2 and form_id = $id ");
		if($del1 && $del2)
			return 1;
	}
	function save_invoice(){
		extract($_POST);
		$data = " profroma_invoice_to = '$customer_name' ";
		$data .= ", total_amount = '$tamount' ";
		$data .= ", amount_tendered = '$amount_tendered' ";
		$data .= ", amount_change = '$change' ";
		
		if(empty($id)){
			$ref_no = sprintf("%'.08d\n", $ref_no);
			$i = 1;

			while($i == 1){
				$chk = $this->db->query("SELECT * FROM profroma_invoice where invoice_number ='$ref_no'")->num_rows;
				if($chk > 0){
					$ref_no = mt_rand(1,99999999);
					$ref_no = sprintf("%'.08d\n", $ref_no);
				}else{
					$i=0;
				}
			}
			
			$data .= ", invoice_number = '$ref_no' ";
			$profoma_invoice_name=$customer_name."-".$ref_no;
			$creator=$_SESSION['login_id'];
			date_default_timezone_set("Africa/Nairobi");
			$date=date("y-m-d h:i:sa");
			// $datecreated= new DateTime('now');
			// $data .= ", creator = '$creator' ";
			// $data .= ", date_created = '$date' ";
			
			$sql_insert_profroma_invoice="INSERT INTO `profroma_invoice`( `profroma_invoice_name`, `profroma_invoice_to`, `invoice_number`, `creator`, `date_created`) VALUES ('".$profoma_invoice_name."','".$customer_name."','".$ref_no."','".$creator."','".$date."')";
			// "INSERT INTO `profroma_invoice`(`profroma_invoice_id`, `profroma_invoice_name`, `profroma_invoice_to`, `invoice_number`, `creator`, `date_created`) VALUES ('','".$profoma_invoice_name."','".$customer_name."','".$ref_no."','".$creator."','".$date."')";
			// $save = $this->db->query("INSERT INTO sales_list set ".$data);
			$save21 = $this->db->query($sql_insert_profroma_invoice);
			
			foreach($product_id as $k => $v){
				$data = " form_id = '$id' ";
				$data .= ", product_id = '$product_id[$k]' ";
				$data .= ", qty = '$qty[$k]' ";
				$data .= ", type = '2' ";
				$data .= ", stock_from = 'Sales' ";
				$details = json_encode(array('price'=>$price[$k],'qty'=>$qty[$k]));
				$data .= ", other_details = '$details' ";
				$data .= ", remarks = 'Stock out from Sales-".$ref_no."' ";
				$amount[$k]=$price[$k]*$qty[$k];
				$sql_insert_wholesale_invoice="INSERT INTO `wholesale_invoices`(`wholesale_invoive_id`, `invoice_number`,`product_id`,`rate_price`, `item_quantity`, `total_amount`, `creator`, `date_created`) VALUES ('','".$ref_no."','".$product_id[$k]."','".$price[$k]."','".$qty[$k]."','".$amount[$k]."','".$creator."','".$date."')";
				// $save2[]= $this->db->query("INSERT INTO inventory set ".$data);
				$save2[]= $this->db->query($sql_insert_wholesale_invoice);
				// $id =$this->db->insert_id;
			}
			if(isset($save2)){
				return $ref_no;
			}
		}else{
			return $id;
			// $save = $this->db->query("UPDATE sales_list set ".$data." where id=".$id);
			// $ids = implode(",",$inv_id);
			// $this->db->query("DELETE FROM inventory where type = 1 and form_id ='$id' and id NOT IN (".$ids.") ");
			// foreach($product_id as $k => $v){
			// 	$data = " form_id = '$id' ";
			// 	$data .= ", product_id = '$product_id[$k]' ";
			// 	$data .= ", qty = '$qty[$k]' ";
			// 	$data .= ", type = '2' ";
			// 	$data .= ", stock_from = 'Sales' ";
			// 	$details = json_encode(array('price'=>$price[$k],'qty'=>$qty[$k]));
			// 	$data .= ", other_details = '$details' ";
			// 	$data .= ", remarks = 'Stock out from Sales-".$ref_no."' ";

			// 	if(!empty($inv_id[$k])){
			// 		$save2[]= $this->db->query("UPDATE inventory set ".$data." where id=".$inv_id[$k]);
			// 	}else{
			// 		$save2[]= $this->db->query("INSERT INTO inventory set ".$data);
			// 	}
			// }
			// if(isset($save2)){
			// 	return $id;
			// }
		}
	}
	function delete_invoice(){
		extract($_POST);
		$del1 = $this->db->query("DELETE FROM sales_list where id = $id ");
		$del2 = $this->db->query("DELETE FROM inventory where type = 2 and form_id = $id ");
		if($del1 && $del2)
			return 1;
	}
	function datesalesreport(){
		extract($_POST);
		extract($_GET);
		// $todate=$_POST["todate"];
		// $fromdate=$_POST["fromdate"];
		$mode;

		if ($mode==1) {
			$q1="(SELECT pss.product_sales_product_id AS product_id,pss.product_name AS 'Category',
			SUM(COALESCE(CASE WHEN pss.product_sales_product_id THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
			SUM(COALESCE(CASE WHEN pss.product_sales_product_id THEN pss.product_total_amount ELSE 0 END, 0)) AS 'Amount',
			SUM(COALESCE(CASE WHEN pss.product_sales_product_id THEN pss.product_total_profit ELSE 0 END, 0)) AS 'Profit'
			FROM pharmacy_stock_sales pss WHERE pss.product_sales_date_created<='".$todate."' AND  pss.product_sales_date_created>='".$fromdate."' 
			GROUP BY pss.product_sales_product_id ORDER BY pss.product_name ASC) 
			UNION ALL
			(SELECT '' AS 'p','Total' AS 'Category',
			SUM(COALESCE(CASE WHEN pss.product_sales_product_id THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
			SUM(COALESCE(CASE WHEN pss.product_sales_product_id THEN pss.product_total_amount ELSE 0 END, 0)) AS 'Amount',
			SUM(COALESCE(CASE WHEN pss.product_sales_product_id THEN pss.product_total_profit ELSE 0 END, 0)) AS 'Profit'
			FROM pharmacy_stock_sales pss WHERE pss.product_sales_date_created<='".$todate."' AND  pss.product_sales_date_created>='".$fromdate."')";
		}else {
			$q1="SELECT pss.item_category_name as 'Category',
			SUM(COALESCE(CASE WHEN pss.item_category_id =2 THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
			SUM(COALESCE(CASE WHEN pss.item_category_id =2 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'Amount',
			SUM(COALESCE(CASE WHEN pss.item_category_id =2 THEN pss.product_rate_profit*pss.product_qty ELSE 0 END, 0)) AS 'Profit'
			FROM pharmacy_stock_sales pss WHERE pss.item_category_id=2 and pss.product_sales_date_created<='".$todate."' AND  pss.product_sales_date_created>='".$fromdate."' 
			UNION  ALL
			SELECT pss.item_category_name as 'Category',
			SUM(COALESCE(CASE WHEN pss.item_category_id =1 THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
			SUM(COALESCE(CASE WHEN pss.item_category_id =1 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'Amount',
			SUM(COALESCE(CASE WHEN pss.item_category_id =1 THEN pss.product_rate_profit*pss.product_qty ELSE 0 END, 0)) AS 'Profit'
			FROM pharmacy_stock_sales pss WHERE pss.item_category_id=1 and pss.product_sales_date_created<='".$todate."' AND  pss.product_sales_date_created>='".$fromdate."' 
			UNION ALL
			SELECT pss.item_category_name as 'Category',
			SUM(COALESCE(CASE WHEN pss.item_category_id =3 THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
			SUM(COALESCE(CASE WHEN pss.item_category_id =3 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'Amount',
			SUM(COALESCE(CASE WHEN pss.item_category_id =3 THEN pss.product_rate_profit*pss.product_qty ELSE 0 END, 0)) AS 'Profit'
			FROM pharmacy_stock_sales pss WHERE pss.item_category_id=3 and pss.product_sales_date_created<='".$todate."' AND  pss.product_sales_date_created>='".$fromdate."' 
			UNION ALL
			SELECT 'Total'  as 'Category',
			SUM(COALESCE(CASE WHEN pss.item_category_id  THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
			SUM(COALESCE(CASE WHEN pss.item_category_id  THEN pss.product_total_amount ELSE 0 END, 0)) AS 'Amount',
			SUM(COALESCE(CASE WHEN pss.item_category_id THEN pss.product_rate_profit*pss.product_qty ELSE 0 END, 0)) AS 'Profit'
			FROM pharmacy_stock_sales pss WHERE pss.product_sales_date_created<='".$todate."' AND  pss.product_sales_date_created>='".$fromdate."' ";
		}
		
		$salesprofit=$this->db->query($q1);
				if ($salesprofit) {
					while($row=mysqli_fetch_assoc($salesprofit)){
						$pr[] = array(
							"Category"=>$row['Category'],
							"Total_quantity_sold"=>$row['Total_quantity_sold'],
							"Amount"=>$row['Amount'],
							"Profit"=>$row['Profit']
						);
					}
					$response=array("aaData" => $pr);
				}
				echo json_encode($response) ;
				
		
	}
	function report_presentation(){
		header('Content-Type: application/json');
		extract($_POST);
		extract($_GET);
		$reportType;

		// $sql_count_transaction="SELECT date(sl.date_updated) as date_created,COUNT(*) as Total_quantity_sold,'' as Amount,'' as Profit from sales_list sl GROUP BY date(sl.date_updated)";
		if ($reportType==1) {
			$sql_new="SELECT DATE_FORMAT(pss.product_sales_date_created, '%M %d %Y') as 'date_created',
					SUM(COALESCE(CASE WHEN pss.item_category_id THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
					SUM(COALESCE(CASE WHEN pss.item_category_id THEN pss.product_total_amount ELSE 0 END, 0)) AS 'Amount',
					SUM(COALESCE(CASE WHEN pss.item_category_id THEN pss.product_rate_profit*pss.product_qty ELSE 0 END, 0)) AS 'Profit'
					FROM pharmacy_stock_sales pss WHERE pss.item_category_id and pss.product_sales_date_created <= '".$todate."' AND  pss.product_sales_date_created >= '".$fromdate."' GROUP BY DATE_FORMAT(pss.product_sales_date_created, '%M %d %Y')";
		}else {
			$sql_new="SELECT date(sl.date_updated) as date_created,COUNT(*) as Total_quantity_sold,'' as Amount,'' as Profit from sales_list sl GROUP BY date(sl.date_updated)";
		}
		$report1=$this->db->query($sql_new);
		if ($report1) {
			while ($row=mysqli_fetch_assoc($report1)) {
				$data_report[]=array(
					"date_created"=>$row['date_created'],
					"Total_quantity_sold"=>$row['Total_quantity_sold'],
					"Amount"=>$row['Amount'],
					"Profit"=>$row['Profit'],
					"reportType"=>$reportType
				);
			}
			$data_report1 =$data_report ;
		}
		echo json_encode($data_report1);
	}
	function save_expired(){
		extract($_POST);
		foreach ($product_id as $key => $value) {
			$data = " product_id = $product_id[$key] ";
			$data .= ", qty = $qty[$key] ";
			$data .= ", date_expired = '$expiry_date[$key]' ";
			$save[] = $this->db->query("INSERT INTO expired_product set $data ");
		}
		if(isset($save))
			return 1;
	}
	function delete_expired(){
		extract($_POST);
		$delete = $this->db->query("DELETE FROM expired_product where id = $id ");
		if($delete)
			return 1;
	}
}