<!-- <?php
    include "db_connect.php";
    $sql="SELECT u.user_id,u.username name,ur.role_id role ,r.role_name role_name,p.privilege_id role_privileges_id,p.name role_privieges_name from   users u
                inner join user_role ur on u.user_id = ur.user_id
                inner join roles r on ur.role_id = r.role_id
                inner join role_privileges rp on r.role_id = rp.role_id
                inner join privileges p on rp.privilege_id = p.privilege_id
            WHERE u.user_id='".$_SESSION['login_user_id']."'";
    $Privi=mysqli_query($conn,$sql);
    ?>
        <script>
            $('.newPrivilegeBased a').hide();
            $(document).ready(function(){
                <?php
                if ($Privi) {
                    while ($row=mysqli_fetch_array($Privi)) {
                    ?>
                    <script>
                        if ($('.newPrivilegeBased').find('a[data-privilageRequired="<?php echo $row['role_privieges_name'];?>"]')) {
                            // $('a[data-privilageRequired="<?php echo $row["role_privieges_name"]?>"]').css('display','block')
                            $('a[data-privilageRequired="<?php echo $row["role_privieges_name"];?>"]').show()
                        }
                    </script>
                    <?php
                    }
                }
            ?>
            });
        </script> -->
        <?php
    include "db_connect.php";
    $sql="SELECT u.user_id,u.username name,ur.role_id role ,r.role_name role_name,p.privilege_id role_privileges_id,p.name role_privieges_name from   users u
                inner join user_role ur on u.user_id = ur.user_id
                inner join roles r on ur.role_id = r.role_id
                inner join role_privileges rp on r.role_id = rp.role_id
                inner join privileges p on rp.privilege_id = p.privilege_id
            WHERE u.user_id='".$_SESSION['login_user_id']."'";
    $Privi=mysqli_query($conn,$sql);
    ?>
        <script>
            $('.newPrivilegeBased a').hide()
        </script>
    <?php
    if ($Privi) {
        while ($row=mysqli_fetch_array($Privi)) {
           ?>
           <script>
            if ($('.newPrivilegeBased').find('a[data-privilageRequired="<?php echo $row['role_privieges_name']?>"]')) {
                // $('a[data-privilageRequired="<?php echo $row["role_privieges_name"]?>"]').css('display','block')
                $('a[data-privilageRequired="<?php echo $row["role_privieges_name"]?>"]').show()
            }
           </script>
           <?php
        }
    }


?>
 