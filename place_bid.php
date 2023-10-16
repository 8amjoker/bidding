<?php
// Include your database connection logic here
include("db.php");

// Initialize the response array
$response = array('success' => false, 'message' => '');

// Check if the user is logged in and has a valid session
session_start();
if (!isset($_SESSION['user_logged_in']) || $_SESSION['user_logged_in'] !== true) {
    $response['message'] = 'User is not logged in.';
} else {
    // Get the user's bid coin balance and user ID from the session
    $userId = $_SESSION['user_id']; // Replace with the actual session variable name

    // Get the auction ID and bid amount from the POST request
    $auctionId = $_POST['auctionId']; // Ensure you validate and sanitize this input
    $bidAmount = $_POST['bidAmount']; // Ensure you validate and sanitize this input

    // Check if the user has enough bid coins to place the bid
    if ($_SESSION['bid_coin_balance'] >= $bidAmount) {
        // Deduct the bid amount from the user's bid coin balance
        $_SESSION['bid_coin_balance'] -= $bidAmount;

        // Update the user's bid coin balance in the database (You need to implement this)
        // You should use prepared statements to prevent SQL injection

        // Insert the bid into the database (You need to implement this)
        // Ensure you record the user ID, auction ID, and bid amount

        $response['success'] = true;
        $response['new_balance'] = $_SESSION['bid_coin_balance']; // Send the new balance to the client
    } else {
        $response['message'] = 'Insufficient bid coins.';
    }
}

// Assuming you have a $conn object for database connection

// Update the user's bid coin balance in the database
$updateBalanceQuery = "UPDATE users SET bid_coin_balance = bid_coin_balance - ? WHERE user_id = ?";
$updateBalanceStatement = mysqli_prepare($conn, $updateBalanceQuery);
mysqli_stmt_bind_param($updateBalanceStatement, 'ii', $bidAmount, $userId);
if (mysqli_stmt_execute($updateBalanceStatement)) {
    // Balance updated successfully
} else {
    // Handle the error
    $response['message'] = 'Error updating bid coin balance.';
}

// Insert the bid into the database
$insertBidQuery = "INSERT INTO bids (user_id, auction_id, bid_amount) VALUES (?, ?, ?)";
$insertBidStatement = mysqli_prepare($conn, $insertBidQuery);
mysqli_stmt_bind_param($insertBidStatement, 'iii', $userId, $auctionId, $bidAmount);
if (mysqli_stmt_execute($insertBidStatement)) {
    // Bid inserted successfully
} else {
    // Handle the error
    $response['message'] = 'Error inserting bid.';
}


// Return the response as JSON
header('Content-Type: application/json');
echo json_encode($response);
?>