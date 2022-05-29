<?php
session_start();
    include 'db_connect.php';

    if($_SERVER['REQUEST_METHOD'] == 'POST'){
        $username = $_POST['username'];
        $password = $_POST['password'];

        $query = "SELECT * FROM users WHERE username = '$username' AND password='$password' LIMIT 1";
        $result = $conn->query($query);
        if($result ->num_rows > 0){
            $row = mysqli_fetch_assoc($result);
            $role = $row["role"];
            $_SESSION['login_user_id'] = $row['user_id'];
            $_SESSION['user_role'] = $row['role'];
            $_SESSION['setting_name'] = 'Under Five Vaccine Management Information System';
            $_SESSION['login_username'] = $row['username'];
            switch ($role) {
                case 'Nurse':
                    echo "<script>
                        location.href ='index.php?page=home2'
                    </script>";
                    break;
                case 'Moi':
                    echo "<script>
                    location.href ='index.php?page=moi_home'
                </script>";
                    break;
                case 'divo':
                    echo "<script>
                    location.href ='index.php?page=divo_home'
                </script>";
                    break;
                default:
                    # code...
                    break;
            }
        }else{
            echo "<script>location.href ='login.php'</script>";
            
        }
    }
?>