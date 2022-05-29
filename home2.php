<?php
include 'db_connect.php';
$qry = "SELECT  c.*,g.name as gender_name,cl.kijiji,cl.kitongoji,cl.mtaa,bf.name as birth_facilitator_name,bp.name as birth_place_name FROM client c inner join client_location cl on cl.client=c.client_id
            INNER JOIN birth_facilitator bf on c.birth_facilitator=bf.facilitator_id
            INNER JOIN birth_place bp on bp.place_id=c.birth_place
            INNER JOIN gender g on c.gender=g.gender_id";
$client = $conn->query($qry);

?>
<div class="container first-container col-sm-12 pull-left">
    <div class="card">
        <div class="card-header newPrivilegeBased">
            <b>Client List</b>
            <!-- <a class="col-md-2 float-right btn btn-success btn-sm" id="new_wholesale_sales" data-privilageRequired="PerformWholeSaleTransaction"><i class="fa fa-plus"></i>New Wholesale Sales</a> -->
            <a class="col-md-2 float-right btn btn-primary btn-sm" id="new_client" data-privilageRequired="PerformNormalSaleTransaction"><i class="fa fa-plus"></i>&nbsp;New Client</a>
        </div>
        <div class="card-body">
            <table class="table table-condensed" id="client_informaton1">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Fist Name</th>
                        <th>Middle Name</th>
                        <th>Last Name</th>
                        <th>Gender</th>
                        <th>Dob</th>
                        <th>Vilage</th>
                        <th>Street</th>
                        <th>Birth Facilitator</th>
                        <th>Birth Place</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    while ($row = $client->fetch_assoc()) {
                    ?>
                        <tr class="sub-container">
                            <td><button type="button" class="btn btn-success exploder">
                                    <span class="glyphicon glyphicon-search"></span>
                                </button></td>
                            <td><?= $row["first_name"] ?></td>
                            <td><?= $row["middle_name"] ?></td>
                            <td><?= $row["last_name"] ?></td>
                            <td><?= $row["gender_name"] ?></td>
                            <td><?= $row["dob"] ?></td>
                            <td><?= $row["kijiji"] ?></td>
                            <td><?= $row["mtaa"] ?></td>
                            <td><?= $row["birth_facilitator_name"] ?></td>
                            <td><?= $row["birth_place_name"] ?></td>
                        </tr>
                        <?php
                        $client_patient = $conn->query("SELECT * FROM parent p inner join client_parent cp ON p.parent_id=cp.parent
                 inner join relationship r on r.relationship_id=cp.relation where cp.client='" . $row['client_id'] . "'");
                        ?>
                        <tr class="explode hide">
                            <td colspan="10" style="background: #CCC; display: none;">
                                <table class="table table-condensed">
                                    <thead>
                                        <tr>
                                            <th colspan="4" class="text-upper">Parents / Gaurdians Information</th>
                                        </tr>
                                        <tr>
                                            <th>Full Name</th>
                                            <th>Phone No.</th>
                                            <th>Email</th>
                                            <th>Relation</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        while ($client_parent = $client_patient->fetch_assoc()) {
                                        ?>
                                            <tr>
                                                <td><?= $client_parent["full_name"] ?></td>
                                                <td><?= $client_parent["phone_no"] ?></td>
                                                <td><?= $client_parent["email"] ?></td>
                                                <td><?= $client_parent["name"] ?></td>
                                            </tr>
                                        <?php
                                        }
                                        ?>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    <?php
                    }
                    ?>
                </tbody>
            </table>
            </td>
            </tr>
            </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    $('#new_client').click(function(){
        uni_modal("CLIENT REGISTARTION FORM.","client_registration.php?id=2850","large")
    })
</script>