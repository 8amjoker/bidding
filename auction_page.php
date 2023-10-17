<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/auction-page.css"> 
    <link rel="stylesheet" href="./css/header.css">
    <title>Auction Page</title>
</head>
<body>
    

<div class="header">
    
<div class="header">
    <div class="first">
        <div class="left">
            <div class="menu">
                <img src="./img/icon/menu.png" alt="menu" class="open-nav">
            </div>
        </div>
        <div class="right">
            <div class="log">
                <img src="./img/logo2.png" alt="logo" />
            </div>
        </div>
    </div>

    <div class="second">
        <div class="links">
            <?php
            session_start();

            if (isset($_SESSION['user_logged_in']) && $_SESSION['user_logged_in'] === true) {
              
                echo '<a href="buy_bids.php" style="text-decoration: none; color: black;">BUY BIDS</a>';
                echo '<a href="profile.php" style="text-decoration: none; color: black;">PROFILE</a>';
                echo '<a href="notifications.php" style="text-decoration: none; color: black;">NOTIFICATIONS</a>';
                echo '<a href="shop.php" style="text-decoration: none; color: black;">Shop</a>';
                
               
                if (isset($_SESSION['bid_coin_balance'])) {
                    echo '<p>Bid Coin Balance: ' . $_SESSION['bid_coin_balance'] . '</p>';
                }
           
                if (isset($_SESSION['main_amount'])) {
                    echo '<p>Main Amount: ' . $_SESSION['main_amount'] . '</p>';
                }
            } else {
                
                echo '<a href="register.php"><button style="color: #00013d;">Sign Up</button></a>';
                echo '<a href="login.php"><button style="color: #56b2b7;">Login</button></a>';
            }
            ?>
        </div>
    </div>
</div>


<div class="menu-con">
    <div class="top">
        <img src="./img/logo-colored.png" alt="" />
        <div class="close">&times;</div>
    </div>
    <div class="content">
        <div class="list">
            <a href="#" style="text-decoration: none; color: black;"><p>Auctions</p></a>
            <a href="#" style="text-decoration: none; color: black;"><p>Spin</p></a>
            <a href="#" style="text-decoration: none; color: black;"><p>Games</p></a>
            <a href="#" style="text-decoration: none; color: black;"><p>dice</p></a>
        </div>
        <div class="btn">
            <?php
           
            if (isset($_SESSION['user_logged_in']) && $_SESSION['user_logged_in'] === true) {
                echo '<a href="logout.php"><button>Log out</button></a>';
            }
            ?>
        </div>
    </div>
</div>
</div>

<div class="menu-con">
    <!-- Menu content here -->
</div>

<?php

include("db.php");

// Check the connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}


if (isset($_GET['id'])) {
    $auctionId = intval($_GET['id']); // Convert to an integer
} else {
   
    $auctionId = 1; 
}

// SQL query to retrieve auction information including current_bid
$sql = "SELECT auction_title, image_path, current_bid FROM auctions WHERE id = $auctionId";
$result = mysqli_query($conn, $sql);

if ($result && mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    $auctionTitle = $row['auction_title'];
    $imagePath = $row['image_path'];
    $currentBid = $row['current_bid']; 
} else {
    $auctionTitle = "Auction Not Found";
    $imagePath = "default-image.jpg";
    $currentBid = 0; 
}


mysqli_close($conn);
?>

<div class="auction-container">
    <div class="auction-item">
        <img src="<?php echo $imagePath; ?>" alt="<?php echo $auctionTitle; ?>"style="width:60px">
        <h1><?php echo $auctionTitle; ?></h1>
        <p>Current Bid: $<?php echo $currentBid; ?></p>

        <button class="bid-button" data-bid-amount="10">Place Bid</button>

       
    </div>
</div>

<div class="middle">
        <!-- <div id="countdown-timer">Countdown: <span id="timer">20</span> seconds</div> -->
    <div class="head">

        <div class="current">
            <p>Current Bidder :</p>
            <div class="wrap">
            <img src="img/avatar.png" alt="avatar">
            <div class="name">kevwe</div>
            </div>
            
        </div>
    </div>

            <div id="leaderboard">
                <div class="user">
                    <div class="profile">
                        <img src="img/avatar.png" alt="">
                    </div>
                    <div class="name">kevewe</div>
                    <div class="bid">₦70</div>
                </div>

                <div class="user">
                <div class="profile">
                        <img src="img/avatar.png" alt="">
                    </div>
                    <div class="name">light</div>
                    <div class="bid">₦40</div>
                </div>

                <div class="user">
                <div class="profile">
                        <img src="img/avatar.png" alt="">
                    </div>
                    <div class="name">potato</div>
                    <div class="bid">₦30</div>
                </div>
            </div>
            <div class="btn">
            <button id="place-bid-button">Bid bot</button>
            </div>
</div>

<script>
  // Add this to your menuController.js file
document.querySelector('.bid-button').addEventListener('click', function() {
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'bid.php', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onload = function() {
        if (this.status == 200) {
            alert('Bid placed successfully');
            location.reload();  // Reload the page
        } else {
            alert('Error placing bid');
        }
    };
    xhr.send('auctionId=' + this.dataset.bidAmount);
});
</script>
<script src="./js/menuController.js"></script>


</body>
</html>
