<style>
	#logo {
    margin: auto;
    font-size: 20px;
    background: white;
    padding: 5px 13px;
    border-radius: 50% 50%;
    color: #000000b3;
}
</style>
<?php
// include "header.php";
?>
<nav class="navbar navbar-expand-lg navbar-dark  fixed-top bg-primary" style="padding:0;">
  <div class="container-fluid mt-2 mb-2">
  	<div class="col-lg-12">
  		<div class="col-md-1 float-left" style="display: flex;">
      
  			<!-- <div class="logo"> -->
  				<!-- <i class="fa fa-prescription-bottle-alt"></i> -->
          <img src="assets/img/ngao.png" alt="" class="img-circle" height="40px" width="50px">
         
  			<!-- </div> -->
  		</div>
      <div class="col-md-4 float-left text-white">
        <large><b><?=$_SESSION['setting_name']?></b></large>
      </div>
      <div class="float-right">
  	  	<div class=" dropdown mr-4">
            <a href="#" class="text-white dropdown-toggle"  id="account_settings" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><?php echo $_SESSION['login_username'] ?> </a>
            <div class="dropdown-menu" aria-labelledby="account_settings" style="left: -2.5em;">
              <a class="dropdown-item" href="javascript:void(0)" id="manage_my_account"><i class="fa fa-cog"></i> Manage Account</a>
              <a class="dropdown-item" href="ajax.php?action=logout"><i class="fa fa-power-off"></i> Logout</a>
            </div>
      </div>
    </div>
    <div class="float-right mr-4">
    <?php
    $d= (new DateTime('now'));
    $d=$d->format('Y-m-d');
    $date= new DateTime('now');
    $m=3;
    $month=new DateInterval('P'.$m.'M');
    $date->add($month);
    $d1=$date->format('Y-m-d') ;
    ?>
        <button class="bg-primary" id="near_to_expire" title="Near to Expire"><span class="icon icon-field icon-large bg-warning"><i class="fa fa-trash fa-lg"></i></span><sup class="badge badge-warning"></sup></button>
        <button class="bg-primary"  id="under_stock" title="Under minimum stock level"><span class="icon icon-field icon-large bg-secondary"><i class="fa fa-bell fa-lg"></i></span><sup class="badge badge-secondary"></sup></button>
        <button class="bg-primary" id="over_stock" title="Over maximum stock level"><span class="icon icon-field icon-large bg-success"><i class="fa fa-archive fa-lg"></i></span><sup class="badge badge-success"></sup></button>
    </div>
  </div>
  </div>
  
</nav>
<script>
  $('#manage_my_account').click(function(){
    uni_modal("Manage Account","manage_user.php?id=<?php echo $_SESSION['login_id'] ?>&mtype=own")
  });
  $('#near_to_expire').click(function(){
    uni_modal('Manage Near To Expire','to_expire.php',"large")
  });
  $('#under_stock').click(function(){
    uni_modal('under and Out of stock list','out_of_stock.php',"large")
  });
  $('#over_stock').click(function(){
    uni_modal('Over stock list','over_stock.php',"large")
  });
</script>