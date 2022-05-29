<?php
session_start();
ini_set('display_errors', 1);
include 'db_connect.php';
class Action
{
	private $db;

	public function __construct()
	{
		ob_start();
		include 'db_connect.php';
		ini_set('mysql.connect_timeout', 300);
		ini_set('default_socket_time_out', 300);

		$this->db = $conn;
	}
	function __destruct()
	{
		$this->db->close();
		ob_end_flush();
	}

	function login()
	{
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
		// 		$login=$conn->prepare("SELECT * FROM users u INNER join user_profiles  up ON up.id=u.profiles_id WHERE u.username = ? AND u.password = ?");
		// $login->bind_param("ss", $username, $password);
		// $login->execute();
		// $row = $login->get_result()->fetch_all(MYSQLI_ASSOC);
		// 		// $qry = $this->db->query("SELECT * FROM users where `username` ='".$username."' and `password`='".$password."'");
		$qry = $this->db->query("SELECT * FROM users u INNER join user_profiles  up ON up.id=u.profiles_id WHERE u.username = '" . $username . "' AND u.password ='" . $password . "'");
		if ($qry) {
			if ($qry->num_rows > 0) {
				foreach ($qry->fetch_array() as $key => $value) {
					if ($key != 'passwors' && !is_numeric($key))
						$_SESSION['login_' . $key] = $value;
				}
				$query = $this->db->query("SELECT * FROM system_settings ss WHERE ss.retired=0")->fetch_array();
				if ($query) {
					foreach ($query as $key => $value) {

						$_SESSION['setting_' . $key] = $value;
					}
				}
				return 1;
			}
		} else {
			return 3;
		}
	}
	function login2()
	{
		extract($_POST);
		$qry = $this->db->query("SELECT * FROM user_info where email = '" . $email . "' and password = '" . md5($password) . "' ");
		if ($qry->num_rows > 0) {
			foreach ($qry->fetch_array() as $key => $value) {
				if ($key != 'passwors' && !is_numeric($key))
					$_SESSION['login_' . $key] = $value;
			}
			// $ip = isset($_SERVER['HTTP_CLIENT_IP']) ? $_SERVER['HTTP_CLIENT_IP'] : isset($_SERVER['HTTP_X_FORWARDED_FOR']) ? $_SERVER['HTTP_X_FORWARDED_FOR'] : $_SERVER['REMOTE_ADDR'];
			$this->db->query("UPDATE cart set user_id = '" . $_SESSION['login_user_id'] . "' where client_ip ='$ip' ");
			return 1;
		} else {
			return 3;
		}
	}
	function logout()
	{
		session_destroy();
		foreach ($_SESSION as $key => $value) {
			unset($_SESSION[$key]);
		}
		header("location:login.php");
	}
	function logout2()
	{
		session_destroy();
		foreach ($_SESSION as $key => $value) {
			unset($_SESSION[$key]);
		}
		header("location:../index.php");
	}
	function save_client(){
		include 'api/v1/uuid/UuidGenerator.php';
		extract($_POST);
		$birth_facilitator=$BirthFacilitator;
		$birth_place=$BirthPlace;
		$birth_no=$BithCertificateNo;
		$firstname=$FirstName;
		$middleName=$MiddleName;
		$lastname=$LastName;
		$dob=date('Y-m-d H:i:s',strtotime($dob));
		$Gender=$Gender;
		$Mtaa=$Mtaa;
		$Kijiji=$Kijiji;
		$Kitongoji=$Kitongoji;

		$FullName=$FullName;
		$Email=$Email;
		$Phoneno=$Phoneno;
		$relationship=$relationship;
		$uuid = guidv4();
		
		$client = " client_id =''";
		$client .= ", first_name = '$firstname' ";
		$client .= ", middle_name = '$middleName' ";
		$client .= ", last_name = '$lastname' ";
		$client .= ", dob = '$dob' ";
		$client .= ", gender = '$Gender' ";
		$client .= ", birth_no = '$birth_no' ";
		$client .= ", birth_place = '$birth_place' ";
		$client .= ", birth_facilitator = '$birth_facilitator' ";
		$client .= ", creator = '1' ";
		$client .= ", uuid = '$uuid' ";


		$save_client = $this->db->query("INSERT INTO client set " . $client);
		$saved_client_id = $this->db->insert_id;

		if ($save_client) {
			$location = " location_id = '' ";
			$location .= ", client = '$saved_client_id' ";
			$location .= ", mtaa = '$Mtaa' ";
			$location .= ", kijiji = '$Kijiji' ";
			$location .= ", kitongoji = '$Kitongoji' ";
			$location .= ", creator = '1' ";
			$location .= ", uuid = '$uuid' ";

			$save_client_location = $this->db->query("INSERT INTO client_location set " . $location);
		}

		if ($save_client_location) {
			foreach ($FullName as $k => $v) :
				$uuid = guidv4();
				$parent = " parent_id = '' ";
				$parent .= ", full_name = '$FullName[$k]' ";
				$parent .= ", phone_no = '$Phoneno[$k]' ";
				$parent .= ", email = '$Email[$k]' ";
				$parent .= ", creator = '1' ";
				$parent .= ", uuid = '$uuid' ";
				$save_parent = $this->db->query("INSERT INTO parent set " . $parent);
				$parent_id = $this->db->insert_id;
				if ($save_parent) {
					$client_parent = " client_parent_id = '' ";
					$client_parent .= ", client = '$saved_client_id' ";
					$client_parent .= ", parent = '$parent_id' ";
					$client_parent .= ", relation  = '$relationship[$k]' ";
					$client_parent .= ",  uuid = '$uuid' ";
					$save_client_parent = $this->db->query("INSERT INTO client_parent set " . $client_parent);
				}
			endforeach;
		}
		if ($save_client_parent) {
			# code...
			return 1;
		}else {
			return 2;
		}
		
	}
	function save_user()
	{
		extract($_POST);
		$data = " name = '$name' ";
		$data .= ", username = '$username' ";
		$data .= ", password = '$password' ";
		$data .= ", role = '$role' ";
		if (isset($type))
			$data .= ", type = '$type' ";
		if (empty($id)) {
			$save = $this->db->query("INSERT INTO users set " . $data);
		} else {
			$save = $this->db->query("UPDATE users set " . $data . " where id = " . $id);
		}
		if ($save) {
			return 1;
		}
	}
	function save_role()
	{
		extract($_POST);
		$creator = $_SESSION['login_id'];
		date_default_timezone_set("Africa/Nairobi");
		$date = date("y-m-d H:i:sa");
		if (empty($role_id)) {
			$data = " role_id = '' ";
			$data .= ", role_name = '$RoleName' ";
			$data .= ", Description = '$Description'";
			$data .= ", creator='$creator'";
			$data .= ", date_created='$date'";
			$save_role = $this->db->query("INSERT INTO user_role set " . $data);
			$inserted_role_id = $this->db->insert_id;
			foreach ($role_privilages as $k => $v) {
				$data = " user_role_privieges_id = '' ";
				$data .= ", user_role_id = '$inserted_role_id' ";
				$data .= ", role_privileges_id = '$role_privilages[$k]' ";
				$data .= ", creator= '$creator' ";
				$data .= ", date_created= '$date' ";
				$save_privilege_on_role[] = $this->db->query("INSERT INTO user_role_privieges set " . $data);
			}
			if (isset($save_privilege_on_role)) {
				if ($save_role) {
					return 1;
				}
			}
		} else {
			date_default_timezone_set("Africa/Nairobi");
			$date = date("y-m-d H:i:sa");
			$changer = $_SESSION['login_id'];
			$datechanged = $date;
			$creator = $_SESSION['login_id'];
			// $data = " role_id = '' ";
			$data = " role_name = '$RoleName' ";
			$data .= ", Description = '$Description' ";
			$data .= ", changed_by = '$changer' ";
			$data .= ", date_changed = '$datechanged' ";
			$update_role = $this->db->query("UPDATE user_role SET {$data} WHERE role_id= {$role_id} ");
			if ($update_role) {
				$delete_role_on_update = $this->db->query("DELETE FROM user_role_privieges WHERE user_role_id ={$role_id}");
				foreach ($role_privilages as $k => $v) {
					$data = " user_role_privieges_id = '' ";
					$data .= ", user_role_id = '$role_id' ";
					$data .= ", role_privileges_id = '$role_privilages[$k]' ";
					$data .= ", creator= '$creator' ";
					$data .= ", date_created= '$date' ";
					$update_privilege_on_role[] = $this->db->query("INSERT INTO user_role_privieges set " . $data);
				}
				if ($update_privilege_on_role) {
					return 2;
				}
			}
		}
	}
	function delete_role()
	{
		extract($_POST);
	}
	function signup()
	{
		extract($_POST);
		$data = " first_name = '$first_name' ";
		$data .= ", last_name = '$last_name' ";
		$data .= ", mobile = '$mobile' ";
		$data .= ", address = '$address' ";
		$data .= ", email = '$email' ";
		$data .= ", password = '" . md5($password) . "' ";
		$chk = $this->db->query("SELECT * FROM user_info where email = '$email' ")->num_rows;
		if ($chk > 0) {
			return 2;
			exit;
		}
		$save = $this->db->query("INSERT INTO user_info set " . $data);
		if ($save) {
			$login = $this->login2();
			return 1;
		}
	}

	function save_settings()
	{
		extract($_POST);
		$data = " name = '$name' ";
		$data .= ", email = '$email' ";
		$data .= ", contact = '$contact' ";
		$data .= ", about_content = '" . htmlentities(str_replace("'", "&#x2019;", $about)) . "' ";
		if ($_FILES['img']['tmp_name'] != '') {
			$fname = strtotime(date('y-m-d H:i')) . '_' . $_FILES['img']['name'];
			$move = move_uploaded_file($_FILES['img']['tmp_name'], '../assets/img/' . $fname);
			$data .= ", cover_img = '$fname' ";
		}

		// echo "INSERT INTO system_settings set ".$data;
		$chk = $this->db->query("SELECT * FROM system_settings");
		if ($chk->num_rows > 0) {
			$save = $this->db->query("UPDATE system_settings set " . $data . " where id =" . $chk->fetch_array()['id']);
		} else {
			$save = $this->db->query("INSERT INTO system_settings set " . $data);
		}
		if ($save) {
			$query = $this->db->query("SELECT * FROM system_settings limit 1")->fetch_array();
			foreach ($query as $key => $value) {
				if (!is_numeric($key))
					$_SESSION['setting_' . $key] = $value;
			}

			return 1;
		}
	}
	function check_for_product()
	{
		extract($_POST);
		extract($_GET);
		// function chk_available_for_sales_transaction($product_id){
		// 	include "db_connect.php";
		// $inn = $conn->query("SELECT sum(qty) as inn FROM inventory where type = 1  AND batch_no IN (SELECT batch_no FROM product_by_batch) and product_id = ".$product_id);
		// $inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
		// $out = $conn->query("SELECT sum(qty) as `out` FROM inventory where type = 2 AND batch_no IN (SELECT batch_no FROM product_by_batch) and product_id = ".$product_id);
		// $out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;

		// $ex = $conn->query("SELECT sum(qty) as ex FROM expired_product where batch_no IN (SELECT batch_no FROM product_by_batch) and product_id = ".$product_id);
		// $ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;

		// $available = $inn - $out- $ex;
		// return $available;
		// }
		if ($product_id == 2) {
			$nhif_product = $this->db->query("SELECT * FROM product_list pl INNER JOIN product_nhif_reference_map pnrm ON pnrm.product_id=pl.id LEFT OUTER JOIN nhif_product_list npl ON npl.nhif_code=pnrm.nhif_code AND pl.item_units_id=npl.item_units_id INNER JOIN item_units iu ON pl.item_units_id=iu.item_units_id");
			if ($nhif_product) {
				while ($row = $nhif_product->fetch_assoc()) {
					// $available=chk_available_for_sales_transaction($row['id']);
					$data_report[] = array(
						"id" => $row['id'],
						"name" => $row['name'],
						"generic_name" => $row['item_name'],
						"measurement" => $row['strength'],
						"description" => $row['description'],
						"nhif_code" => $row['nhif_code'],
						"price" => $row['item_price'],
						"item_units_id" => $row['item_units_name'],
						// "available"=>$available,
						"scheme" => $product_id
					);
				}
			}
		} else {
			$product = $this->db->query("SELECT * FROM product_list pl INNER JOIN item_units iu on iu.item_units_id=pl.item_units_id");
			if ($product) {
				while ($row = mysqli_fetch_assoc($product)) {
					// $available=chk_available_for_sales_transaction($row['id']);
					$data_report[] = array(
						"id" => $row['id'],
						"name" => $row['name'],
						"generic_name" => $row['name'],
						"measurement" => $row['measurement'],
						"description" => $row['description'],
						"price" => $row['price'],
						"item_units_id" => $row['item_units_name'],
						// "available"=>$available,
						"scheme" => $product_id
					);
				}
			}
		}
		echo json_encode($data_report);
	}
	function save_min_max_stock_product()
	{
		extract($_POST);
		if (empty($product_stock_levels_id)) {
			$creator = $_SESSION['login_id'];
			date_default_timezone_set("Africa/Nairobi");
			$date = date("y-m-d H:i:sa");
			$data = " product_stock_levels_id = ' ' ";
			$data .= ", product_id = '$product' ";
			$data .= ", item_units_id = '$units' ";
			$data .= ", min_stock_level = '$minlevel' ";
			$data .= ", max_stock_level = '$maxlevel' ";
			$data .= ", creator  = '$creator' ";
			$data .= ", date_created = '$date' ";
			$save = $this->db->query("INSERT INTO product_stock_levels set " . $data);
			if ($save) {
				return 1;
			} else {
				return mysqli_error($this->db);
			}
		} else {
			$changed_by = $_SESSION['login_id'];
			date_default_timezone_set("Africa/Nairobi");
			$date_changed = date("y-m-d H:i:sa");
			$data = " product_id = '$product' ";
			$data .= ", item_units_id = '$units' ";
			$data .= ", min_stock_level = '$minlevel' ";
			$data .= ", max_stock_level = '$maxlevel' ";
			$data .= ", changed_by = '$changed_by' ";
			$data .= ", date_changed = '$date_changed' ";
			$save = $this->db->query("UPDATE product_stock_levels SET {$data} WHERE product_stock_levels_id=" . $product_stock_levels_id);
			if ($save) {
				return 2;
			} else {
				return mysqli_error($this->db);
			}
		}
	}
	function delete_min_max_stock_product()
	{
		extract($_POST);
		$delete = $this->db->query("DELETE FROM product_stock_levels where product_stock_levels_id =" . $product_stock_levels_id);
		if ($delete) {
			return 1;
		} else {
			return mysqli_error($this->db);
		}
	}
	function save_category()
	{
		extract($_POST);
		$data = "item_category_name= '$name' ";
		if (empty($id)) {
			$creator = $_SESSION['login_id'];
			date_default_timezone_set("Africa/Nairobi");
			$date = date("y-m-d H:i:sa");
			// $datecreated= new DateTime('now');
			$data .= ", creator='$creator'";
			$data .= ", date_created='$date'";
			$save = $this->db->query("INSERT INTO item_categories set " . $data);
			if ($save) {
				return 1;
			}
		} else {
			date_default_timezone_set("Africa/Nairobi");
			$date = date("y-m-d H:i:sa");
			$changer = $_SESSION['login_id'];
			$datechanged = $date;
			$data .= ", changed_by='$changer'";
			$data .= ", date_changed='$datechanged'";
			$save = $this->db->query("UPDATE item_categories set " . $data . " where item_category_id=" . $id);
			if ($save)
				return 2;
		}
	}
	function delete_category()
	{
		extract($_POST);
		$delete = $this->db->query("DELETE FROM item_categories where item_category_id=" . $id);
		if ($delete)
			return 1;
	}

