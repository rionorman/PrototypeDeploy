 <?php
  $username = "myuser_1";
  $password = "mypassword_1";
  $dbname = $v_db;
  $hostname = "localhost:3316";

  $con = mysqli_connect($hostname, $username, $password, $v_db);
  // Check connection
  if (mysqli_connect_errno()) {
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }
  ?>