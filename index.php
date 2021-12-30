<?php include "./views/header.html"?>

<body class="preload">
    <header>
        <h1>NOT STARWARS</h1>
        <h4>SuperDevsTM </h4>
    </header>
    <div class="grid-container">
        <div id="hover-list">
            <ul id="icon-list-text" class="hidden">
            </ul>
        </div>
        <!--List items populated by Javascript-->
        <div class="middle-container">
            <div class="mid-top">
                <div class="login-box">
                <h2>Login</h2>
                <form>
                  <div class="user-box">
                    <input type="text" name="" required="">
                    <label>Username</label>
                  </div>
                  <div class="user-box">
                    <input type="password" name="" required="">
                    <label>Password</label>
                  </div>
                  <a href="#">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    Submit
                  </a>
                </form>
                </div>
            </div>
            <?php /*

            $servername = "localhost";

            $username = "user";

            $password = "pass";

            $db = "rpg_game";

            // Create connection

            $conn = mysqli_connect($servername, $username, $password, $db);

            // Check connection

            if (!$conn) {

            die("Connection failed: " . mysqli_connect_error());

            }

            echo "Connected successfully";

            */?>
            <!--Main dynamic container-->
        </div>
        <div class="right-container">
            <div class="right-top">
            </div>
            <div class="right-middle">
            </div>
            <div class="right-bottom">
            </div>
        </div>
        <!--Hero-Section from JavaScript-->
    </div>

<?php include "./views/indexfooter.html"?>
