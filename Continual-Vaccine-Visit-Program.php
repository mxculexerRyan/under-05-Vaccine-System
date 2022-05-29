<?php
include 'client-parent.php';
include 'includes/AgeCalculator.php';
?>
<section style="background-color: #eee;">
  <div class="container">
    <div class="row">
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center">
            <img src="assets/img/1600415520_avatar.jpg" alt="avatar" class="rounded-circle img-fluid" style="width: 150px;">
            <h5 class="my-3"><?= $client_data[$_GET['id']]['first_name'] . " " . $client_data[$_GET['id']]['middle_name'] . "  " . $client_data[$_GET['id']]['last_name'] ?></h5>
            <p class="text-muted mb-1"><?= "Date of Birth: " . $client_data[$_GET['id']]['dob'] ?></p>
            <p class="text-muted mb-4"><?= "Age: " . ageCalclator(date($client_data[$_GET['id']]['dob']))->y . "Yrs  " . ageCalclator(date($client_data[$_GET['id']]['dob']))->m . "Months  " . ageCalclator(date($client_data[$_GET['id']]['dob']))->d . "Days " ?></p>
            <!-- <div class="d-flex justify-content-center mb-2">
              <button type="button" class="btn btn-primary">Follow</button>
              <button type="button" class="btn btn-outline-primary ms-1">Message</button>
            </div> -->
          </div>
        </div>
        <div class="card mb-4 mb-lg-0">
          <!-- <div class="card-body p-0">
            <ul class="list-group list-group-flush rounded-3">
              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                <i class="fas fa-globe fa-lg text-warning"></i>
                <p class="mb-0">https://mdbootstrap.com</p>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                <i class="fab fa-github fa-lg" style="color: #333333;"></i>
                <p class="mb-0">mdbootstrap</p>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                <i class="fab fa-twitter fa-lg" style="color: #55acee;"></i>
                <p class="mb-0">@mdbootstrap</p>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                <i class="fab fa-instagram fa-lg" style="color: #ac2bac;"></i>
                <p class="mb-0">mdbootstrap</p>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                <i class="fab fa-facebook-f fa-lg" style="color: #3b5998;"></i>
                <p class="mb-0">mdbootstrap</p>
              </li>
            </ul>
          </div> -->
        </div>
      </div>
      <div class="col-lg-8">
        <div class="card mb-4">
          <div class="card-body">
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Full Name</p>
              </div>
              <div class="col-sm-4">
                <p class="text-muted mb-0">Contact Address</p>
              </div>
              <div class="col-sm-5">
                <p class="text-muted mb-0">Relation </p>
              </div>
            </div>
            <hr>
            <?php
            $parent = $conn->query("SELECT * from   parent p inner join client_parent cp on cp.parent=p.parent_id inner join relationship r on cp.relation=r.relationship_id");
            while ($row = $parent->fetch_assoc()) :
              if ($row['client'] == $_GET['id']) :
            ?>
                <!-- <div class="row">
              <div class="col-sm-3">
                <p class="mb-0"><?= $parent_arr[$_GET['id']]['full_name'] ?></p>
              </div>
              <div class="col-sm-4">
                <p class="text-muted mb-0"><?= $parent_arr[$_GET['id']]['phone_no'] ?></p>
              </div>
              <div class="col-sm-5">
                <p class="text-muted mb-0"><?= $parent_arr[$_GET['id']]['name'] ?> </p>
              </div>
            </div>
            <hr> -->
                <div class="row">
                  <div class="col-sm-3">
                    <p class="mb-0"><?= $row['full_name'] ?></p>
                  </div>
                  <div class="col-sm-4">
                    <p class="text-muted mb-0"><?= "Phone #: " . $row['phone_no'] . "\n" . " Email:" . $row['email'] ?></p>
                  </div>
                  <div class="col-sm-5">
                    <p class="text-muted mb-0"><?= $row['name'] ?> </p>
                  </div>
                </div>
                <hr>
            <?php
              endif;
            endwhile;
            ?>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="card mb-4 mb-md-0">
              <div class="card-body">
                <p class="mb-4"><span class="text-primary font-italic me-1"></span>All Vacine For Program
                </p>
                <!-- <p class="mb-1" style="font-size: .77rem;">Web Design</p>
                <div class="progress rounded" style="height: 5px;">
                  <div class="progress-bar" role="progressbar" style="width: 80%" aria-valuenow="80"
                    aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <p class="mt-4 mb-1" style="font-size: .77rem;">Website Markup</p>
                <div class="progress rounded" style="height: 5px;">
                  <div class="progress-bar" role="progressbar" style="width: 72%" aria-valuenow="72"
                    aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <p class="mt-4 mb-1" style="font-size: .77rem;">One Page</p>
                <div class="progress rounded" style="height: 5px;">
                  <div class="progress-bar" role="progressbar" style="width: 89%" aria-valuenow="89"
                    aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <p class="mt-4 mb-1" style="font-size: .77rem;">Mobile Template</p>
                <div class="progress rounded" style="height: 5px;">
                  <div class="progress-bar" role="progressbar" style="width: 55%" aria-valuenow="55"
                    aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <p class="mt-4 mb-1" style="font-size: .77rem;">Backend API</p>
                <div class="progress rounded mb-2" style="height: 5px;">
                  <div class="progress-bar" role="progressbar" style="width: 66%" aria-valuenow="66"
                    aria-valuemin="0" aria-valuemax="100"></div>
                </div> -->
                <?php
                $vaccine = $conn->query("SELECT * FROM vaccine");
                while ($row = $vaccine->fetch_assoc()) :
                ?>
                  <p class="mt-4 mb-1" style="font-size: .77rem;"><?= $row['name'] ?></p>
                  <div class="progress rounded mb-2" style="height: 5px;">
                    <div class="progress-bar" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                <?php
                endwhile;
                ?>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="card mb-4 mb-md-0">
              <div class="card-body">
                <p class="mb-4"><span class="text-primary font-italic me-1">Vaccine </span> To be taken
                </p>
                <!-- <p class="mb-1" style="font-size: .77rem;">Web Design</p>
                <div class="progress rounded" style="height: 5px;">
                  <div class="progress-bar" role="progressbar" style="width: 80%" aria-valuenow="80"
                    aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <p class="mt-4 mb-1" style="font-size: .77rem;">Website Markup</p>
                <div class="progress rounded" style="height: 5px;">
                  <div class="progress-bar" role="progressbar" style="width: 72%" aria-valuenow="72"
                    aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <p class="mt-4 mb-1" style="font-size: .77rem;">One Page</p>
                <div class="progress rounded" style="height: 5px;">
                  <div class="progress-bar" role="progressbar" style="width: 89%" aria-valuenow="89"
                    aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <p class="mt-4 mb-1" style="font-size: .77rem;">Mobile Template</p>
                <div class="progress rounded" style="height: 5px;">
                  <div class="progress-bar" role="progressbar" style="width: 55%" aria-valuenow="55"
                    aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <p class="mt-4 mb-1" style="font-size: .77rem;">Backend API <?= $_GET['id'] ?></p>
                <div class="progress rounded mb-2" style="height: 5px;">
                  <div class="progress-bar" role="progressbar" style="width: 66%" aria-valuenow="66"
                    aria-valuemin="0" aria-valuemax="100"></div>
                </div> -->
                <form method="" id="Manage-client-vaccine">
                <input type="hidden" name="ClientId" value=<?=$_GET['id']?>>
                  <div class="form-group">
                    <?php
                    $vaccine = $conn->query("SELECT * FROM vaccine");
                    while ($row = $vaccine->fetch_assoc()) :
                    ?>
                    
                      <p class="mt-4 mb-1" style="font-size: .77rem;"><?= $row['name'] ?></p>
                      <!-- <div class="rounded mb-1" style="height: 5px;"> -->
                      <input type="hidden" name="VAccineID[]" value="<?=$row['vaccine_id']?>">
                      <input type="checkbox" name="Vaccinated[]"  class="form-control">
                        <!-- <div class="progress-bar" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div> -->
                      <!-- </div> -->
                    <?php
                    endwhile;
                    ?>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<script>
      $('#Manage-client-vaccine').submit(function(e){
		e.preventDefault();
		start_load()
		$.ajax({
			url:'ajax.php?action=save_client_vaccine',
			method:'POST',
			data:$(this).serialize(),
			success:function(resp){
				if(resp ==1){
					alert_toast("Data successfully saved",'success')
					setTimeout(function(){
						location.reload()
					},1500)
				}else{
                    alert_toast("Data Not saved /n "+resp,'danger')
                    console.log(resp)
                    setTimeout(function(){
                        console.log(resp)
						location.reload()
					},1500)
                }
			}
		})
	})
</script>