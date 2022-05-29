<?php
// include 'includes/callAPI.php';
$json_uom = callAPI('GET', 'http://localhost/uvmis/api/v1/uoms/ListAllUOM.php', false);
$uoms = json_decode($json_uom);
$json_Gender = callAPI('GET', 'http://localhost/uvmis/api/v1/gender/gender.php', false);
$Gender = json_decode($json_Gender);
$json_BirthPlace = callAPI('GET', 'http://localhost/uvmis/api/v1/Birth/BirthPlace.php', false);
$BirthPlace = json_decode($json_BirthPlace);
$json_relationship = callAPI('GET', 'http://localhost/uvmis/api/v1/Birth/relationship.php', false);
$relationship = json_decode($json_relationship);
$manrelationship = json_decode($json_relationship);
$json_BirthFacilitator = callAPI('GET', 'http://localhost/uvmis/api/v1/Birth/BirthFacilitator.php', false);
$BirthFacilitator = json_decode($json_BirthFacilitator);
$json_client = callAPI('GET', 'http://localhost/uvmis/api/v1/client/Listclient.php', false);
$client = json_decode($json_client);

//parent details
$parent = $conn->query("SELECT * from   parent p inner join client_parent cp on cp.parent=p.parent_id inner join relationship r on cp.relation=r.relationship_id");
while ($row = $parent->fetch_assoc()) :
    $parent_arr[$row['client_parent_id']] = $row;
endwhile;

?>
<div class="container">
    <nav class="navbar navbar-light justify-content-center mt-4 col-md-12">
        <form class="form-inline">
            <button type="button" class="btn btn-primary btn-lg mr-3" id="btnSort">Sort</button>
            <input class="form-control form-control-lg mr-sm-2" type="search" placeholder="Type a name" aria-label="Search" id="search">
            <!-- <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button> -->
        </form>
    </nav>
    <div class="layout-margin-8 mt-4">
        <div class="row">

        
        <div class="card-deck">
            <?php
            $client_sql = "SELECT  c.*,g.name as gender_name,cl.kijiji,cl.kitongoji,cl.mtaa,bf.name as birth_facilitator_name,bp.name as birth_place_name FROM client c inner join client_location cl on cl.client=c.client_id
                        INNER JOIN birth_facilitator bf on c.birth_facilitator=bf.facilitator_id
                        INNER JOIN birth_place bp on bp.place_id=c.birth_place
                        INNER JOIN gender g on c.gender=g.gender_id";
            $client_name = $conn->query($client_sql);
            while ($client = $client_name->fetch_assoc()) {
            ?>
                <!-- <div class="card p-2">
        <div class="d-flex align-items-center">
            <div class="image">
                
            </div>
            <div class="ml-3 w-100">
                <h4 class="mb-0 mt-0">Alex HMorrision</h4>
                <span>Senior Journalist</span>
                <div class="p-2 mt-2 bg-primary d-flex justify-content-between rounded text-white stats">
                    <div class="d-flex flex-column">
                        <span class="articles">Articles</span>
                        <span class="number1">38</span>
                    </div>
                    <div class="d-flex flex-column">
                        <span class="followers">Followers</span>
                        <span class="number2">980</span>
                    </div>
                    <div class="d-flex flex-column">

                        <span class="rating">Rating</span>
                        <span class="number3">8.9</span>
                    </div>
                </div>
                <div class="button mt-2 d-flex flex-row align-items-center">
                    <button class="btn btn-sm btn-outline-primary w-100">Chat</button>
                    <button class="btn btn-sm btn-primary w-100 ml-2">Follow</button>
                </div>
            </div>
        </div>
    </div> -->
                <!-- <div class="card mt-3" style="border-radius: 15px; padding: 1px;margin-left:10px;">
          <div class="card-body text-center">
            <div class="mt-3 mb-2">
              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava2-bg.webp"
                class="rounded-circle img-fluid" style="width: 100px;" />
            </div>
            <h4 class="mb-2">Julie L. Arsenault</h4>
            <p class="text-muted mb-3">@Programmer <span class="mx-2">|</span> <a
                href="#!">mdbootstrap.com</a></p>
            <button type="button" class="btn btn-primary btn-rounded btn-md">
              Message now
            </button>
            <div class="d-flex justify-content-between text-center mt-5 mb-2">
              <div>
                <p class="mb-2 h5">8471</p>
                <p class="text-muted mb-0">Wallets Balance</p>
              </div>
              <div class="px-3">
                <p class="mb-2 h5">8512</p>
                <p class="text-muted mb-0">Income amounts</p>
              </div>
              <div>
                <p class="mb-2 h5">4751</p>
                <p class="text-muted mb-0">Total Transactions</p>
              </div>
            </div>
          </div>
        </div> -->
        <div class="col-md-4" style="border-radius: 15px; padding-bottom: 5px;">
                <div class="card card-shadow text-center">
                    <div class="card-body">
                        <h4 class="card-title"><?= $client['middle_name']  ?></h4>
                        <p class="card-text">Product Designer</p>
                        <div class="dropdown-divider"></div>
                        <p class="card-text"><small class="text-muted">Team C</small></p>
                        <a href="#">
                            <button type="button" class="btn btn-outline-primary">Email</button>
                        </a>
                        <div class="d-flex justify-content-between text-center mt-5 mb-2">
                            <div>
                                <p class="mb-2 h5">8471</p>
                                <p class="text-muted mb-0">Wallets Balance</p>
                            </div>
                            <div class="px-3">
                                <p class="mb-2 h5">8512</p>
                                <p class="text-muted mb-0">Income amounts</p>
                            </div>
                            <div>
                                <p class="mb-2 h5">4751</p>
                                <p class="text-muted mb-0">Total Transactions</p>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
            <?php
            }
            ?>
        </div>
        </div>
    </div>
</div>
<style>
    /* .card {
        width: 400px;
        border: none;
        border-radius: 10px;

        background-color: #fff;
    }



    .stats {

        background: #f2f5f8 !important;

        color: #000 !important;
    }

    .articles {
        font-size: 10px;
        color: #a1aab9;
    }

    .number1 {
        font-weight: 500;
    }

    .followers {
        font-size: 10px;
        color: #a1aab9;

    }

    .number2 {
        font-weight: 500;
    }

    .rating {
        font-size: 10px;
        color: #a1aab9;
    }

    .number3 {
        font-weight: 500;
    } */
</style>
<script>
    // this overrides `contains` to make it case insenstive
    jQuery.expr[':'].contains = function(a, i, m) {
        return jQuery(a).text().toUpperCase()
            .indexOf(m[3].toUpperCase()) >= 0;
    };

    $('#search').keyup(function() {
        $('.card').removeClass('d-none');
        var filter = $(this).val(); // get the value of the input, which we filter on
        $('.card-deck .col-md-4').find('.card .card-body h4:not(:contains("' + filter + '"))').parent().parent().addClass('d-none');
        // $('.card-deck').find('.card .card-body p:not(:contains("'+filter+'"))').parent().parent().addClass('d-none');
    })

    $('#btnSort').click(function() {
        $('.card-deck .card').sort(function(a, b) {
            return $(a).find(".card-title").text() > $(b).find(".card-title").text() ? 1 : -1;
        }).appendTo(".card-deck");
    })
</script>