	function save_group()
	{
		extract($_POST);
		$data = " drug_group_name = '$name' ";
		if (empty($id)) {
			$creator = $_SESSION['login_id'];
			date_default_timezone_set("Africa/Nairobi");
			$date = date("y-m-d H:i:sa");
			// $datecreated= new DateTime('now');
			$data .= ", creator='$creator'";
			$data .= ", date_created='$date'";
			$save = $this->db->query("INSERT INTO drug_group set " . $data);
			if ($save)
				return 1;
		} else {
			date_default_timezone_set("Africa/Nairobi");
			$date = date("y-m-d H:i:sa");
			$changer = $_SESSION['login_id'];
			$datechanged = $date;
			$data .= ", changed_by='$changer'";
			$data .= ", date_changed='$datechanged'";
			$save = $this->db->query("UPDATE drug_group set " . $data . " where drug_group_id=" . $id);
			if ($save)
				return 2;
		}
	}
	function delete_group()
	{
		extract($_POST);
		$delete = $this->db->query("DELETE FROM drug_group where drug_group_id = " . $id);
		if ($delete)
			return 1;
	}
	function save_type()
	{
		extract($_POST);
		$data = " item_units_name = '$name' ";
		if (empty($id)) {
			$creator = $_SESSION['login_id'];
			date_default_timezone_set("Africa/Nairobi");
			$date = date("y-m-d H:i:sa");
			// $datecreated= new DateTime('now');
			$data .= ", creator='$creator'";
			$data .= ", date_created='$date'";
			$save = $this->db->query("INSERT INTO item_units set " . $data);
		} else {
			date_default_timezone_set("Africa/Nairobi");
			$date = date("y-m-d H:i:sa");
			$changer = $_SESSION['login_id'];
			$datechanged = $date;
			$data .= ", changed_by='$changer'";
			$data .= ", date_changed='$datechanged'";
			$save = $this->db->query("UPDATE item_units set " . $data . " where item_units_id=" . $id);
		}
		if ($save)
			return 1;
	}
	function delete_type()
	{
		extract($_POST);
		$delete = $this->db->query("DELETE FROM item_units where item_units_id=" . $id);
		if ($delete)
			return 1;
	}
	function save_supplier()
	{
		extract($_POST);
		$data = " supplier_name = '$name' ";
		$data .= ", contact = '$contact' ";
		$data .= ", address = '$address' ";
		if (empty($id)) {
			$save = $this->db->query("INSERT INTO supplier_list set " . $data);
		} else {
			$save = $this->db->query("UPDATE supplier_list set " . $data . " where id=" . $id);
		}
		if ($save)
			return 1;
	}
	function delete_supplier()
	{
		extract($_POST);
		$delete = $this->db->query("DELETE FROM supplier_list where id = " . $id);
		if ($delete)
			return 1;
	}
	function save_product()
	{
		extract($_POST);
		if (empty($sku)) {
			$sku = mt_rand(1, 99999999);
			$sku = sprintf("%'08d\n", $sku);
			$i = 1;
			while ($i == 1) {
				$chk = $this->db->query("SELECT * FROM product_list where sku ='$sku'")->num_rows;
				if ($chk > 0) {
					$sku = mt_rand(1, 99999999);
					$sku = sprintf("%'08d\n", $sku);
				} else {
					$i = 0;
				}
			}
		}
		$data = " item_category_id = '$category_id' ";
		$data .= "=, drug_group_id = '$group_id' ";
		$data .= ", item_units_id = '$units' ";
		$data .= ", sku = '$sku' ";
		// $data .= ", price = '$price' ";
		// $data .= ", wholesale_price = '$wholesale_price' ";
		$data .= ", name = '$name' ";
		// $data .= ", category_id = '".implode(",",$category_id)."' ";
		$data .= ", measurement = '$measurement' ";
		$data .= ", description = '$description' ";
		if (!isset($prescription)) {
			$prescription = '';
		} else {
			$prescription;
		}
		$data .= ", prescription = '$prescription' ";
		if (empty($id)) {
			$creator = $_SESSION['login_id'];
			date_default_timezone_set("Africa/Nairobi");
			$date = date("y-m-d H:i:sa");
			// $datecreated= new DateTime('now');
			$data .= ", creator = '$creator' ";
			$data .= ", date_created = '$date' ";
			// $save = $this->db->query("INSERT INTO `product_list` set ".$data);
			// $save= $this->db->query("INSERT INTO `product_list`(`id`, `item_category_id`, `drug_group_id`, `item_units_id`, `sku`, `price`, `wholesale_price`, `name`, `measurement`, `description`, `prescription`, `creator`, `date_created`)
			// 						 VALUES ('','".$category_id."','".$group_id."','".$units."','".$sku."','".$price."','".$wholesale_price."','".$name."','".$measurement."','".$description."','".$prescription."','".$creator."','".$date."')");
			// $sql1="INSERT INTO `product_list`(`id`, `item_category_id`, `drug_group_id`, `item_units_id`, `sku`, `price`, `wholesale_price`, `name`, `measurement`, `description`, `prescription`, `creator`, `date_created`) VALUES ('','".$category_id."','".$group_id."','".$units."','".$sku."','".$price."','".$wholesale_price."','".$name."','".$measurement."','".$description."','".$prescription."','".$creator."','".$date."') ";
			$sql1 = "INSERT INTO `product_list`(`id`, `item_category_id`, `drug_group_id`, `item_units_id`, `sku`,`name`, `measurement`, `description`, `prescription`, `creator`, `date_created`) VALUES ('','" . $category_id . "','" . $group_id . "','" . $units . "','" . $sku . "','" . $name . "','" . $measurement . "','" . $description . "','" . $prescription . "','" . $creator . "','" . $date . "') ";
			$save = $this->db->query($sql1);
			if ($save) {
				return 1;
			}
		} else {
			date_default_timezone_set("Africa/Nairobi");
			$date = date("y-m-d H:i:sa");
			$changer = $_SESSION['login_id'];
			$datechanged = $date;
			$data .= ", changed_by = '$changer' ";
			$data .= ", date_changed= '$datechanged' ";
			// return 2;
			// $save = $this->db->query("UPDATE product_list SET category_id='".$category_id."',type_id='".$type_id."',price='".$price."',wholesale_price='".$wholesale_price."',name='".$name."',measurement='".$measurement."',description='".$description."',prescription='".$prescription."',changed_by='".$changer."',date_changed='".$datechanged."' WHERE sku='".$sku."'");
			$sql_update = "UPDATE `product_list` SET `item_category_id`='" . $category_id . "',`drug_group_id`='" . $group_id . "',`item_units_id`='" . $units . "',`sku`='" . $sku . "',`price`='" . $price . "',`wholesale_price`='" . $wholesale_price . "',`name`='" . $name . "',`measurement`='" . $measurement . "',`description`='" . $description . "',`prescription`='" . $prescription . "',`changed_by`='" . $changer . "',`date_changed`='" . $datechanged . "' WHERE `id`='" . $id . "'";
			$save = $this->db->query($sql_update);
			if ($save) {
				return 2;
			}
		}
	}

	function delete_product()
	{
		extract($_POST);
		$delete = $this->db->query("DELETE FROM product_list where id = " . $id);
		if ($delete)
			return 1;
	}
	function delete_user()
	{
		extract($_POST);
		$delete = $this->db->query("DELETE FROM users where id = " . $id);
		if ($delete)
			return 1;
	}

