<?php
include 'db_connect.php';
$sql = "SELECT * FROM users WHERE role = 'Nurse'";
$result = $conn->query($sql);

?>
<div class="container first-container col-sm-12 pull-left">
    <div class="card">
        <div class="card-header newPrivilegeBased">
            <b>Nurse List</b>
            <!-- <a class="col-md-2 float-right btn btn-success btn-sm" id="new_wholesale_sales" data-privilageRequired="PerformWholeSaleTransaction"><i class="fa fa-plus"></i>New Wholesale Sales</a> -->
            <a class="col-md-2 float-right btn btn-primary btn-sm" id="new_client" data-privilageRequired="PerformNormalSaleTransaction"><i class="fa fa-plus"></i>&nbsp;New Nurse</a>
        </div>
        <div class="card-body">
            <table class="table table-condensed" id="client_informaton1">
                <thead>
                    <tr>
                        <th>User ID</th>
                        <th>User Name</th>
                        <th>Password</th>
                        <th>Date Created</th>
                        <th>changed By</th>
                        <th>date Changed</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    while ($row = $result->fetch_assoc()) {
                    ?>
                        <tr class="sub-container">
                            <td><?= $row["user_id"] ?></td>
                            <td><?= $row["username"] ?></td>
                            <td><?= $row["password"] ?></td>
                            <td><?= $row["date_created"] ?></td>
                            <td><?= ($row["changed_by"] == NULL )? "NULL" : $row["changed_by"];?></td>
                            <td><?= ($row["date_changed"] == NULL )? "NULL" : $row["date_changed"];?></td>
                            <td><input class='btn btn-success' type='button' value='Edit'></td>
                            <td><input class='btn btn-danger' type='button' value='Delete'></td>
                        </tr>
                        <?php
                        $client_patient = $conn->query("SELECT * FROM parent p inner join client_parent cp ON p.parent_id=cp.parent
                 inner join relationship r on r.relationship_id=cp.relation where cp.client='" . $row['user_id'] . "'");
                        ?>
                        <!-- <tr class="explode hide">
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
                        </tr> -->
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
        uni_modal("NURSE REGISTRATION FORM.","nurse_reg.php","large")
    })
</script>