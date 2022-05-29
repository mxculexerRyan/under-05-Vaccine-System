<?php 
include('db_connect.php');
$role_id=null;
if(isset($_GET['id'])){
$role = $conn->query("SELECT * FROM user_role where role_id =".$_GET['id']);
foreach($role->fetch_array() as $k =>$v){
	$meta[$k] = $v;
}
$role_id=$meta['role_id'];
// $sql_for_privilege="SELECT role_privileges_id FROM user_role_privieges urp 
// WHERE urp.user_role_id =".$meta['role_id'];
// $privilege_per_role=$conn->query($sql_for_privilege);
// while ($row=$privilege_per_role->fetch_assoc()) {
// 	$privilege_per_role_in_array1[]=$row;
// }
// foreach ($variable->fetch_array() as $key => $value) {
// 	$privilage[$key]=$value;
// }
// $this->CheckLoginInDb();
// $privilege_per_role_in_array=explode(",",$privilege_per_role_in_array1['role_privileges_id']);
}
function checkCheckedRole($role_id,$privilage){
	include('db_connect.php');
	$checked="";
	$sql_for_privilege="SELECT role_privileges_id FROM user_role_privieges urp 
	WHERE urp.user_role_id ={$role_id}";
	$allPrivilege=$conn->query($sql_for_privilege);
	if ($allPrivilege) {
		while ($row=$allPrivilege->fetch_assoc()) {
			$privilege_per_role_in_array=explode(",",$row['role_privileges_id']);
			if (in_array($privilage,$privilege_per_role_in_array)) {
				$checked="checked";
			}
	}
	}
	return $checked;
}
$all_privilage=$conn->query("SELECT * FROM role_privieges ORDER BY role_privieges_name asc");
?>
<div class="container-fluid">
	
	<form action="" id="manage-role">
		<input type="hidden" name="role_id" value="<?php echo isset($meta['role_id']) ? $meta['role_id']: '' ?>">
		<div class="form-group">
			<label for="RoleName">Role Name</label>
			<input type="text" name="RoleName" id="RoleName" class="form-control" value="<?php echo isset($meta['role_name']) ? $meta['role_name']: '' ?>" required>
		</div>
		<div class="form-group">
			<label for="Description">Description</label>
			<input type="text" name="Description" id="Description" class="form-control" value="<?php echo isset($meta['Description']) ? $meta['Description']: '' ?>">
		</div>
		<div class="form-group">
			<label for="type">Role Privilage</label>
            <div class="card">
				<?php
				while ($row=$all_privilage->fetch_array()):
				?>
				<div class="col-md-12 float-right" >
					<input type="checkbox" name="role_privilages[]" id="" value="<?=$row["role_privieges_id"]?>" <?php echo checkCheckedRole($role_id,$row["role_privieges_id"]);?>><?=$row["Description"]?> &nbsp
				</div>	
				<?php
				endwhile;
				?>
            </div>
		</div>
	</form>
</div>
<script>
	$('#manage-role').submit(function(e){
		e.preventDefault();
		start_load()
		$.ajax({
			url:'ajax.php?action=save_role',
			method:'POST',
			data:$(this).serialize(),
			success:function(resp){
				if(resp ==1){
					alert_toast("Data successfully saved",'success')
					setTimeout(function(){
						location.reload()
					},1500)
				}
				if(resp ==2){
					alert_toast("Data successfully Updated",'success')
					setTimeout(function(){
						location.reload()
					},1500)
				}
				
			}
		})
	})
</script>