	function save_receiving()
	{
		extract($_POST);
		$type = 1;
		$data = " supplier_id = '$supplier_id' ";
		$data .= ", total_amount = '$tamount' ";

		if (empty($id)) {
			$ref_no = mt_rand(1, 99999999);
			$ref_no = sprintf("%'08d\n", $ref_no);
			$i = 1;

			while ($i == 1) {
				$chk = $this->db->query("SELECT * FROM receiving_list where ref_no ='$ref_no'")->num_rows;
				if ($chk > 0) {
					$ref_no = mt_rand(1, 99999999);
					$ref_no = sprintf("%'.08d\n", $ref_no);
				} else {
					$i = 0;
				}
			}
			$data .= ", ref_no = '$ref_no' ";
			$save = $this->db->query("INSERT INTO receiving_list set " . $data);
			$id = $this->db->insert_id;
			$creator = $_SESSION['login_id'];
			function check_item_available_quantity_by_batch($product_id, $batch_no)
			{
				include 'db_connect.php';
				$inn = mysqli_query($conn, "SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = '" . $product_id . "' and batch_no = '" . $batch_no . "'");
				$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
				$out = mysqli_query($conn, "SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = '" . $product_id . "' and batch_no = '" . $batch_no . "'");
				$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
				$ex = mysqli_query($conn, "SELECT sum(qty) as ex FROM expired_product where product_id = '" . $product_id . "' and batch_no = '" . $batch_no . "'");
				$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
				$available_by_batch = $inn - $out - $ex;

				return $available_by_batch;
			}
			function check_item_available_quantity($product_id)
			{
				include 'db_connect.php';
				$inn = mysqli_query($conn, "SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = " . $product_id);
				$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
				$out = mysqli_query($conn, "SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = " . $product_id);
				$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
				$ex = mysqli_query($conn, "SELECT sum(qty) as ex FROM expired_product where product_id = " . $product_id);
				$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
				$available = $inn - $out - $ex;

				return $available;
			}
			foreach ($product_id as $k => $v) {
				$available[] = check_item_available_quantity($product_id[$k]);
				$kk = $product_id[$k];
				$data = " form_id = '$id' ";
				$data .= ", product_id = '$product_id[$k]' ";
				$data .= ", item_units_id = '$units[$k]' ";
				$data .= ", batch_no = '$batch_no[$k]' ";
				$data .= ", qty = '$qty[$k]' ";
				$data .= ", price = '$bprice[$k]' ";
				$data .= ", expiry_date = '$expiry_date[$k]' ";
				$data .= ", type = '1' ";
				$data .= ", stock_from = 'receiving' ";
				$details = json_encode(array('price' => $bprice[$k], 'qty' => $qty[$k]));
				$data .= ", other_details = '$details' ";
				$data .= ", remarks = 'Stock from Receiving-" . $ref_no . "' ";
				date_default_timezone_set("Africa/Nairobi");
				$date = date("y-m-d H:i:sa");
				$product_on_receiving = " product_id = '$product_id[$k]' ";
				$product_on_receiving .= ", item_units_id = '$units[$k]' ";
				$product_on_receiving .= ", batch_no = '$batch_no[$k]' ";
				$product_on_receiving .= ", qty = '$qty[$k]' ";
				$product_on_receiving .= ", buying_price = '$bprice[$k]' ";
				$product_on_receiving .= ", total_amount = '$qty[$k]*$bprice[$k]' ";
				$product_on_receiving .= ", receiving_invoice_number = '$ref_no' ";
				$product_on_receiving .= ", creator = '$creator' ";
				$product_on_receiving .= ", date_created = '$date' ";

				$prod = " price = '$sprice[$k]' ";
				$prod .= " ,wholesale_price = '$wprice[$k]' ";



				$update = " voided= '1' ";
				$update .= ", voided_by = '$creator' ";
				$update .= ", voided_date = '$date' ";

				$price = " product_id = '$product_id[$k]' ";
				$price .= ", price_list_selling_price = '$sprice[$k]' ";
				$price .= ", price_list_buying_pice = '$bprice[$k]' ";
				$price .= ", price_list_wholesale_price = '$wprice[$k]' ";
				$price .= ", creator = '$creator' ";

				$saveUpdate = $this->db->query("UPDATE price_list set " . $update . " where product_id =" . $kk);
				$save = $this->db->query("UPDATE product_list set " . $prod . " where id =" . $kk);

				$save_product_on_receiving_list = $this->db->query("INSERT INTO product_on_receiving_list SET" . $product_on_receiving);

				$save1 = $this->db->query("INSERT INTO price_list set" . $price);
				$on_batch_available = check_item_available_quantity_by_batch($product_id[$k], $batch_no[$k]);
				$save2[] = $this->db->query("INSERT INTO inventory set " . $data);
				$inventory_id[] = $this->db->insert_id;
				$batch = " product_by_batch_id = '' ";
				$batch .= ", product_id = '$product_id[$k]' ";
				$batch .= ", batch_no = '$batch_no[$k]' ";
				$batch .= ", qty = '$qty[$k]' ";
				$batch .= ", inventory_id = '$inventory_id[$k]' ";
				$batch .= ", expiredate = '$expiry_date[$k]' ";
				$batch .= ", batch_preference = '0'";
				$batch .= ", creator = '$creator' ";
				// $batch .=" date_created = '' ";
				$save4[] = $this->db->query("INSERT INTO product_by_batch set" . $batch);
				$triggerphph1 = "UPDATE `product_by_batch` SET batch_preference=0 WHERE product_id='" . $product_id[$k] . "'AND transaction_type_id=1 AND expired_confirmed=0 AND os_confirmed=0";
				$save5 = $this->db->query($triggerphph1);
				$triggerphph = "UPDATE `product_by_batch` SET batch_preference=1 WHERE product_id='" . $product_id[$k] . "' AND expired_confirmed=0 AND os_confirmed=0 AND transaction_type_id=1 AND expiredate=(SELECT MIN(date(expiredate)) FROM product_by_batch WHERE product_id ={$product_id[$k]})";
				$save7 = $this->db->query($triggerphph);
				$on_hand_by_batch = " product_on_hand_by_batch_id = '' ";
				$on_hand_by_batch .= ", product_id = '$product_id[$k]' ";
				$on_hand_by_batch .= ", batch_no = '$batch_no[$k]' ";
				$on_hand_by_batch .= ", qty_before = '$on_batch_available' ";
				$on_hand_by_batch .= ", qty_consumed = '$qty[$k]' ";
				$after_batch = $on_batch_available + $qty[$k];
				$on_hand_by_batch .= ", qty_after = '$after_batch' ";
				// $on_hand_by_batch .=", inventory_id = '' ";
				$on_hand_by_batch .= ", transaction_type = '1' ";
				$on_hand_by_batch .= ", creator = '$creator' ";
				$save6 = $this->db->query("INSERT INTO product_on_hand_by_batch SET" . $on_hand_by_batch);
			}
			foreach ($product_id as $k => $v) :
				$creator = $_SESSION['login_id'];
				date_default_timezone_set("Africa/Nairobi");
				$date = date("y-m-d H:i:sa");
				$data = " product_on_hand_id = '' ";
				$data .= ", product_id = '$product_id[$k]' ";
				$data .= ", item_units_id = '$units[$k]' ";
				$data .= ", qty_before = '$available[$k]' ";

				$qty_after = $available[$k] + $qty[$k];
				$data .= ", qty_after = '$qty_after' ";
				$data .= ", qty_consumed = '$qty[$k]' ";
				$data .= ", inventory_id = '$inventory_id[$k]' ";
				// $amount1=$price[$k]*$qty[$k];
				// $creator=$_SESSION['login_id'];
				$data .= ", creator = '$creator'";
				$data .= ", transaction_type  = '$type'";
				// $data .=", creator = '$creator' ";
				$data .= ", date_created = '$date' ";

				$save1 = $this->db->query("INSERT INTO product_on_hand set " . $data);
			endforeach;
			if ($save2) {
				if ($save4) {
					return 1;
				} else {
					return mysqli_error($this->db);
				}
			}
		} else {
			$save = $this->db->query("UPDATE receiving_list set " . $data . " where id =" . $id);
			$ids = implode(",", $inv_id);
			$this->db->query("DELETE FROM inventory where type = 1 and form_id = '$id' and id NOT IN (" . $ids . ") ");
			foreach ($product_id as $k => $v) {
				$data = " form_id = '$id' ";
				$data .= ", product_id = '$product_id[$k]' ";
				$data .= ", qty = '$qty[$k]' ";
				$data .= ", price = '$bprice[$k]' ";
				$data .= ", type = '1' ";
				$data .= ", stock_from = 'receiving' ";
				$details = json_encode(array('price' => $bprice[$k], 'qty' => $qty[$k]));
				$data .= ", other_details = '$details' ";
				$data .= ", remarks = 'Stock from Receiving-" . $ref_no . "' ";
				if (!empty($inv_id[$k])) {
					$save2[] = $this->db->query("UPDATE inventory set " . $data . " where id=" . $inv_id[$k]);
				} else {
					$save2[] = $this->db->query("INSERT INTO inventory set " . $data);
				}
			}
			if (isset($save2)) {

				return 2;
			}
		}
	}
	function save_requisition()
	{
		extract($_POST);
		extract($_GET);
		function request_number()
		{
			include 'db_connect.php';
			$_query = mysqli_query($conn, 'SELECT irn.value as value from inv_request_number irn where source=1 order by irn.request_number_id desc limit 1')->fetch_array()['value'];
			$values = explode("/", $_query);
			if ($values[2] >= 999) {
				$new_middle_number = sprintf("%'03d", ($values[1] + 1));
				$new_last_number = substr(sprintf("%'03d", ($values[2] + 2)), -3);
				$new_first_string = $values[0];
				$request_number = $new_first_string . '/' . $new_middle_number . '/' . $new_last_number;
			} else {
				$new_middle_number = sprintf("%'03d", ($values[1]));
				$new_last_number = sprintf("%'03d", ($values[2] + 1));
				$new_first_string = $values[0];
				$request_number = $new_first_string . '/' . $new_middle_number . '/' . $new_last_number;
			}
			return $request_number;
		}
		$creator = $_SESSION['login_id'];
		$data = "source_store = '2'";
		$data .= ", destination_store = '$Requesting_store' ";
		$data .= ", creator = '$creator' ";
		$save_to_inv_request = $this->db->query("INSERT INTO inv_request set " . $data);
		$request = $this->db->insert_id;
		foreach ($product_id as $k => $v) :
			$data = " request_item_id = '' ";
			$data .= ", request = '$request' ";
			$data .= ", product_id = '$product_id[$k]' ";
			$data .= ", item_units_id = '$units[$k]' ";
			$data .= ", quantity = '$qty[$k]' ";
			$data .= ", equivalent_quantity = '$qty[$k]' ";
			// $data .= ", rejected = '0' ";
			// $data .= ", completed = '0' ";
			// $data .= ", voided = '0' ";
			$data .= ", creator = '$creator' ";
			// $sql_mm="INSERT INTO `inv_request_item`(`request_item_id`, `request`, `product_id`, `item_units_id`, `quantity`, `equivalent_quantity`, `rejected`, `date_rejected`, `rejected_by`, `reject_reason`, `completed`, `completed_by`, `creator`, `date_created`, `changed_by`, `date_changed`, `voided`, `date_voided`, `voided_by`, `void_reason`) VALUES ('','".$request."','".$product_id[$k]."','".$units[$k]."','".$qty[$k]."','".$qty[$k]."','0',null,null,null,'0',null,'".$creator."','',null,null,'0',null,null,null)";
			$save_inv_request_item = $this->db->query("INSERT INTO inv_request_item(request_item_id,request, product_id, item_units_id, quantity, equivalent_quantity,creator) VALUES ('','" . $request . "','" . $product_id[$k] . "','" . $units[$k] . "','" . $qty[$k] . "','" . $qty[$k] . "','" . $creator . "')");
		// $save_inv_request_item = $this->db->query("INSERT INTO `inv_request_item`(`request_item_id`, `request`, `product_id`, `item_units_id`, `quantity`, `equivalent_quantity`, `rejected`, `date_rejected`, `rejected_by`, `reject_reason`, `completed`, `completed_by`, `creator`, `date_created`, `changed_by`, `date_changed`, `voided`, `date_voided`, `voided_by`, `void_reason`) VALUES ('','".$request."','".$product_id[$k]."','".$units[$k]."','".$qty[$k]."','".$qty[$k]."','0',null,null,null,'0',null,'".$creator."','',null,null,'0',null,null,null)");
		endforeach;
		if ($save_to_inv_request) {
			$req_number = request_number();
			if (empty($CustomReqNo)) {
				$data = "source = '1'";
				$data .= ", request = '$request' ";
				$data .= ", value = '$req_number' ";
				$data .= ", creator = '$creator' ";
				$save_inv_request_number = $this->db->query("INSERT INTO inv_request_number set " . $data);
			} else {
				$data = "source = '1'";
				$data .= ", request = '$request' ";
				$data .= ", value = '$req_number' ";
				$data .= ", creator = '$creator' ";
				$save_inv_request_number1 = $this->db->query("INSERT INTO inv_request_number set " . $data);
				$data = "source = '2'";
				$data .= ", request = '$request' ";
				$data .= ", value = '$CustomReqNo' ";
				$data .= ", creator = '$creator' ";
				$save_inv_request_number2 = $this->db->query("INSERT INTO inv_request_number set " . $data);
			}
			if ($save_inv_request_item) {
				return 1;
			} else {
				return mysqli_error($this->db);
			}
		}
	}
	function import_receiving()
	{
		include("db_connect.php");
		$type = 1;
		$creator = $_SESSION['login_id'];
		// validate to check uploaded file is a valid csv file
		function check_item_available_quantity_by_batch($product_id, $batch_no)
		{
			include 'db_connect.php';
			$inn = mysqli_query($conn, "SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = '" . $product_id . "' and batch_no = '" . $batch_no . "'");
			$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
			$out = mysqli_query($conn, "SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = '" . $product_id . "' and batch_no = '" . $batch_no . "'");
			$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
			$ex = mysqli_query($conn, "SELECT sum(qty) as ex FROM expired_product where product_id = '" . $product_id . "' and batch_no = '" . $batch_no . "'");
			$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
			$available_by_batch = $inn - $out - $ex;

			return $available_by_batch;
		}
		function check_item_available_quantity($product_id)
		{
			include 'db_connect.php';
			$inn = mysqli_query($conn, "SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = " . $product_id);
			$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
			$out = mysqli_query($conn, "SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = " . $product_id);
			$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
			$ex = mysqli_query($conn, "SELECT sum(qty) as ex FROM expired_product where product_id = " . $product_id);
			$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
			$available = $inn - $out - $ex;

			return $available;
		}
		$file_mimes = array('text/x-comma-separated-values', 'text/comma-separated-values', 'application/octet-stream', 'application/vnd.ms-excel', 'application/x-csv', 'text/x-csv', 'text/csv', 'application/csv', 'application/excel', 'application/vnd.msexcel', 'text/plain');
		if (!empty($_FILES['file']['name']) && in_array($_FILES['file']['type'], $file_mimes)) {
			if (is_uploaded_file($_FILES['file']['tmp_name'])) {
				$csv_file = fopen($_FILES['file']['tmp_name'], 'r');
				//fgetcsv($csv_file); 
				fgetcsv($csv_file);
				// $number=count(file($csv_file,FILE_SKIP_EMPTY_LINES));          
				// get data records from csv file
				$row = 0;
				while (($column = fgetcsv($csv_file)) !== FALSE) {
					//store column data into variables
					$product_id[] = $column[0];
					$units[] = $column[1];
					$batch_no[] = $column[4];
					$qty[] = $column[5];
					$bprice[] = $column[6];
					$sprice[] = $column[7];
					$wprice[] = $column[8];
					$expiry_date[] = $column[9];
					$row++;
				}
				fclose($csv_file);
				for ($k = 0; $k < $row; $k++) :
					$ref_no = mt_rand(1, 99999999);
					$ref_no = sprintf("%'.08d\n", $ref_no);
					$tamount = $qty[$k] * $bprice[$k];
					$data = " supplier_id = '1' ";
					$data .= ", total_amount = '$tamount' ";
					$ref_no = sprintf("%'08d\n", $ref_no);
					$i = 1;
					while ($i == 1) {
						$chk = $this->db->query("SELECT * FROM receiving_list where ref_no ='$ref_no'")->num_rows;
						if ($chk > 0) {
							$ref_no = mt_rand(1, 99999999);
							$ref_no = sprintf("%'.08d\n", $ref_no);
						} else {
							$i = 0;
						}
					}
					// $ref_no[]=$ref_no;
					$data .= ", ref_no = '$ref_no' ";
					$save = $this->db->query("INSERT INTO receiving_list set " . $data);
					$id[] = $this->db->insert_id;

				endfor;
				// foreach($product_id as $k => $v):
				for ($k = 0; $k < $row; $k++) :
					$available[] = check_item_available_quantity($product_id[$k]);
					$on_batch_available[] = check_item_available_quantity_by_batch($product_id[$k], $batch_no[$k]);
					$kk = $product_id[$k];
					$data = " form_id = '$id[$k]' ";
					$data .= ", product_id = '$product_id[$k]' ";
					$data .= ", item_units_id = '$units[$k]' ";
					$data .= ", batch_no = '$batch_no[$k]' ";
					$data .= ", qty = '$qty[$k]' ";
					$data .= ", price = '$bprice[$k]' ";
					$data .= ", expiry_date = '$expiry_date[$k]' ";
					$data .= ", type = '1' ";
					$data .= ", stock_from = 'receiving' ";
					$details = json_encode(array('price' => $bprice[$k], 'qty' => $qty[$k]));
					$data .= ", other_details = '$details' ";
					$data .= ", remarks = 'Stock from Receiving-" . $ref_no . "' ";

					$prod = " price = '$sprice[$k]' ";
					$prod .= " ,wholesale_price = '$wprice[$k]' ";


					date_default_timezone_set("Africa/Nairobi");
					$date = date("y-m-d H:i:sa");
					$product_on_receiving = " product_id = '$product_id[$k]' ";
					$product_on_receiving .= ", item_units_id = '$units[$k]' ";
					$product_on_receiving .= ", batch_no = '$batch_no[$k]' ";
					$product_on_receiving .= ", qty = '$qty[$k]' ";
					$product_on_receiving .= ", buying_price = '$bprice[$k]' ";
					$total_amount = $qty[$k] * $bprice[$k];
					$product_on_receiving .= ", total_amount = '$total_amount' ";
					$product_on_receiving .= ", receiving_invoice_number = '$ref_no' ";
					$product_on_receiving .= ", creator = '$creator' ";
					$product_on_receiving .= ", date_created = '$date' ";

					$update = " voided= '1' ";
					$update .= ", voided_by = '$creator' ";
					$update .= ", voided_date = '$date' ";

					$price = " product_id = '$product_id[$k]' ";
					$price .= ", price_list_selling_price = '$sprice[$k]' ";
					$price .= ", price_list_buying_pice = '$bprice[$k]' ";
					$price .= ", price_list_wholesale_price = '$wprice[$k]' ";
					$price .= ", creator = '$creator' ";

					$saveUpdate = $this->db->query("UPDATE price_list set " . $update . " where product_id =" . $kk);
					$save = $this->db->query("UPDATE product_list set " . $prod . " where id =" . $kk);

					$save_product_on_receiving_list[] = $this->db->query("INSERT INTO product_on_receiving_list SET" . $product_on_receiving);

					$save1 = $this->db->query("INSERT INTO price_list set" . $price);

					$save2 = $this->db->query("INSERT INTO inventory set " . $data);
					$inventory_id[] = $this->db->insert_id;
					$batch = " product_by_batch_id = '' ";
					$batch .= ", product_id = '$product_id[$k]' ";
					$batch .= ", batch_no = '$batch_no[$k]' ";
					$batch .= ", qty = '$qty[$k]' ";
					$batch .= ", inventory_id = '$inventory_id[$k]' ";
					$batch .= ", expiredate = '$expiry_date[$k]' ";
					$batch .= ", batch_preference = '0'";
					$batch .= ", creator = '$creator' ";
					// $batch .=" date_created = '' ";
					$save4 = $this->db->query("INSERT INTO product_by_batch set" . $batch);
					$triggerphph1 = "UPDATE `product_by_batch` SET batch_preference=0 WHERE product_id='" . $product_id[$k] . "'AND transaction_type_id=1 AND expired_confirmed=0 AND os_confirmed=0";
					$save5 = $this->db->query($triggerphph1);
					$triggerphph = "UPDATE `product_by_batch` SET batch_preference=1 WHERE product_id='" . $product_id[$k] . "' AND expired_confirmed=0 AND os_confirmed=0 AND transaction_type_id=1 AND expiredate=(SELECT MIN(date(expiredate)) FROM product_by_batch WHERE product_id ={$product_id[$k]})";
					$save7 = $this->db->query($triggerphph);
					$on_hand_by_batch = " product_on_hand_by_batch_id = '' ";
					$on_hand_by_batch .= ", product_id = '$product_id[$k]' ";
					$on_hand_by_batch .= ", batch_no = '$batch_no[$k]' ";
					$on_hand_by_batch .= ", qty_before = '$on_batch_available[$k]' ";
					$on_hand_by_batch .= ", qty_consumed = '$qty[$k]' ";
					$after_batch = $on_batch_available[$k] + $qty[$k];
					$on_hand_by_batch .= ", qty_after = '$after_batch' ";
					// $on_hand_by_batch .=", inventory_id = '' ";
					$on_hand_by_batch .= ", transaction_type = '1' ";
					$on_hand_by_batch .= ", creator = '$creator' ";
					$save6 = $this->db->query("INSERT INTO product_on_hand_by_batch SET" . $on_hand_by_batch);
				// endforeach;
				endfor;
				foreach ($product_id as $k => $v) :
					$creator = $_SESSION['login_id'];
					date_default_timezone_set("Africa/Nairobi");
					$date = date("y-m-d H:i:sa");
					$data = " product_on_hand_id = '' ";
					$data .= ", product_id = '$product_id[$k]' ";
					$data .= ", item_units_id = '$units[$k]' ";
					$data .= ", qty_before = '$available[$k]' ";

					$qty_after = $available[$k] + $qty[$k];
					$data .= ", qty_after = '$qty_after' ";
					$data .= ", qty_consumed = '$qty[$k]' ";
					$data .= ", inventory_id = '$inventory_id[$k]' ";
					// $amount1=$price[$k]*$qty[$k];
					// $creator=$_SESSION['login_id'];
					$data .= ", creator = '$creator'";
					$data .= ", transaction_type  = '$type'";
					// $data .=", creator = '$creator' ";
					$data .= ", date_created = '$date' ";

					$save20 = $this->db->query("INSERT INTO product_on_hand set " . $data);
				endforeach;
				if ($save4) {
					$import_status = '?import_status=success';
				} else {
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
	function import_item_price()
	{
		$file_mimes = array('text/x-comma-separated-values', 'text/comma-separated-values', 'application/octet-stream', 'application/vnd.ms-excel', 'application/x-csv', 'text/x-csv', 'text/csv', 'application/csv', 'application/excel', 'application/vnd.msexcel', 'text/plain');
		if (!empty($_FILES['file']['name']) && in_array($_FILES['file']['type'], $file_mimes)) {
			if (is_uploaded_file($_FILES['file']['tmp_name'])) {
				$csv_file = fopen($_FILES['file']['tmp_name'], 'r');
				//fgetcsv($csv_file); 
				fgetcsv($csv_file);
				// $number=count(file($csv_file,FILE_SKIP_EMPTY_LINES));          
				// get data records from csv file
				$row = 0;
				while (($column = fgetcsv($csv_file)) !== FALSE) {
					//store column data into variables
					$product_id[] = $column[0];
					$units[] = $column[1];
					$price_list_buying_pice[] = $column[3];
					$price_list_selling_price[] = $column[4];
					$price_list_wholesale_price[] = $column[5];
					$row++;
				}
				fclose($csv_file);
				$creator = $_SESSION['login_id'];
				date_default_timezone_set("Africa/Nairobi");
				$date = date("y-m-d H:i:sa");
				for ($k = 0; $k < $row; $k++) {
					$prod = " price = '$price_list_selling_price[$k]' ";
					$prod .= " ,wholesale_price = '$price_list_wholesale_price[$k]' ";

					$update = " voided= '1' ";
					$update .= ", voided_by = '$creator' ";
					$update .= ", voided_date = '$date' ";

					$price = " product_id = '$product_id[$k]' ";
					$price .= ", price_list_selling_price = '$price_list_selling_price[$k]' ";
					$price .= ", price_list_buying_pice = '$price_list_buying_pice[$k]' ";
					$price .= ", price_list_wholesale_price = '$price_list_wholesale_price[$k]' ";
					$price .= ", creator = '$creator' ";

					$Void_price_list = $this->db->query("UPDATE price_list set " . $update . " where product_id =" . $product_id[$k]);
					$Update_product_list = $this->db->query("UPDATE product_list set " . $prod . " where id =" . $product_id[$k]);

					$Insert_price_list = $this->db->query("INSERT INTO price_list set" . $price);
				}
				if ($Insert_price_list) {
					$import_status = '?import_status=success';
				} else {
					$import_status =  mysqli_error($this->db);
				}
			} else {
				$import_status = '?import_status=error';
			}
		} else {
			$import_status = '?import_status=invalid_file';
		}
		return $import_status;
	}
	function delete_receiving()
	{
		extract($_POST);
		$del1 = $this->db->query("DELETE FROM receiving_list where id = $id ");
		$del2 = $this->db->query("DELETE FROM inventory where type = 1 and form_id = $id ");
		if ($del1 && $del2)
			return 1;
	}
	function save_customer()
	{
		extract($_POST);
		$data = " name = '$name' ";
		$data .= ", contact = '$contact' ";
		$data .= ", address = '$address' ";
		if (empty($id)) {
			$save = $this->db->query("INSERT INTO customer_list set " . $data);
			if ($save)
				return 1;
		} else {
			$save = $this->db->query("UPDATE customer_list set " . $data . " where id=" . $id);
			if ($save)
				return 2;
		}
	}
	function delete_customer()
	{
		extract($_POST);
		$delete = $this->db->query("DELETE FROM customer_list where id = " . $id);
		if ($delete)
			return 1;
	}
	function chk_prod_availability_insurance()
	{

		extract($_POST);
		// $cheme_id;
		extract($_GET);
		$cheme_id;
		// $cheme_id = $_POST['cheme_id'];

		$price = $this->db->query("SELECT * FROM product_list where id = " . $id)->fetch_assoc()['price'];
		$item_units_id = $this->db->query("SELECT * FROM product_list where id = " . $id)->fetch_assoc()['item_units_id'];
		$price_nhif = $this->db->query("SELECT * FROM product_list pl INNER JOIN product_nhif_reference_map pnrm ON pnrm.product_id=pl.id LEFT OUTER JOIN nhif_product_list npl ON npl.nhif_code=pnrm.nhif_code AND pl.item_units_id=npl.item_units_id INNER JOIN item_units iu ON pl.item_units_id=iu.item_units_id WHERE pl.id = " . $id)->fetch_assoc()['item_price'];

		$inn = $this->db->query("SELECT sum(qty) as inn FROM inventory where type = 1 and batch_no in (select pbb.batch_no from product_by_batch pbb ) and product_id = " . $id);
		$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
		$out = $this->db->query("SELECT sum(qty) as `out` FROM inventory where type = 2 and batch_no in (select pbb.batch_no from product_by_batch pbb ) and product_id = " . $id);
		$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
		$ex = $this->db->query("SELECT sum(qty) as ex FROM expired_product where batch_no in (select pbb.batch_no from product_by_batch pbb ) and product_id = " . $id);
		$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
		$available = $inn - $out - $ex;
		$prescribe = $this->db->query("SELECT * FROM product_list where id = " . $id)->fetch_assoc()['prescription'];
		return json_encode(array('available' => $available, 'price' => $price, 'price_nhif' => $price_nhif, 'prescribe' => $prescribe, 'item_units_id' => $item_units_id, 'product_id' => $id));
	}

	function chk_prod_availability()
	{
		extract($_POST);
		extract($_GET);
		$price = $this->db->query("SELECT * FROM product_list where id = " . $id)->fetch_assoc()['price'];
		$inn = $this->db->query("SELECT sum(qty) as inn FROM inventory where type = 1 and batch_no in (select pbb.batch_no from product_by_batch pbb ) and product_id = " . $id);
		$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
		$out = $this->db->query("SELECT sum(qty) as `out` FROM inventory where type = 2 and batch_no in (select pbb.batch_no from product_by_batch pbb ) and product_id = " . $id);
		$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
		$ex = $this->db->query("SELECT sum(qty) as ex FROM expired_product batch_no in (select pbb.batch_no from product_by_batch pbb ) and where product_id = " . $id);
		$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
		$available = $inn - $out - $ex;
		$prescribe = $this->db->query("SELECT * FROM product_list where id = " . $id)->fetch_assoc()['prescription'];
		return json_encode(array('available' => $available, 'price' => $price, 'prescribe' => $prescribe));
	}
	function chk_prod_availability_for_invoice()
	{
		extract($_POST);
		extract($_GET);
		$price = $this->db->query("SELECT * FROM product_list where id = " . $id)->fetch_assoc()['wholesale_price'];
		$inn = $this->db->query("SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = " . $id);
		$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
		$out = $this->db->query("SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = " . $id);
		$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
		$ex = $this->db->query("SELECT sum(qty) as ex FROM expired_product where product_id = " . $id);
		$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
		$available = $inn - $out - $ex;
		return json_encode(array('available' => $available, 'price' => $price));
	}
	function check_item_available_quantity($product_id)
	{
		include 'db_connect.php';
		$inn = mysqli_query($conn, "SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = " . $product_id);
		$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
		$out = mysqli_query($conn, "SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = " . $product_id);
		$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
		$ex = mysqli_query($conn, "SELECT sum(qty) as ex FROM expired_product where product_id = " . $product_id);
		$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
		$available = $inn - $out - $ex;

		return $available;
	}
	function check_item_available_quantity_by_batch($product_id, $batch_no)
	{
		include 'db_connect.php';
		extract($_GET);
		$inn = mysqli_query($conn, "SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = " . $product_id . " and batch_no = " . $batch_no);
		$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
		$out = mysqli_query($conn, "SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = " . $product_id . " and batch_no = " . $batch_no);
		$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
		$ex = mysqli_query($conn, "SELECT sum(qty) as ex FROM expired_product where product_id = " . $product_id . " and batch_no = " . $batch_no);
		$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
		$available_by_batch = $inn - $out - $ex;

		return $available_by_batch;
	}
	function check_item_available_quantity_by_batch_for_sale($product_id, $batch_no)
	{
		include 'db_connect.php';
		extract($_GET);
		$inn = mysqli_query($conn, "SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = '" . $product_id . "' and batch_no = '" . $batch_no . "'");
		$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
		$out = mysqli_query($conn, "SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = '" . $product_id . "' and batch_no = '" . $batch_no . "'");
		$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
		$ex = mysqli_query($conn, "SELECT sum(qty) as ex FROM expired_product where product_id = '" . $product_id . "' and batch_no = '" . $batch_no . "'");
		$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
		$available_by_batch = $inn - $out - $ex;

		return $available_by_batch;
	}
	function save_wholesale()
	{
		extract($_POST);
		$type = 1;
		$transaction_type = 2;
		if (empty($id_wholesale)) {
			$ref_no = sprintf("%'.08d\n", $ref_no);
			$i = 1;

			while ($i == 1) {
				$chk = $this->db->query("SELECT * FROM sales_list where ref_no ='$ref_no'")->num_rows;
				if ($chk > 0) {
					$ref_no = mt_rand(1, 99999999);
					$ref_no = sprintf("%'.08d\n", $ref_no);
				} else {
					$i = 0;
				}
			}
			$creator = $_SESSION['login_id'];
			date_default_timezone_set("Africa/Nairobi");
			$date = date("y-m-d H:i:sa");
			$name = " customer_id = ''";
			$name .= ", customer_name ='$customer_name'";
			$name .= ", creator = '$creator' ";
			$name .= ", folio_number = '$folio_number' ";
			$name .= ", date_created = '$date' ";
			$save_customer = $this->db->query("INSERT INTO customers SET" . $name);
			$customer_id = $this->db->insert_id;
			$data = " customer_id = '$customer_id' ";
			$data .= ", total_amount = '$tamount' ";
			$data .= ", sales_type = '$type' ";
			$data .= ", amount_tendered = '$amount_tendered' ";
			$data .= ", amount_change = '$change' ";
			$data .= ", creator = '$creator' ";
			date_default_timezone_set("Africa/Nairobi");
			$number = date('Ymd', strtotime(date("y-m-d H:i:sa"))) . "-" . $ref_no;
			$data .= ", ref_no = '$ref_no' ";
			$data .= ", payment_scheme_id = '$scheme' ";
			$data .= ", sales_invoice_number = '$number' ";
			$save = $this->db->query("INSERT INTO sales_list set " . $data);
			$id_wholesale = $this->db->insert_id;
			function check_item_available_quantity($product_id)
			{
				include 'db_connect.php';
				$inn = mysqli_query($conn, "SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = " . $product_id);
				$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
				$out = mysqli_query($conn, "SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = " . $product_id);
				$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
				$ex = mysqli_query($conn, "SELECT sum(qty) as ex FROM expired_product where product_id = " . $product_id);
				$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
				$available = $inn - $out - $ex;

				return $available;
			}
			foreach ($product_id as $k => $v) :
				$creator = $_SESSION['login_id'];
				date_default_timezone_set("Africa/Nairobi");
				$date = date("y-m-d H:i:sa");
				$available = check_item_available_quantity($product_id[$k]);
				$data = " product_on_hand_id = '' ";
				$data .= ", product_id = '$product_id[$k]' ";
				$data .= ", item_units_id = '$units[$k]' ";

				$data .= ", qty_before = '$available' ";

				$qty_after = $available - $qty[$k];
				$data .= ", qty_after = '$qty_after' ";
				$data .= ", qty_consumed = '$qty[$k]' ";
				$data .= ", sales_list_id = '$id_wholesale' ";
				$data .= ", creator = '$creator'";
				$data .= ", transaction_type  = '$transaction_type'";
				$data .= ", date_created = '$date' ";
				$save1[] = $this->db->query("INSERT INTO product_on_hand set " . $data);
			endforeach;
			function check_item_available_quantity_by_batch_for_sale($product_id, $batch_no)
			{
				include 'db_connect.php';
				$inn = mysqli_query($conn, "SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = '" . $product_id . "' and batch_no = '" . $batch_no . "'");
				$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
				$out = mysqli_query($conn, "SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = '" . $product_id . "' and batch_no = '" . $batch_no . "'");
				$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
				$ex = mysqli_query($conn, "SELECT sum(qty) as ex FROM expired_product where product_id = '" . $product_id . "' and batch_no = '" . $batch_no . "'");
				$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
				$available_by_batch = $inn - $out - $ex;

				return $available_by_batch;
			}
			function check_the_batch_for_product($product_id)
			{
				include 'db_connect.php';
				$batchNo = mysqli_query($conn, "SELECT batch_no as batch_no from product_by_batch where batch_preference=1 and product_id =" . $product_id);
				$batchNo = $batchNo && $batchNo->num_rows > 0 ? $batchNo->fetch_array()['batch_no'] : '';
				return $batchNo;
			}
			function product_sales_by_batch_algorism($product_id, $qty, $id, $creator)
			{
				include 'db_connect.php';
				$type = 1;
				$batchNo = check_the_batch_for_product($product_id);
				$available_by_batch_on_sales = check_item_available_quantity_by_batch_for_sale($product_id, $batchNo);
				if ($available_by_batch_on_sales > $qty) :
					$data1 = " product_on_hand_by_batch_id = '' ";
					$data1 .= ", product_id = '$product_id' ";
					$data1 .= ", batch_no = '$batchNo' ";
					$data1 .= ", qty_before = '$available_by_batch_on_sales' ";
					$remained = $available_by_batch_on_sales - $qty;
					$qty_after_by_batch = $remained;
					$data1 .= ", qty_consumed = '$available_by_batch_on_sales' ";
					$data1 .= ", qty_after = '$qty_after_by_batch' ";
					$data1 .= ", sales_list_id = '$id_wholesale' ";
					date_default_timezone_set("Africa/Nairobi");
					$date = date("y-m-d H:i:sa");
					$data1 .= ", transaction_type = '$transaction_type' ";
					$data1 .= ", creator = '$creator' ";
					$data1 .= ", date_created = '$date' ";
					$save4[] = mysqli_query($conn, "INSERT INTO product_on_hand_by_batch SET" . $data1);
					if ($save4) :
						$success = 1;
						return $success;
						exit();
					endif;
				else :
					$data1 = " product_on_hand_by_batch_id = '' ";
					$data1 .= ", product_id = '$product_id' ";
					$data1 .= ", batch_no = '$batchNo' ";
					$data1 .= ", qty_before = '$available_by_batch_on_sales' ";
					$remained = $qty - $available_by_batch_on_sales;
					$qty_after_by_batch = 0;
					$qty = $remained;
					$data1 .= ", qty_consumed = '$available_by_batch_on_sales' ";
					$data1 .= ", qty_after = '$qty_after_by_batch' ";
					$data1 .= ", sales_list_id = '$id_wholesale' ";
					date_default_timezone_set("Africa/Nairobi");
					$date = date("y-m-d H:i:sa");
					$data1 .= ", transaction_type = '$transaction_type' ";
					$data1 .= ", creator = '$creator' ";
					$data1 .= ", date_created = '$date' ";
					$save4[] = mysqli_query($conn, "INSERT INTO product_on_hand_by_batch SET" . $data1);
					if ($save4) :
						product_sales_by_batch_algorism($product_id, $qty, $id, $type, $creator);
					endif;
				endif;
			}

			foreach ($product_id as $k => $v) :
				$batchNo = check_the_batch_for_product($product_id[$k]);
				$available_by_batch_on_sales = check_item_available_quantity_by_batch_for_sale($product_id[$k], $batchNo);
				$ppid = $qty[$k];
				if ($qty[$k] <= $available_by_batch_on_sales) :
					$data = " product_on_hand_by_batch_id = '' ";
					$data .= ", product_id = '$product_id[$k]' ";
					$data .= ", batch_no = '$batchNo' ";
					$data .= ", qty_before = '$available_by_batch_on_sales' ";
					$consumed = $qty[$k];
					$qty_after_by_batch = $available_by_batch_on_sales - $qty[$k];
					$data .= ", qty_after = '$qty_after_by_batch' ";
					$data .= ", qty_consumed = '$consumed' ";
					$data .= ", sales_list_id = '$id_wholesale' ";
					date_default_timezone_set("Africa/Nairobi");
					$date = date("y-m-d H:i:sa");
					$data .= ", transaction_type = '$transaction_type' ";
					$data .= ", creator = '$creator' ";
					$data .= ", date_created = '$date' ";
					$save41[] = $this->db->query("INSERT INTO product_on_hand_by_batch SET" . $data);
					$product_on_hand_by_batch_id = $this->db->insert_id;
				else :
					$mm = product_sales_by_batch_algorism($product_id[$k], $qty[$k], $id, $creator);
				endif;

			endforeach;

			foreach ($product_id as $k => $v) {
				$batchNo = check_the_batch_for_product($product_id[$k]);
				$data = " form_id = '$id_wholesale' ";
				$data .= ", product_id = '$product_id[$k]' ";
				$data .= ", batch_no = '$batchNo' ";
				$data .= ", qty = '$qty[$k]' ";
				$data .= ", price = '$price[$k]' ";
				$data .= ", type = '2' ";
				$data .= ", stock_from = 'Sales' ";
				$details = json_encode(array('price' => $price[$k], 'qty' => $qty[$k]));
				$data .= ", other_details = '$details' ";
				$data .= ", remarks = 'Stock out from Sales-" . $ref_no . "' ";

				$save2[] = $this->db->query("INSERT INTO inventory set " . $data);
			}
			if (isset($save2)) {
				foreach ($product_id as $k => $v) :
					$creator = $_SESSION['login_id'];
					date_default_timezone_set("Africa/Nairobi");
					$date = date("y-m-d H:i:sa");
					$data = "product_on_sales_list_id = ''";
					$data .= ", product_id = '$product_id[$k]' ";
					$data .= ", qty = '$qty[$k]' ";
					$data .= ", rate_price = '$price[$k]' ";
					$amount1 = $price[$k] * $qty[$k];
					$data .= ", total_amount = '$amount1'";
					$data .= ", sales_invoice_number = '$number'";
					$data .= ", creator = '$creator' ";
					$data .= ", date_created = '$date' ";

					$save3[] = $this->db->query("INSERT INTO product_on_sales_lists set " . $data);
				endforeach;
				if ($save2) {
					if ($save3) {
						return $id_wholesale;
					}
				}
			}
		} else {
			$save = $this->db->query("UPDATE sales_list set " . $data . " where id=" . $id);
			$ids = implode(",", $inv_id);
			$this->db->query("DELETE FROM inventory where type = 1 and form_id ='$id' and id NOT IN (" . $ids . ") ");
			foreach ($product_id as $k => $v) {
				$data = " form_id = '$id' ";
				$data .= ", product_id = '$product_id[$k]' ";
				$data .= ", qty = '$qty[$k]' ";
				$data .= ", type = '2' ";
				$data .= ", stock_from = 'Sales' ";
				$details = json_encode(array('price' => $price[$k], 'qty' => $qty[$k]));
				$data .= ", other_details = '$details' ";
				$data .= ", remarks = 'Stock out from Sales-" . $ref_no . "' ";

				if (!empty($inv_id[$k])) {
					$save2[] = $this->db->query("UPDATE inventory set " . $data . " where id=" . $inv_id[$k]);
				} else {
					$save2[] = $this->db->query("INSERT INTO inventory set " . $data);
				}
			}
			if (isset($save2)) {
				return $id;
			}
		}
	}
	function sale_invoice_number()
	{
		include 'db_connect.php';
		$_query = mysqli_query($conn, 'SELECT sl.sales_invoice_number from sales_list sl  order by sl.id desc limit 1')->fetch_array()['sales_invoice_number'];
		$values = explode("-", $_query);
		date_default_timezone_set("Africa/Nairobi");
		$date = date("Y-m-d H:i:sa");
		$number = date('Ymd', strtotime(date("y-m-d h:i:sa")));
		if ($values[0] == $number) {
			$new_first_string = $values[0];
			$new_last_number = sprintf("%'04d", ($values[1] + 1));
			$sale_invoice_number = $new_first_string . '-' . $new_last_number;
		} else {
			$new_first_string = $number;
			$new_last_number = substr(sprintf("%'04d", (9999 + 2)), -4);
			$sale_invoice_number = $new_first_string . '-' . $new_last_number;
		}
		return $sale_invoice_number;
	}
	function save_sales_insurance()
	{
		extract($_POST);
		if (empty($id)) {
			$sales_type = 2;
			// $paymethod='';
			date_default_timezone_set("Africa/Nairobi");
			$date = date("Y-m-d H:i:sa");
			function product_sales_by_batch_algorism($product_id, $qty, $id, $creator)
			{
				include 'db_connect.php';
				$sales_type = 2;
				$batchNo = check_the_batch_for_product($product_id);
				$available_by_batch_on_sales = check_item_available_quantity_by_batch_for_sale($product_id, $batchNo);
				if ($available_by_batch_on_sales > $qty) :
					$data1 = " product_on_hand_by_batch_id = '' ";
					$data1 .= ", product_id = '$product_id' ";
					$data1 .= ", batch_no = '$batchNo' ";
					$data1 .= ", qty_before = '$available_by_batch_on_sales' ";
					$remained = $available_by_batch_on_sales - $qty;
					$qty_after_by_batch = $remained;
					$data1 .= ", qty_consumed = '$available_by_batch_on_sales' ";
					$data1 .= ", qty_after = '$qty_after_by_batch' ";
					$data1 .= ", sales_list_id = '$id' ";
					date_default_timezone_set("Africa/Nairobi");
					$date = date("y-m-d H:i:sa");
					$data1 .= ", transaction_type = '$sales_type' ";
					$data1 .= ", creator = '$creator' ";
					$data1 .= ", date_created = '$date' ";
					$save4[] = mysqli_query($conn, "INSERT INTO product_on_hand_by_batch SET" . $data1);
					if ($save4) :
						$success = 1;
						return $success;
						exit();
					endif;
				else :
					$data1 = " product_on_hand_by_batch_id = '' ";
					$data1 .= ", product_id = '$product_id' ";
					$data1 .= ", batch_no = '$batchNo' ";
					$data1 .= ", qty_before = '$available_by_batch_on_sales' ";
					$remained = $qty - $available_by_batch_on_sales;
					$qty_after_by_batch = 0;
					$qty = $remained;
					$data1 .= ", qty_consumed = '$available_by_batch_on_sales' ";
					$data1 .= ", qty_after = '$qty_after_by_batch' ";
					$data1 .= ", sales_list_id = '$id' ";
					date_default_timezone_set("Africa/Nairobi");
					$date = date("y-m-d H:i:sa");
					$data1 .= ", transaction_type = '$sales_type' ";
					$data1 .= ", creator = '$creator' ";
					$data1 .= ", date_created = '$date' ";
					$save4[] = mysqli_query($conn, "INSERT INTO product_on_hand_by_batch SET" . $data1);
					if ($save4) :
						product_sales_by_batch_algorism($product_id, $qty, $id, $type, $creator);
					endif;
				endif;
			}
			function check_item_available_quantity($product_id)
			{
				include 'db_connect.php';
				$inn = mysqli_query($conn, "SELECT sum(qty) as inn FROM inventory where type = 1 and batch_no in (select pbb.batch_no from product_by_batch pbb ) and product_id = " . $product_id);
				$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
				$out = mysqli_query($conn, "SELECT sum(qty) as `out` FROM inventory where type = 2 and batch_no in (select pbb.batch_no from product_by_batch pbb ) and product_id = " . $product_id);
				$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
				$ex = mysqli_query($conn, "SELECT sum(qty) as ex FROM expired_product where  batch_no in (select pbb.batch_no from product_by_batch pbb ) AND product_id = " . $product_id);
				$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
				$available = $inn - $out - $ex;
				return $available;
			}
			function check_item_available_quantity_by_batch_for_sale($product_id, $batch_no)
			{
				include 'db_connect.php';
				$inn = mysqli_query($conn, "SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = '" . $product_id . "' and batch_no = '" . $batch_no . "'");
				$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
				$out = mysqli_query($conn, "SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = '" . $product_id . "' and batch_no = '" . $batch_no . "'");
				$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
				$ex = mysqli_query($conn, "SELECT sum(qty) as ex FROM expired_product where product_id = '" . $product_id . "' and batch_no = '" . $batch_no . "'");
				$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
				$available_by_batch = $inn - $out - $ex;
				return $available_by_batch;
			}
			function check_the_batch_for_product($product_id)
			{
				include 'db_connect.php';
				$batchNo = mysqli_query($conn, "SELECT batch_no as batch_no from product_by_batch where expiredate=(select min(date(expiredate) ) from product_by_batch where product_id='$product_id') and product_id =" . $product_id);
				$batchNo = $batchNo && $batchNo->num_rows > 0 ? $batchNo->fetch_array()['batch_no'] : '';
				return $batchNo;
			}
			function sale_invoice_number()
			{
				include 'db_connect.php';
				$_query = mysqli_query($conn, 'SELECT sl.sales_invoice_number from sales_list sl  order by sl.id desc limit 1')->fetch_array()['sales_invoice_number'];
				$values = explode("-", $_query);
				date_default_timezone_set("Africa/Nairobi");
				$date = date("Y-m-d H:i:sa");
				$number = date('Ymd', strtotime(date("y-m-d h:i:sa")));
				if ($values[0] == $number) {
					$new_first_string = $values[0];
					$new_last_number = sprintf("%'04d", ($values[1] + 1));
					$sale_invoice_number = $new_first_string . '-' . $new_last_number;
				} else {
					$new_first_string = $number;
					$new_last_number = substr(sprintf("%'04d", (9999 + 2)), -4);
					$sale_invoice_number = $new_first_string . '-' . $new_last_number;
				}
				return $sale_invoice_number;
			}
			$ref_no = sprintf("%'.08d\n", $ref_no);
			$i = 1;
			while ($i == 1) {
				$chk = $this->db->query("SELECT * FROM sales_list where ref_no ='$ref_no'")->num_rows;
				if ($chk > 0) {
					$ref_no = mt_rand(1, 99999999);
					$ref_no = sprintf("%'.08d\n", $ref_no);
				} else {
					$i = 0;
				}
			}
			// $paymethod;
			//code to save customer;
			$creator = $_SESSION['login_id'];
			$name = " customer_id = ''";
			$name .= ", customer_name ='$customer_name'";
			$name .= ", creator = '$creator' ";
			$name .= ", date_created = '$date' ";
			$save_customer = $this->db->query("INSERT INTO customers SET" . $name);
			$customer_id = $this->db->insert_id;
			//code to save customer;

			//code to save prescription;
			$prescribers = " prescription_id = '' ";
			$prescribers .= ", prescription_source = '$source_of_prescription' ";
			$prescribers .= ", prescriber = '$name_of_prescriber' ";
			$prescribers .= ", prescribed_date = '$prescribed_date' ";
			$prescribers .= ", creator = '$creator' ";
			$prescribers .= ", date_created = '$date' ";
			$save_presciption = $this->db->query("INSERT INTO prescription SET" . $prescribers);
			$prescription_id = $this->db->insert_id;
			//code to save prescription;

			//code to save total sales;
			$data = " customer_id = '$customer_id' ";
			if ($paymethod == 5) {
				$data .= ", total_amount = '0' ";
			} else {
				if ($amount_discounted) {
					$data .= ", total_amount = '$amount_tendered' ";
				} else {
					$data .= ", total_amount = '$tamount' ";
				}
			}

			$data .= ", sales_type = '$sales_type' ";
			$data .= ", amount_tendered = '$amount_tendered' ";
			$data .= ", amount_change = '$change' ";
			$data .= ", payment_scheme_id = '$paymethod' ";
			if ($save_presciption) {
				$data .= ", prescription = '$prescription_id' ";
			}
			$data .= ", creator = '$creator' ";
			$sales_invoice_number = sale_invoice_number();
			$data .= ", ref_no = '$ref_no' ";
			$data .= ", sales_invoice_number = '$sales_invoice_number' ";
			$save = $this->db->query("INSERT INTO sales_list set " . $data);
			$id = $this->db->insert_id;
			if ($amount_discounted > 0) {
				date_default_timezone_set("Africa/Nairobi");
				$date = date("y-m-d H:i:sa");
				$discount = " discount_on_sales_id = '' ";
				$discount .= ", sales_invoice_number = '$sales_invoice_number'";
				$discount .= ", total_amount = '$tamount' ";
				$discount .= ", discount_amount = '$amount_discounted' ";
				$discount .= ", payable_amount = '$amount_tendered' ";
				$discount .= ", creator = '$creator' ";
				$discount .= ", date_created = '$date' ";
				$save_discount = $this->db->query("INSERT INTO discount_on_sales set " . $discount);
			}
			if ($paymethod == 4) {
				$lipa = " sales_invoice_number = '$sales_invoice_number' ";
				$lipa .= ", bill_no = '$lipa_namba' ";
				if ($amount_discounted) {
					$lipa .= ", total_amount = '$amount_tendered' ";
				} else {
					$lipa .= ", paid_amount = '$tamount' ";
				}
				$lipa .= ", creator = '$creator' ";
				$save_lipa_number = $this->db->query("INSERT INTO lipa_namba SET" . $lipa);
			}
			if ($paymethod == 5) {
				$dept = " sales_invoice_number = '$sales_invoice_number' ";
				$dept .= ", deptor_name = '$deptor_name' ";
				$dept .= ", deptor_phone_no = '$deptor_phone_number' ";
				$dept .= ", dept_amount = '$amount_tendered' ";
				$dept .= ", dept_due_date = '$dept_end_date' ";
				$dept .= ", creator = '$creator' ";
				$save_dept = $this->db->query("INSERT INTO dept_pay SET" . $dept);
			}
			if ($paymethod == 6) {
			}

			//SAVE ON PRODUCT ON HAND
			foreach ($product_id as $k => $v) :
				$creator = $_SESSION['login_id'];
				date_default_timezone_set("Africa/Nairobi");
				$date = date("y-m-d H:i:sa");
				$available = check_item_available_quantity($product_id[$k]);
				$data = " product_on_hand_id = '' ";
				$data .= ", product_id = '$product_id[$k]' ";
				$data .= ", item_units_id = '$units[$k]' ";
				$data .= ", qty_before = '$available' ";
				$qty_after = $available - $qty[$k];
				$data .= ", qty_after = '$qty_after' ";
				$data .= ", qty_consumed = '$qty[$k]' ";
				$data .= ", sales_list_id = '$id' ";
				$data .= ", creator = '$creator'";
				$data .= ", transaction_type  = '$sales_type'";
				$data .= ", date_created = '$date' ";
				$save1[] = $this->db->query("INSERT INTO product_on_hand set " . $data);
			endforeach;
			//SAVE ON PRODUCT ON HAND

			//save product on hand by batch sold
			foreach ($product_id as $k => $v) :
				$batchNo = check_the_batch_for_product($product_id[$k]);
				$available_by_batch_on_sales = check_item_available_quantity_by_batch_for_sale($product_id[$k], $batchNo);
				$ppid = $qty[$k];
				if ($qty[$k] <= $available_by_batch_on_sales) :
					$data = " product_on_hand_by_batch_id = '' ";
					$data .= ", product_id = '$product_id[$k]' ";
					$data .= ", batch_no = '$batchNo' ";
					$data .= ", qty_before = '$available_by_batch_on_sales' ";
					$consumed = $qty[$k];
					$qty_after_by_batch = $available_by_batch_on_sales - $qty[$k];
					$data .= ", qty_after = '$qty_after_by_batch' ";
					$data .= ", qty_consumed = '$consumed' ";
					$data .= ", sales_list_id = '$id' ";
					date_default_timezone_set("Africa/Nairobi");
					$date = date("y-m-d H:i:sa");
					$data .= ", transaction_type = '$sales_type' ";
					$data .= ", creator = '$creator' ";
					$data .= ", date_created = '$date' ";
					$save41[] = $this->db->query("INSERT INTO product_on_hand_by_batch SET" . $data);
					$product_on_hand_by_batch_id = $this->db->insert_id;
				else :
					$mm = product_sales_by_batch_algorism($product_id[$k], $qty[$k], $id, $creator);
				endif;
			endforeach;
			//save product on hand by batch sold

			//save into table inventory
			foreach ($product_id as $k => $v) {
				$batchNo = check_the_batch_for_product($product_id[$k]);
				$data = " form_id = '$id' ";
				$data .= ", product_id = '$product_id[$k]' ";
				$data .= ", item_units_id = '$units[$k]' ";
				$data .= ", batch_no = '$batchNo' ";
				$data .= ", qty = '$qty[$k]' ";
				$data .= ", price = '$price[$k]' ";
				$data .= ", type = '2' ";
				$data .= ", stock_from = 'Sales' ";
				$details = json_encode(array('price' => $price[$k], 'qty' => $qty[$k]));
				$data .= ", other_details = '$details' ";
				$data .= ", remarks = 'Stock out from Sales-" . $sales_invoice_number . "' ";

				$save2[] = $this->db->query("INSERT INTO inventory set " . $data);
			}
			//save into table inventory

			// finalization on sales to store item lines
			if (isset($save2)) {
				foreach ($product_id as $k => $v) :
					$creator = $_SESSION['login_id'];
					date_default_timezone_set("Africa/Nairobi");
					$date = date("y-m-d H:i:sa");
					$data = "product_on_sales_list_id = ''";
					$data .= ", product_id = '$product_id[$k]' ";
					$data .= ", qty = '$qty[$k]' ";
					$data .= ", rate_price = '$price[$k]' ";
					$amount1 = $price[$k] * $qty[$k];
					$data .= ", total_amount = '$amount1'";
					$data .= ", sales_invoice_number = '$sales_invoice_number'";
					$data .= ", creator = '$creator' ";
					$data .= ", date_created = '$date' ";
					$save3[] = $this->db->query("INSERT INTO product_on_sales_lists set " . $data);
				endforeach;
				if ($save2) {
					if ($save3) {
						return $id;
					}
				}
			}
			// finalization on sales to store item lines
		} else {
			# code...
		}
	}
	function save_sales()
	{
		extract($_POST);
		$type = 2;
		date_default_timezone_set("Africa/Nairobi");
		$date = date("y-m-d H:i:sa");
		if (empty($id)) {
			$ref_no = sprintf("%'.08d\n", $ref_no);
			$i = 1;

			while ($i == 1) {
				$chk = $this->db->query("SELECT * FROM sales_list where ref_no ='$ref_no'")->num_rows;
				if ($chk > 0) {
					$ref_no = mt_rand(1, 99999999);
					$ref_no = sprintf("%'.08d\n", $ref_no);
				} else {
					$i = 0;
				}
			}
			$creator = $_SESSION['login_id'];
			$name = " customer_id = ''";
			$name .= ", customer_name ='$customer_name'";
			$name .= ", creator = '$creator' ";
			$name .= ", date_created = '$date' ";
			$save_customer = $this->db->query("INSERT INTO customers SET" . $name);
			$customer_id = $this->db->insert_id;
			$prescribers = " prescription_id = '' ";
			$prescribers .= ", prescription_source = '$source_of_prescription' ";
			$prescribers .= ", prescriber = '$name_of_prescriber' ";
			$prescribers .= ", prescribed_date = '$prescribed_date' ";
			$prescribers .= ", creator = '$creator' ";
			$prescribers .= ", date_created = '$date' ";
			$save_presciption = $this->db->query("INSERT INTO prescription SET" . $prescribers);
			$prescription_id = $this->db->insert_id;
			// $creator=$_SESSION['login_id'];
			$data = " customer_id = '$customer_id' ";
			if ($amount_discounted) {
				$data .= ", total_amount = '$amount_tendered' ";
			} else {
				$data .= ", total_amount = '$tamount' ";
			}

			$data .= ", sales_type = '$type' ";
			$data .= ", amount_tendered = '$amount_tendered' ";
			$data .= ", amount_change = '$change' ";
			if ($save_presciption) {
				$data .= ", prescription = '$prescription_id' ";
			}
			$data .= ", creator = '$creator' ";
			date_default_timezone_set("Africa/Nairobi");
			$number = date('Ymd', strtotime(date("y-m-d H:i:sa"))) . "-" . $ref_no;
			$data .= ", ref_no = '$ref_no' ";

			$data .= ", sales_invoice_number = '$number' ";
			$save = $this->db->query("INSERT INTO sales_list set " . $data);
			$id = $this->db->insert_id;
			if ($amount_discounted > 0) {
				date_default_timezone_set("Africa/Nairobi");
				$date = date("y-m-d H:i:sa");
				$discount = " discount_on_sales_id = '' ";
				$discount .= ", sales_invoice_number = '$number'";
				$discount .= ", total_amount = '$tamount' ";
				$discount .= ", discount_amount = '$amount_discounted' ";
				$discount .= ", payable_amount = '$amount_tendered' ";
				$discount .= ", creator = '$creator' ";
				$discount .= ", date_created = '$date' ";
				$save_discount = $this->db->query("INSERT INTO discount_on_sales set " . $discount);
			}
			function check_item_available_quantity($product_id)
			{
				include 'db_connect.php';
				$inn = mysqli_query($conn, "SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = " . $product_id);
				$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
				$out = mysqli_query($conn, "SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = " . $product_id);
				$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
				$ex = mysqli_query($conn, "SELECT sum(qty) as ex FROM expired_product where product_id = " . $product_id);
				$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
				$available = $inn - $out - $ex;

				return $available;
			}
			foreach ($product_id as $k => $v) :
				$creator = $_SESSION['login_id'];
				date_default_timezone_set("Africa/Nairobi");
				$date = date("y-m-d H:i:sa");
				$available = check_item_available_quantity($product_id[$k]);
				$data = " product_on_hand_id = '' ";
				$data .= ", product_id = '$product_id[$k]' ";
				$data .= ", item_units_id = '$units[$k]' ";
				$data .= ", qty_before = '$available' ";

				$qty_after = $available - $qty[$k];
				$data .= ", qty_after = '$qty_after' ";
				$data .= ", qty_consumed = '$qty[$k]' ";
				$data .= ", sales_list_id = '$id' ";
				// $amount1=$price[$k]*$qty[$k];
				// $creator=$_SESSION['login_id'];
				$data .= ", creator = '$creator'";
				$data .= ", transaction_type  = '$type'";
				// $data .=", creator = '$creator' ";
				$data .= ", date_created = '$date' ";

				$save1[] = $this->db->query("INSERT INTO product_on_hand set " . $data);
			endforeach;
			function check_item_available_quantity_by_batch_for_sale($product_id, $batch_no)
			{
				include 'db_connect.php';
				$inn = mysqli_query($conn, "SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = '" . $product_id . "' and batch_no = '" . $batch_no . "'");
				$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
				$out = mysqli_query($conn, "SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = '" . $product_id . "' and batch_no = '" . $batch_no . "'");
				$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
				$ex = mysqli_query($conn, "SELECT sum(qty) as ex FROM expired_product where product_id = '" . $product_id . "' and batch_no = '" . $batch_no . "'");
				$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
				$available_by_batch = $inn - $out - $ex;

				return $available_by_batch;
			}
			function check_the_batch_for_product($product_id)
			{
				include 'db_connect.php';
				$batchNo = mysqli_query($conn, "SELECT batch_no as batch_no from product_by_batch where batch_preference=1 and product_id =" . $product_id);
				$batchNo = $batchNo && $batchNo->num_rows > 0 ? $batchNo->fetch_array()['batch_no'] : '';
				return $batchNo;
			}
			function product_sales_by_batch_algorism($product_id, $qty, $id, $creator)
			{
				include 'db_connect.php';
				$type = 2;
				$batchNo = check_the_batch_for_product($product_id);
				$available_by_batch_on_sales = check_item_available_quantity_by_batch_for_sale($product_id, $batchNo);
				if ($available_by_batch_on_sales > $qty) :
					$data1 = " product_on_hand_by_batch_id = '' ";
					$data1 .= ", product_id = '$product_id' ";
					$data1 .= ", batch_no = '$batchNo' ";
					$data1 .= ", qty_before = '$available_by_batch_on_sales' ";
					$remained = $available_by_batch_on_sales - $qty;
					$qty_after_by_batch = $remained;
					$data1 .= ", qty_consumed = '$available_by_batch_on_sales' ";
					$data1 .= ", qty_after = '$qty_after_by_batch' ";
					$data1 .= ", sales_list_id = '$id' ";
					date_default_timezone_set("Africa/Nairobi");
					$date = date("y-m-d H:i:sa");
					$data1 .= ", transaction_type = '$type' ";
					$data1 .= ", creator = '$creator' ";
					$data1 .= ", date_created = '$date' ";
					$save4[] = mysqli_query($conn, "INSERT INTO product_on_hand_by_batch SET" . $data1);
					if ($save4) :
						$success = 1;
						return $success;
						exit();
					endif;
				else :
					$data1 = " product_on_hand_by_batch_id = '' ";
					$data1 .= ", product_id = '$product_id' ";
					$data1 .= ", batch_no = '$batchNo' ";
					$data1 .= ", qty_before = '$available_by_batch_on_sales' ";
					$remained = $qty - $available_by_batch_on_sales;
					$qty_after_by_batch = 0;
					$qty = $remained;
					$data1 .= ", qty_consumed = '$available_by_batch_on_sales' ";
					$data1 .= ", qty_after = '$qty_after_by_batch' ";
					$data1 .= ", sales_list_id = '$id' ";
					date_default_timezone_set("Africa/Nairobi");
					$date = date("y-m-d H:i:sa");
					$data1 .= ", transaction_type = '$type' ";
					$data1 .= ", creator = '$creator' ";
					$data1 .= ", date_created = '$date' ";
					$save4[] = mysqli_query($conn, "INSERT INTO product_on_hand_by_batch SET" . $data1);
					if ($save4) :
						product_sales_by_batch_algorism($product_id, $qty, $id, $type, $creator);
					endif;
				endif;
			}

			foreach ($product_id as $k => $v) :
				$batchNo = check_the_batch_for_product($product_id[$k]);
				$available_by_batch_on_sales = check_item_available_quantity_by_batch_for_sale($product_id[$k], $batchNo);
				$ppid = $qty[$k];
				if ($qty[$k] <= $available_by_batch_on_sales) :
					$data = " product_on_hand_by_batch_id = '' ";
					$data .= ", product_id = '$product_id[$k]' ";
					$data .= ", batch_no = '$batchNo' ";
					$data .= ", qty_before = '$available_by_batch_on_sales' ";
					$consumed = $qty[$k];
					$qty_after_by_batch = $available_by_batch_on_sales - $qty[$k];
					$data .= ", qty_after = '$qty_after_by_batch' ";
					$data .= ", qty_consumed = '$consumed' ";
					$data .= ", sales_list_id = '$id' ";
					date_default_timezone_set("Africa/Nairobi");
					$date = date("y-m-d H:i:sa");
					$data .= ", transaction_type = '$type' ";
					$data .= ", creator = '$creator' ";
					$data .= ", date_created = '$date' ";
					$save41[] = $this->db->query("INSERT INTO product_on_hand_by_batch SET" . $data);
					$product_on_hand_by_batch_id = $this->db->insert_id;
				else :
					$mm = product_sales_by_batch_algorism($product_id[$k], $qty[$k], $id, $creator);
				endif;

			endforeach;

			foreach ($product_id as $k => $v) {
				$batchNo = check_the_batch_for_product($product_id[$k]);
				$data = " form_id = '$id' ";
				$data .= ", product_id = '$product_id[$k]' ";
				$data .= ", item_units_id = '$units[$k]' ";
				$data .= ", batch_no = '$batchNo' ";
				$data .= ", qty = '$qty[$k]' ";
				$data .= ", price = '$price[$k]' ";
				$data .= ", type = '2' ";
				$data .= ", stock_from = 'Sales' ";
				$details = json_encode(array('price' => $price[$k], 'qty' => $qty[$k]));
				$data .= ", other_details = '$details' ";
				$data .= ", remarks = 'Stock out from Sales-" . $ref_no . "' ";

				$save2[] = $this->db->query("INSERT INTO inventory set " . $data);
			}
			if (isset($save2)) {
				foreach ($product_id as $k => $v) :
					$creator = $_SESSION['login_id'];
					date_default_timezone_set("Africa/Nairobi");
					$date = date("y-m-d H:i:sa");
					$data = "product_on_sales_list_id = ''";
					$data .= ", product_id = '$product_id[$k]' ";
					$data .= ", qty = '$qty[$k]' ";
					$data .= ", rate_price = '$price[$k]' ";
					$amount1 = $price[$k] * $qty[$k];
					$data .= ", total_amount = '$amount1'";
					$data .= ", sales_invoice_number = '$number'";
					$data .= ", creator = '$creator' ";
					$data .= ", date_created = '$date' ";

					$save3[] = $this->db->query("INSERT INTO product_on_sales_lists set " . $data);
				endforeach;
				if ($save2) {
					if ($save3) {
						return $id;
					}
				}
			}
		} else {
			$save = $this->db->query("UPDATE sales_list set " . $data . " where id=" . $id);
			$ids = implode(",", $inv_id);
			$this->db->query("DELETE FROM inventory where type = 1 and form_id ='$id' and id NOT IN (" . $ids . ") ");
			foreach ($product_id as $k => $v) {
				$data = " form_id = '$id' ";
				$data .= ", product_id = '$product_id[$k]' ";
				$data .= ", item_units_id = '$units[$k]' ";
				$data .= ", qty = '$qty[$k]' ";
				$data .= ", type = '2' ";
				$data .= ", stock_from = 'Sales' ";
				$details = json_encode(array('price' => $price[$k], 'qty' => $qty[$k]));
				$data .= ", other_details = '$details' ";
				$data .= ", remarks = 'Stock out from Sales-" . $ref_no . "' ";

				if (!empty($inv_id[$k])) {
					$save2[] = $this->db->query("UPDATE inventory set " . $data . " where id=" . $inv_id[$k]);
				} else {
					$save2[] = $this->db->query("INSERT INTO inventory set " . $data);
				}
			}
			if (isset($save2)) {
				return $id;
			} else {
				return mysqli_error($this->db);
			}
		}
	}
	function delete_sales()
	{
		extract($_POST);
		$del1 = $this->db->query("DELETE FROM sales_list where id = $id ");
		$del2 = $this->db->query("DELETE FROM inventory where type = 2 and form_id = $id ");
		if ($del1 && $del2)
			return 1;
	}
	function save_invoice()
	{
		extract($_POST);
		$data = " profroma_invoice_to = '$customer_name' ";
		$data .= ", total_amount = '$tamount' ";
		$data .= ", amount_tendered = '$amount_tendered' ";
		$data .= ", amount_change = '$change' ";

		if (empty($id)) {
			$ref_no = sprintf("%'.08d\n", $ref_no);
			$i = 1;

			while ($i == 1) {
				$chk = $this->db->query("SELECT * FROM profroma_invoice where invoice_number ='$ref_no'")->num_rows;
				if ($chk > 0) {
					$ref_no = mt_rand(1, 99999999);
					$ref_no = sprintf("%'.08d\n", $ref_no);
				} else {
					$i = 0;
				}
			}

			$data .= ", invoice_number = '$ref_no' ";
			$profoma_invoice_name = $customer_name . "-" . $ref_no;
			$creator = $_SESSION['login_id'];
			date_default_timezone_set("Africa/Nairobi");
			$date = date("y-m-d H:i:sa");
			// $datecreated= new DateTime('now');
			// $data .= ", creator = '$creator' ";
			// $data .= ", date_created = '$date' ";

			$sql_insert_profroma_invoice = "INSERT INTO `profroma_invoice`( `profroma_invoice_name`, `profroma_invoice_to`, `invoice_number`, `creator`, `date_created`) VALUES ('" . $profoma_invoice_name . "','" . $customer_name . "','" . $ref_no . "','" . $creator . "','" . $date . "')";
			// "INSERT INTO `profroma_invoice`(`profroma_invoice_id`, `profroma_invoice_name`, `profroma_invoice_to`, `invoice_number`, `creator`, `date_created`) VALUES ('','".$profoma_invoice_name."','".$customer_name."','".$ref_no."','".$creator."','".$date."')";
			// $save = $this->db->query("INSERT INTO sales_list set ".$data);
			$save21 = $this->db->query($sql_insert_profroma_invoice);

			foreach ($product_id as $k => $v) {
				$data = " form_id = '$id' ";
				$data .= ", product_id = '$product_id[$k]' ";
				$data .= ", qty = '$qty[$k]' ";
				$data .= ", type = '2' ";
				$data .= ", stock_from = 'Sales' ";
				$details = json_encode(array('price' => $price[$k], 'qty' => $qty[$k]));
				$data .= ", other_details = '$details' ";
				$data .= ", remarks = 'Stock out from Sales-" . $ref_no . "' ";
				$amount[$k] = $price[$k] * $qty[$k];
				$sql_insert_wholesale_invoice = "INSERT INTO `wholesale_invoices`(`wholesale_invoive_id`, `invoice_number`,`product_id`,`rate_price`, `item_quantity`, `total_amount`, `creator`, `date_created`) VALUES ('','" . $ref_no . "','" . $product_id[$k] . "','" . $price[$k] . "','" . $qty[$k] . "','" . $amount[$k] . "','" . $creator . "','" . $date . "')";
				// $save2[]= $this->db->query("INSERT INTO inventory set ".$data);
				$save2[] = $this->db->query($sql_insert_wholesale_invoice);
				// $id =$this->db->insert_id;
			}
			if (isset($save2)) {
				return $ref_no;
			}
		} else {
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
	function delete_invoice()
	{
		extract($_POST);
		$del1 = $this->db->query("DELETE FROM sales_list where id = $id ");
		$del2 = $this->db->query("DELETE FROM inventory where type = 2 and form_id = $id ");
		if ($del1 && $del2)
			return 1;
	}

	function save_reconciliation()
	{
		extract($_POST);
		// $data="";
		if (true) :
			function check_item_available_quantity_by_batch($product_id, $batch_no)
			{
				include 'db_connect.php';
				$inn = mysqli_query($conn, "SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = '" . $product_id . "' and batch_no = '" . $batch_no . "'");
				$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
				$out = mysqli_query($conn, "SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = '" . $product_id . "' and batch_no = '" . $batch_no . "'");
				$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
				$ex = mysqli_query($conn, "SELECT sum(qty) as ex FROM expired_product where product_id = '" . $product_id . "' and batch_no = '" . $batch_no . "'");
				$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
				$available_by_batch = $inn - $out - $ex;

				return $available_by_batch;
			}
			function check_item_available_quantity($product_id)
			{
				include 'db_connect.php';
				$inn = mysqli_query($conn, "SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = " . $product_id);
				$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
				$out = mysqli_query($conn, "SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = " . $product_id);
				$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
				$ex = mysqli_query($conn, "SELECT sum(qty) as ex FROM expired_product where product_id = " . $product_id);
				$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
				$available = $inn - $out - $ex;

				return $available;
			}
			$creator = $_SESSION['login_id'];
			date_default_timezone_set("Africa/Nairobi");
			$date = date("y-m-d H:i:sa");
			// check_item_available_quantity_by_batch(1,33);
			foreach ($batch_no as $k => $v) :
				$available[] = check_item_available_quantity($product_id);
				$on_batch_available[] = check_item_available_quantity_by_batch($product_id, $batch_no[$k]);
				// $data =" reconciliation_id = '' ";
				$reconciliation = " product_id = '$product_id' ";
				$reconciliation .= ", item_units_id = '$item_units_id[$k]' ";
				$reconciliation .= ", batch_no = '$batch_no[$k]' ";
				$reconciliation .= ", system_count = '$scount[$k]' ";
				$reconciliation .= ", physical_count = '$pcount[$k]' ";
				if ($pcount[$k] > $scount[$k]) {
					$reconciliation_type_id = 1;
					$reconciled_qty = $pcount[$k] - $scount[$k];
				}
				if ($pcount[$k] < $scount[$k]) {
					$reconciliation_type_id = 2;
					$reconciled_qty = $scount[$k] - $pcount[$k];
				}
				if ($pcount[$k] == $scount[$k]) {
					$reconciliation_type_id = 3;
					$reconciled_qty = $pcount[$k];
				}
				$reconciliation .= ", reconciled_qty = '$reconciled_qty' ";
				$reconciliation .= ", reconciliation_type_id = '$reconciliation_type_id' ";
				$reconciliation .= ", creator = '$creator' ";
				$reconciliation .= ", date_created = '$date' ";
				$save_reconciliation = $this->db->query("INSERT INTO reconciliation set" . $reconciliation);
				$reconciliation_id[] = $this->db->insert_id;
			endforeach;
			foreach ($batch_no as $k => $v) :
				if ($pcount[$k] > $scount[$k]) {
					$type = 1;
					$reconciled_qty = $pcount[$k] - $scount[$k];
				} elseif ($pcount[$k] == $scount[$k]) {
					$type = 3;
					$reconciled_qty = $pcount[$k];
				} else {
					$type = 2;
					$reconciled_qty = $scount[$k] - $pcount[$k];
				}
				$data = " form_id = '$reconciliation_id[$k]' ";
				$data .= ", product_id = '$product_id' ";
				$data .= ", item_units_id = '$item_units_id[$k]' ";
				$data .= ", batch_no = '$batch_no[$k]' ";
				$data .= ", qty = '$reconciled_qty' ";
				$data .= ", price = '' ";
				$data .= ", expiry_date = '' ";
				$data .= ", type = '$type' ";
				$data .= ", stock_from = 'reconciliation' ";
				$details = json_encode(array('price' => '', 'qty' => $reconciled_qty));
				$data .= ", other_details = '$details' ";
				$data .= ", remarks = 'Stock from Reconciliation' ";
				$save_inventory = $this->db->query("INSERT INTO inventory SET" . $data);
				$inventory_id[] = $this->db->insert_id;
			endforeach;
			foreach ($batch_no as $k => $v) :
				$on_hand_by_batch = " product_on_hand_by_batch_id = '' ";
				$on_hand_by_batch .= ", product_id = '$product_id' ";
				$on_hand_by_batch .= ", batch_no = '$batch_no[$k]' ";
				$on_hand_by_batch .= ", qty_before = '$on_batch_available[$k]' ";
				if ($pcount[$k] > $scount[$k]) {
					$type = 1;
					$reconciled_qty = $pcount[$k] - $scount[$k];
					$after_batch = $on_batch_available[$k] + $reconciled_qty;
				} elseif ($pcount[$k] == $scount[$k]) {
					$type = 3;
					$reconciled_qty = $pcount[$k];
					$after_batch = $reconciled_qty;
				} else {
					$type = 2;
					$reconciled_qty = $scount[$k] - $pcount[$k];
					$after_batch = $on_batch_available[$k] - $reconciled_qty;
				}
				$on_hand_by_batch .= ", qty_consumed = '$reconciled_qty' ";
				$on_hand_by_batch .= ", qty_after = '$after_batch' ";
				$on_hand_by_batch .= ", inventory_id = '$inventory_id[$k]' ";
				$on_hand_by_batch .= ", transaction_type = '5' ";
				$on_hand_by_batch .= ", creator = '$creator' ";
				$on_hand_by_batch .= ", date_created = '$date' ";
				$save_on_hand_by_batch = $this->db->query("INSERT INTO product_on_hand_by_batch SET" . $on_hand_by_batch);
			endforeach;
			foreach ($batch_no as $k => $v) :
				$data = " product_id = '$product_id' ";
				$data .= ", item_units_id = '$item_units_id[$k]' ";
				if ($pcount[$k] > $scount[$k]) {
					$type = 5;
					$reconciled_qty = $pcount[$k] - $scount[$k];
					$qty_after = $available[$k] + $reconciled_qty;
				}
				if ($pcount[$k] < $scount[$k]) {
					$type = 5;
					$reconciled_qty = $scount[$k] - $pcount[$k];

					$qty_after = $available[$k] - $reconciled_qty;
				}
				if ($pcount[$k] == $scount[$k]) {
					$type = 5;
					$reconciled_qty = $pcount[$k];

					$qty_after = $reconciled_qty;
				}
				$data .= ", qty_before = '$available[$k]' ";
				$data .= ", qty_after = '$qty_after' ";
				$data .= ", qty_consumed = '$reconciled_qty' ";
				$data .= ", inventory_id = '$inventory_id[$k]' ";
				$data .= ", creator = '$creator'";
				$data .= ", transaction_type  = '$type' ";
				$data .= ", date_created = '$date' ";
				$save_on_hand = $this->db->query("INSERT INTO product_on_hand set " . $data);
			endforeach;
			if ($save_inventory) :
				if ($save_on_hand) :
					if ($save_on_hand_by_batch) :
						if ($save_reconciliation) :
							$data_response = 1;
							return $data_response;
						else :
							$data_response = mysqli_error($this->db);
							return $data_response;
						endif;
					endif;
				endif;
			endif;
		endif;
	}
	function datesalesreport()
	{
		extract($_POST);
		extract($_GET);
		// $todate=$_POST["todate"];
		// $fromdate=$_POST["fromdate"];
		// $first_date=$_POST["startdate"];
		$fromdate = date('Y-m-d H:i:s', strtotime($fromdate));
		// $todate=$_POST["enddate"];
		$todate = date('Y-m-d H:i:s', strtotime($todate));
		// $todate=date('Y-m-d H:i:s',strtotime('+23 hour +59 minutes +59 seconds',strtotime($todate)));
		$mode;

		if ($mode == 1) {
			// $q1="(SELECT '' AS flow_time,pss.product_name AS 'Category',
			// SUM(COALESCE(CASE WHEN pss.product_sales_product_id THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
			// SUM(COALESCE(CASE WHEN pss.product_sales_product_id THEN pss.product_total_amount ELSE 0 END, 0)) AS 'Amount',
			// SUM(COALESCE(CASE WHEN pss.product_sales_product_id THEN pss.product_total_profit ELSE 0 END, 0)) AS 'Profit'
			// FROM pharmacy_stock_sales pss WHERE pss.product_sales_date_created<='".$todate."' AND  pss.product_sales_date_created>='".$fromdate."' 
			// GROUP BY pss.product_sales_product_id ORDER BY pss.product_name ASC) 
			// UNION ALL
			// (SELECT '' AS flow_time,'Total' AS 'Category',
			// SUM(COALESCE(CASE WHEN pss.product_sales_product_id THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
			// SUM(COALESCE(CASE WHEN pss.product_sales_product_id THEN pss.product_total_amount ELSE 0 END, 0)) AS 'Amount',
			// SUM(COALESCE(CASE WHEN pss.product_sales_product_id THEN pss.product_total_profit ELSE 0 END, 0)) AS 'Profit'
			// FROM pharmacy_stock_sales pss WHERE pss.product_sales_date_created<='".$todate."' AND  pss.product_sales_date_created>='".$fromdate."')";
			$q1 = "(SELECT '' AS flow_time,pss.product_name AS 'Category',
							SUM(COALESCE(CASE WHEN pss.product_sales_product_id THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
							SUM(COALESCE(CASE WHEN pss.payment_scheme_id=1 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'CASH',
							SUM(COALESCE(CASE WHEN pss.payment_scheme_id=2 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'INSURANCE',
							SUM(COALESCE(CASE WHEN pss.product_sales_product_id THEN pss.product_rate_price ELSE 0 END, 0)) AS 'Profit'
							FROM (SELECT pss1.*,ps.payment_scheme_id,ps.payment_scheme_name FROM pharmacy_stock_sales pss1
								left outer join sales_list sl on pss1.product_sales_invoice_number=sl.sales_invoice_number
								left outer join payment_scheme ps on sl.payment_scheme_id = ps.payment_scheme_id) pss
			WHERE pss.product_sales_date_created<='" . $todate . "' AND  pss.product_sales_date_created>='" . $fromdate . "' 
			GROUP BY pss.product_sales_product_id ) 
			UNION ALL
			(SELECT '' AS flow_time,'Total' AS 'Category',
			SUM(COALESCE(CASE WHEN pss.product_sales_product_id THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
							SUM(COALESCE(CASE WHEN pss.payment_scheme_id=1 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'CASH',
							SUM(COALESCE(CASE WHEN pss.payment_scheme_id=2 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'INSURANCE',
							SUM(COALESCE(CASE WHEN pss.product_sales_product_id THEN pss.product_rate_price ELSE 0 END, 0)) AS 'Profit'
							FROM (SELECT pss1.*,ps.payment_scheme_id,ps.payment_scheme_name FROM pharmacy_stock_sales pss1
								left outer join sales_list sl on pss1.product_sales_invoice_number=sl.sales_invoice_number
								left outer join payment_scheme ps on sl.payment_scheme_id = ps.payment_scheme_id) pss 
			WHERE pss.product_sales_date_created<='" . $todate . "' AND  pss.product_sales_date_created>='" . $fromdate . "')";
		} else if ($mode == 3) {
			// $creator=$this->db->query("SELECT DISTINCT sl.creator as creator FROM users u INNER JOIN sales_list sl ON sl.creator=u.id")->fetch_assoc();
			// $q1='';
			// while ($bill_creator = $creator) {
			$q1 = "(SELECT concat('From',' ',min(pss.product_sales_date_created) ,' ','to',' ',max(pss.product_sales_date_created)) AS 'flow_time',pss.product_sales_creator AS 'Category',
							SUM(COALESCE(CASE WHEN pss.product_sales_creator_id  THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
							SUM(COALESCE(CASE WHEN pss.payment_scheme_id=1 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'CASH',
							SUM(COALESCE(CASE WHEN pss.payment_scheme_id=2 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'INSURANCE'
					FROM (SELECT pss1.*,ps.payment_scheme_id,ps.payment_scheme_name FROM pharmacy_stock_sales pss1
							left outer join sales_list sl on pss1.product_sales_invoice_number=sl.sales_invoice_number
							left outer join payment_scheme ps on sl.payment_scheme_id = ps.payment_scheme_id) pss  
					WHERE pss.product_sales_date_created <='" . $todate . "' AND  pss.product_sales_date_created >='" . $fromdate . "' 
					GROUP BY pss.product_sales_creator_id ORDER BY pss.product_sales_creator_id ASC)
					UNION ALL
					(SELECT '' AS 'flow_time','Total' AS 'Category',
							SUM(COALESCE(CASE WHEN pss.product_sales_creator_id THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
							SUM(COALESCE(CASE WHEN pss.payment_scheme_id=1 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'CASH',
							SUM(COALESCE(CASE WHEN pss.payment_scheme_id=2 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'INSURANCE'
					FROM (SELECT pss1.*,ps.payment_scheme_id,ps.payment_scheme_name FROM pharmacy_stock_sales pss1
							left outer join sales_list sl on pss1.product_sales_invoice_number=sl.sales_invoice_number
							left outer join payment_scheme ps on sl.payment_scheme_id = ps.payment_scheme_id) pss  
					WHERE pss.product_sales_date_created<='" . $todate . "' AND  pss.product_sales_date_created>='" . $fromdate . "')";
			// }
		} else {
			// $q1="SELECT '' AS flow_time,pss.item_category_name as 'Category',
			// SUM(COALESCE(CASE WHEN pss.item_category_id =2 THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
			// SUM(COALESCE(CASE WHEN pss.item_category_id =2 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'Amount',
			// SUM(COALESCE(CASE WHEN pss.item_category_id =2 THEN pss.product_rate_profit*pss.product_qty ELSE 0 END, 0)) AS 'Profit'
			// FROM pharmacy_stock_sales pss WHERE pss.item_category_id=2 and pss.product_sales_date_created<='".$todate."' AND  pss.product_sales_date_created>='".$fromdate."' 
			// UNION  ALL
			// SELECT '' AS flow_time,pss.item_category_name as 'Category',
			// SUM(COALESCE(CASE WHEN pss.item_category_id =1 THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
			// SUM(COALESCE(CASE WHEN pss.item_category_id =1 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'Amount',
			// SUM(COALESCE(CASE WHEN pss.item_category_id =1 THEN pss.product_rate_profit*pss.product_qty ELSE 0 END, 0)) AS 'Profit'
			// FROM pharmacy_stock_sales pss WHERE pss.item_category_id=1 and pss.product_sales_date_created<='".$todate."' AND  pss.product_sales_date_created>='".$fromdate."' 
			// UNION ALL
			// SELECT '' AS flow_time,pss.item_category_name as 'Category',
			// SUM(COALESCE(CASE WHEN pss.item_category_id =3 THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
			// SUM(COALESCE(CASE WHEN pss.item_category_id =3 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'Amount',
			// SUM(COALESCE(CASE WHEN pss.item_category_id =3 THEN pss.product_rate_profit*pss.product_qty ELSE 0 END, 0)) AS 'Profit'
			// FROM pharmacy_stock_sales pss WHERE pss.item_category_id=3 and pss.product_sales_date_created<='".$todate."' AND  pss.product_sales_date_created>='".$fromdate."'
			// UNION ALL
			// SELECT '' AS flow_time,pss.item_category_name as 'Category',
			// SUM(COALESCE(CASE WHEN pss.item_category_id =8 THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
			// SUM(COALESCE(CASE WHEN pss.item_category_id =8 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'Amount',
			// SUM(COALESCE(CASE WHEN pss.item_category_id =8 THEN pss.product_rate_profit*pss.product_qty ELSE 0 END, 0)) AS 'Profit'
			// FROM pharmacy_stock_sales pss WHERE pss.item_category_id=8 and pss.product_sales_date_created<='".$todate."' AND  pss.product_sales_date_created>='".$fromdate."'  
			// UNION ALL
			// SELECT '' AS flow_time,pss.item_category_name as 'Category',
			// SUM(COALESCE(CASE WHEN pss.item_category_id =9 THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
			// SUM(COALESCE(CASE WHEN pss.item_category_id =9 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'Amount',
			// SUM(COALESCE(CASE WHEN pss.item_category_id =9 THEN pss.product_rate_profit*pss.product_qty ELSE 0 END, 0)) AS 'Profit'
			// FROM pharmacy_stock_sales pss WHERE pss.item_category_id=9 and pss.product_sales_date_created<='".$todate."' AND  pss.product_sales_date_created>='".$fromdate."'
			// UNION ALL
			// SELECT '' AS flow_time,pss.item_category_name as 'Category',
			// SUM(COALESCE(CASE WHEN pss.item_category_id =11 THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
			// SUM(COALESCE(CASE WHEN pss.item_category_id =11 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'Amount',
			// SUM(COALESCE(CASE WHEN pss.item_category_id =11 THEN pss.product_rate_profit*pss.product_qty ELSE 0 END, 0)) AS 'Profit'
			// FROM pharmacy_stock_sales pss WHERE pss.item_category_id=11 and pss.product_sales_date_created<='".$todate."' AND  pss.product_sales_date_created>='".$fromdate."'  
			// UNION ALL
			// SELECT '' AS flow_time,'Total'  as 'Category',
			// SUM(COALESCE(CASE WHEN pss.item_category_id  THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
			// SUM(COALESCE(CASE WHEN pss.item_category_id  THEN pss.product_total_amount ELSE 0 END, 0)) AS 'Amount',
			// SUM(COALESCE(CASE WHEN pss.item_category_id THEN pss.product_rate_profit*pss.product_qty ELSE 0 END, 0)) AS 'Profit'
			// FROM pharmacy_stock_sales pss WHERE pss.product_sales_date_created<='".$todate."' AND  pss.product_sales_date_created>='".$fromdate."' ";
			$q1 = "SELECT '' AS flow_time,pss.item_category_name as 'Category',
			SUM(COALESCE(CASE WHEN pss.item_category_id =2 THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
			SUM(COALESCE(CASE WHEN pss.payment_scheme_id=1 and pss.item_category_id =2 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'CASH',
		    SUM(COALESCE(CASE WHEN pss.payment_scheme_id=2 and pss.item_category_id =2 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'INSURANCE'
			FROM (SELECT pss1.*,ps.payment_scheme_id,ps.payment_scheme_name FROM pharmacy_stock_sales pss1
							left outer join sales_list sl on pss1.product_sales_invoice_number=sl.sales_invoice_number
							left outer join payment_scheme ps on sl.payment_scheme_id = ps.payment_scheme_id) pss 
			WHERE pss.item_category_id=2 and pss.product_sales_date_created<='" . $todate . "' AND  pss.product_sales_date_created>='" . $fromdate . "' 
			UNION  ALL
			SELECT '' AS flow_time,pss.item_category_name as 'Category',
			SUM(COALESCE(CASE WHEN pss.item_category_id =1 THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
			SUM(COALESCE(CASE WHEN pss.payment_scheme_id=1 and pss.item_category_id =1 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'CASH',
		    SUM(COALESCE(CASE WHEN pss.payment_scheme_id=2 and pss.item_category_id =1 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'INSURANCE'
			FROM (SELECT pss1.*,ps.payment_scheme_id,ps.payment_scheme_name FROM pharmacy_stock_sales pss1
							left outer join sales_list sl on pss1.product_sales_invoice_number=sl.sales_invoice_number
							left outer join payment_scheme ps on sl.payment_scheme_id = ps.payment_scheme_id) pss 
			WHERE pss.item_category_id=1 and pss.product_sales_date_created<='" . $todate . "' AND  pss.product_sales_date_created>='" . $fromdate . "' 
			UNION ALL
			SELECT '' AS flow_time,pss.item_category_name as 'Category',
			SUM(COALESCE(CASE WHEN pss.item_category_id =3 THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
			SUM(COALESCE(CASE WHEN pss.payment_scheme_id=1 and pss.item_category_id =3 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'CASH',
		    SUM(COALESCE(CASE WHEN pss.payment_scheme_id=2 and pss.item_category_id =3 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'INSURANCE'
			FROM (SELECT pss1.*,ps.payment_scheme_id,ps.payment_scheme_name FROM pharmacy_stock_sales pss1
							left outer join sales_list sl on pss1.product_sales_invoice_number=sl.sales_invoice_number
							left outer join payment_scheme ps on sl.payment_scheme_id = ps.payment_scheme_id) pss  
			WHERE pss.item_category_id=3 and pss.product_sales_date_created<='" . $todate . "' AND  pss.product_sales_date_created>='" . $fromdate . "'
			UNION ALL
			SELECT '' AS flow_time,pss.item_category_name as 'Category',
			SUM(COALESCE(CASE WHEN pss.item_category_id =8 THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
			SUM(COALESCE(CASE WHEN pss.payment_scheme_id=1 and pss.item_category_id =8 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'CASH',
		    SUM(COALESCE(CASE WHEN pss.payment_scheme_id=2 and pss.item_category_id =8 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'INSURANCE'
			FROM (SELECT pss1.*,ps.payment_scheme_id,ps.payment_scheme_name FROM pharmacy_stock_sales pss1
							left outer join sales_list sl on pss1.product_sales_invoice_number=sl.sales_invoice_number
							left outer join payment_scheme ps on sl.payment_scheme_id = ps.payment_scheme_id) pss  
			WHERE pss.item_category_id=8 and pss.product_sales_date_created<='" . $todate . "' AND  pss.product_sales_date_created>='" . $fromdate . "'  
			UNION ALL
			SELECT '' AS flow_time,pss.item_category_name as 'Category',
			SUM(COALESCE(CASE WHEN pss.item_category_id =9 THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
			SUM(COALESCE(CASE WHEN pss.payment_scheme_id=1 and pss.item_category_id =9 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'CASH',
		    SUM(COALESCE(CASE WHEN pss.payment_scheme_id=2 and pss.item_category_id =9 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'INSURANCE'
			FROM (SELECT pss1.*,ps.payment_scheme_id,ps.payment_scheme_name FROM pharmacy_stock_sales pss1
							left outer join sales_list sl on pss1.product_sales_invoice_number=sl.sales_invoice_number
							left outer join payment_scheme ps on sl.payment_scheme_id = ps.payment_scheme_id) pss  
			WHERE pss.item_category_id=9 and pss.product_sales_date_created<='" . $todate . "' AND  pss.product_sales_date_created>='" . $fromdate . "'
			UNION ALL
			SELECT '' AS flow_time,pss.item_category_name as 'Category',
			SUM(COALESCE(CASE WHEN pss.item_category_id =11 THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
			SUM(COALESCE(CASE WHEN pss.payment_scheme_id=1 and pss.item_category_id =11 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'CASH',
		    SUM(COALESCE(CASE WHEN pss.payment_scheme_id=2 and pss.item_category_id =11 THEN pss.product_total_amount ELSE 0 END, 0)) AS 'INSURANCE'
			FROM (SELECT pss1.*,ps.payment_scheme_id,ps.payment_scheme_name FROM pharmacy_stock_sales pss1
							left outer join sales_list sl on pss1.product_sales_invoice_number=sl.sales_invoice_number
							left outer join payment_scheme ps on sl.payment_scheme_id = ps.payment_scheme_id) pss  
			WHERE pss.item_category_id=11 and pss.product_sales_date_created<='" . $todate . "' AND  pss.product_sales_date_created>='" . $fromdate . "'  
			UNION ALL
			SELECT '' AS flow_time,'Total'  as 'Category',
			SUM(COALESCE(CASE WHEN pss.item_category_id  THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
			SUM(COALESCE(CASE WHEN pss.payment_scheme_id=1 and pss.item_category_id THEN pss.product_total_amount ELSE 0 END, 0)) AS 'CASH',
		    SUM(COALESCE(CASE WHEN pss.payment_scheme_id=2 and pss.item_category_id THEN pss.product_total_amount ELSE 0 END, 0)) AS 'INSURANCE'
			FROM (SELECT pss1.*,ps.payment_scheme_id,ps.payment_scheme_name FROM pharmacy_stock_sales pss1
					left outer join sales_list sl on pss1.product_sales_invoice_number=sl.sales_invoice_number
					left outer join payment_scheme ps on sl.payment_scheme_id = ps.payment_scheme_id) pss  
			WHERE pss.product_sales_date_created<='" . $todate . "' AND  pss.product_sales_date_created>='" . $fromdate . "' ";
		}
		$salesprofit = $this->db->query($q1);
		if ($salesprofit) {
			while ($row = mysqli_fetch_assoc($salesprofit)) {
				$pr[] = array(
					"Category" => $row['Category'],
					"flow_time" => $row['flow_time'],
					"Total_quantity_sold" => $row['Total_quantity_sold'],
					"CASH" => $row['CASH'],
					"INSURANCE" => $row['INSURANCE']
					// "Profit"=>$row['Profit']
				);
			}
			$response = array("aaData" => $pr);
		}
		echo json_encode($response);
	}
	function report_presentation()
	{
		header('Content-Type: application/json');
		extract($_POST);
		extract($_GET);
		$reportType;
		$todate = date('Y-m-d H:i:s', strtotime('+23 hour +59 minutes +59 seconds', strtotime($todate)));
		// $sql_count_transaction="SELECT date(sl.date_updated) as date_created,COUNT(*) as Total_quantity_sold,'' as Amount,'' as Profit from sales_list sl GROUP BY date(sl.date_updated)";
		if ($reportType == 1) {
			$sql_new = "SELECT DATE_FORMAT(pss.product_sales_date_created, '%M %d %Y') as 'date_created',
					SUM(COALESCE(CASE WHEN pss.item_category_id THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
					SUM(COALESCE(CASE WHEN pss.item_category_id THEN pss.product_total_amount ELSE 0 END, 0)) AS 'Amount',
					SUM(COALESCE(CASE WHEN pss.item_category_id THEN pss.product_rate_profit*pss.product_qty ELSE 0 END, 0)) AS 'Profit'
					FROM pharmacy_stock_sales pss WHERE pss.item_category_id and pss.product_sales_date_created <= '" . $todate . "' AND  pss.product_sales_date_created >= '" . $fromdate . "' GROUP BY DATE_FORMAT(pss.product_sales_date_created, '%M %d %Y')";
		} else {
			$sql_new = "SELECT date(sl.date_updated) as date_created,COUNT(*) as Total_quantity_sold,'' as Amount,'' as Profit from sales_list sl GROUP BY date(sl.date_updated)";
		}
		$report1 = $this->db->query($sql_new);
		if ($report1) {
			while ($row = mysqli_fetch_assoc($report1)) {
				$data_report[] = array(
					"date_created" => $row['date_created'],
					"Total_quantity_sold" => $row['Total_quantity_sold'],
					"Amount" => $row['Amount'],
					"Profit" => $row['Profit'],
					"reportType" => $reportType
				);
			}
			$data_report1 = $data_report;
		}
		echo json_encode($data_report1);
	}
	function confirm_expired()
	{
		extract($_POST);
		$creator = $_SESSION['login_id'];
		date_default_timezone_set("Africa/Nairobi");
		$date = date("y-m-d H:i:sa");
		function check_item_available_quantity_confirm_expired($product_id)
		{
			include 'db_connect.php';
			$inn = mysqli_query($conn, "SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = " . $product_id);
			$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
			$out = mysqli_query($conn, "SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = " . $product_id);
			$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
			$ex = mysqli_query($conn, "SELECT sum(qty) as ex FROM expired_product where product_id = " . $product_id);
			$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
			$available = $inn - $out - $ex;

			return $available;
		}

		$previous_available = check_item_available_quantity_confirm_expired($product_id);
		$expired = " product_id = '$product_id' ";
		$expired .= ", item_units_id = '$item_units_id' ";
		$expired .= ", batch_no = '$batch_no' ";
		$expired .= ", qty = '$available' ";
		$expired .= ", creator = '$creator' ";
		$expired .= ", date_created = '$date' ";
		$save_expired_product = $this->db->query("INSERT INTO expired_product set " . $expired);
		$expired_id = $this->db->insert_id;
		if ($save_expired_product) :
			$data = " form_id = '$expired_id' ";
			$data .= ", product_id = '$product_id' ";
			$data .= ", item_units_id = '$item_units_id' ";
			$data .= ", batch_no = '$batch_no' ";
			$data .= ", qty = '$available' ";
			$data .= ", price = '' ";
			$data .= ", expiry_date = '$expire_date' ";
			$data .= ", type = '3' ";
			$data .= ", stock_from = 'expire' ";
			$data .= ", expired_confirmed = '1' ";
			$details = json_encode(array('batch_no' => $batch_no, 'qty' => $available));
			$data .= ", other_details = '$details' ";
			$data .= ", remarks = 'Stock from Expiring-" . $expired_id . "' ";
			$save_inventory = $this->db->query("INSERT INTO inventory set " . $data);
			$inventory_id = $this->db->insert_id;
			if ($save_inventory) :
				$product_by_batch = " expired_confirmed= '1' ";
				$product_by_batch .= ", qty_expired = '$available' ";
				$product_by_batch .= ", expired_confirmed_by = '$creator' ";
				$product_by_batch .= ", expired_confirmed_date = '$date' ";
				$product_by_batch .= ", batch_preference = '0'";
				$product_by_batch .= ", changed_by = '$creator' ";
				$product_by_batch .= ", date_changed = '$date' ";
				$save_product_by_batch = $this->db->query("UPDATE product_by_batch SET" . $product_by_batch . "WHERE product_id ='" . $product_id . "' AND batch_no = '" . $batch_no . "'");
				// $sqlll="UPDATE `product_by_batch` SET`batch_preference`='0',`expired_confirmed`='1',`qty_expired`='$available',
				// `expired_confirmed_by`='$creator',`expired_confirmed_date`='$date' WHERE `product_id`=$product_id AND `batch_no`=$batch_no";
				// $save_product_by_batch=$this->db->query("UPDATE `product_by_batch` SET '".$product_by_batch."' WHERE product_id ='".$product_id."' AND batch_no = '".$batch_no."'");
				// $save_product_by_batch=$this->db->query("UPDATE `product_by_batch` SET `batch_preference`='0',`expired_confirmed`='1',`qty_expired`='".$available."',
				// `expired_confirmed_by`='".$creator."',`expired_confirmed_date`='".$date."',`changed_by` = '".$creator."', `date_changed` = '".$date."' WHERE `product_id`='".$product_id."' AND `batch_no`='".$batch_no."'");
				$triggerphph1 = "UPDATE `product_by_batch` SET batch_preference=0 WHERE product_id='" . $product_id . "'AND transaction_type_id=1 AND expired_confirmed=0 AND os_confirmed=0";
				$save_triggerphph1 = $this->db->query($triggerphph1);
				$triggerphph = "UPDATE `product_by_batch` SET batch_preference=1 WHERE product_id='" . $product_id . "' AND expired_confirmed=0 AND os_confirmed=0 AND transaction_type_id=1 AND expiredate=(SELECT MIN(date(expiredate)) FROM product_by_batch WHERE product_id ='" . $product_id . "')";
				$save_triggerphph = $this->db->query($triggerphph);
				// if ($save_product_by_batch):
				$on_hand_by_batch = " product_on_hand_by_batch_id = '' ";
				$on_hand_by_batch .= ", product_id = '$product_id' ";
				$on_hand_by_batch .= ", batch_no = '$batch_no' ";
				$on_hand_by_batch .= ", qty_before = '$available' ";
				$on_hand_by_batch .= ", qty_consumed = '$available' ";
				$after_batch = $available - $available;
				$on_hand_by_batch .= ", qty_after = '$after_batch' ";
				// $on_hand_by_batch .=", inventory_id = '' ";
				$on_hand_by_batch .= ", transaction_type = '3' ";
				$on_hand_by_batch .= ", creator = '$creator' ";
				$save_product_on_hand_by_batch = $this->db->query("INSERT INTO product_on_hand_by_batch SET" . $on_hand_by_batch);
				if ($save_product_on_hand_by_batch) :
					$product_on_hand = " product_on_hand_id = '' ";
					$product_on_hand .= ", product_id = '$product_id' ";
					$product_on_hand .= ", item_units_id = '$item_units_id' ";
					$product_on_hand .= ", qty_before = '$previous_available' ";

					$qty_after = $previous_available - $available;
					$product_on_hand .= ", qty_after = '$qty_after' ";
					$product_on_hand .= ", qty_consumed = '$available' ";
					$product_on_hand .= ", inventory_id = '$inventory_id' ";

					$product_on_hand .= ", creator = '$creator' ";
					$product_on_hand .= ", transaction_type  = '3'";

					$product_on_hand .= ", date_created = '$date' ";

					$save_product_on_hand = $this->db->query("INSERT INTO product_on_hand set " . $product_on_hand);
					if ($save_product_on_hand) :
						$response_code = 1;
						$response_data[] = json_encode(array(
							"product_id" => $product_id,
							"item_units_id" => $item_units_id,
							"batch_no" => $batch_no,
							"available" => $available,
							"expire_date" => $expire_date
						));
					else :
						$response_code = 2;
						$response_data = json_encode(array("myaqlerror" => mysqli_error($this->db), "errorwhere" => $save_product_on_hand, "code" => 5));
					endif;
				else :
					$response_code = 2;
					$response_data = json_encode(array("myaqlerror" => mysqli_error($this->db), "errorwhere" => $save_product_on_hand_by_batch, "code" => 6));
				endif;
			// else:
			// 	$response_code=2;
			// 	$response_data=json_encode(array("myaqlerror"=>mysqli_error($this->db),"errorwhere"=>$save_product_by_batch,"code"=>7));
			// 	endif;
			else :
				$response_code = 2;
				$response_data = json_encode(array("myaqlerror" => mysqli_error($this->db), "errorwhere" => $save_inventory, "code" => 8));
			endif;
		else :
			$response_code = 2;
			$response_data = json_encode(array("myaqlerror" => mysqli_error($this->db), "errorwhere" => $save_expired_product, "code" => 9));
		endif;
		// $response_code=3;
		// $response_data=json_encode(array("myaqlerror"=>mysqli_error($this->db)));
		$response = array("response_code" => $response_code, "response_data" => $response_data);

		echo json_encode($response);
	}
	function save_expired()
	{
		extract($_POST);
		foreach ($product_id as $key => $value) {
			$data = " product_id = $product_id[$key] ";
			$data .= ", qty = $qty[$key] ";
			$data .= ", date_expired = '$expiry_date[$key]' ";
			$save[] = $this->db->query("INSERT INTO expired_product set $data ");
		}
		if (isset($save))
			return 1;
	}
	function delete_expired()
	{
		extract($_POST);
		$delete = $this->db->query("DELETE FROM expired_product where id = $id ");
		if ($delete)
			return 1;
	}
}
