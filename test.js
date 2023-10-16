<?php
include("db.php"); // Include your database connection code

// Fetch auctions from your database (modify the query as needed)
$sql = "SELECT * FROM auctions";
$result = $conn->query($sql);

if ($result) {
    $auctions = [];

    while ($row = $result->fetch_assoc()) {
        // Build an array of auction data
        $auction = [
            'auction_title' => $row['auction_title'],
            'image_path' => $row['image_path'],
            'start_date' => $row['start_date'],
            'countdown' => $row['countdown'], // Replace with your actual countdown logic
        ];

        // Add the auction data to the array
        $auctions[] = $auction;
    }

    // Send the auctions as JSON response
    header('Content-Type: application/json');
    echo json_encode($auctions);
} else {
    // Handle the case where there are no auctions or an error occurred
    echo '[]'; // Return an empty JSON array
}

$conn->close();
?>
