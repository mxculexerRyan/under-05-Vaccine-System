<?php
    
?>
<style>
    #app{
    width: 400px;
    height: 100vh;
    margin: auto;
    text-align: center;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
    h3{
        text-transform: capitalize;
    }
    h4{
        text-transform: uppercase;
    }

    .moi_img{
    width: 150px;
    height: 150px;
    border-radius: 50%;
    border: 5px #333 solid;
    margin-bottom: 1rem;
}
</style>
<body>
<?php
    include 'db_connect.php';
    $user_id = $_SESSION['login_user_id'];
    $sql = "SELECT * FROM users WHERE user_id ='$user_id'";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
    }
?>
    <div id="app">
        <img src="./assets/img/1600415520_avatar.jpg" alt="firstName" class="moi_img">
        <h3><?php echo $row['username']; ?> </h3>
        <h4><?php echo $row['role']; ?> </h4>
    </div>
</body>