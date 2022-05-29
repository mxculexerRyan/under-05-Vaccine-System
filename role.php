<?php 

?>

<div class="container-fluid">
	
	<div class="row">
	<div class="col-lg-12">
			<button class="btn btn-primary float-right btn-sm" id="new_role"><i class="fa fa-plus"></i> New role</button>
	</div>
	</div>
	<br>
	<div class="row">
		<div class="card col-lg-12">
			<div class="card-body">
				<table class="table table-striped table-bordered col-md-12">
				<colgroup>
									<col width="5%">
									<col width="10%">
									<col width="60%">
									<col width="10%">
									<!-- <col width="20%">
									<col width="10%"> -->
								</colgroup>
			<thead>
				<tr>
					<th class="text-center">#</th>
					<th class="text-center">Name</th>
					<th class="text-center">Description</th>
					<th class="text-center">Action</th>
				</tr>
			</thead>
			<tbody>
				<?php
 					include 'db_connect.php';
 					$users = $conn->query("SELECT * FROM user_role order by role_name asc");
 					$i = 1;
 					while($row= $users->fetch_assoc()):
				 ?>
				 <tr>
				 	<td>
				 		<?php echo $i++ ?>
				 	</td>
				 	<td class="text-left">
				 		<?php echo $row['role_name'] ?>
				 	</td>
				 	<td class="text-left">
				 		<?php echo $row['Description'] ?>
				 	</td>
				 	<td>
				 		<center>
								<div class="btn-group">
								  <button type="button" class="btn btn-primary">Action</button>
								  <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								    <span class="sr-only">Toggle Dropdown</span>
								  </button>
								  <div class="dropdown-menu">
								    <a class="dropdown-item edit_role" href="javascript:void(0)" data-id = '<?php echo $row['role_id'] ?>'>Edit</a>
								    <div class="dropdown-divider"></div>
								    <a class="dropdown-item delete_role" href="javascript:void(0)" data-id = '<?php echo $row['role_id'] ?>'>Delete</a>
								  </div>
								</div>
								</center>
				 	</td>
				 </tr>
				<?php endwhile; ?>
			</tbody>
		</table>
			</div>
		</div>
	</div>

</div>
<script>
	
$('#new_role').click(function(){
	uni_modal('New Role','manage_role.php')
})
$('.edit_role').click(function(){
	uni_modal('Edit Role','manage_role.php?id='+$(this).attr('data-id'),"large")
})
$('.delete_role').click(function(){
		_conf("Are you sure to delete this role?","delete_role",[$(this).attr('data-id')])
	})
	function delete_role($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=delete_role',
			method:'POST',
			data:{id:$id},
			success:function(resp){
				if(resp==1){
					alert_toast("Data successfully deleted",'success')
					setTimeout(function(){
						location.reload()
					},1500)

				}
			}
		})
	}
</script>