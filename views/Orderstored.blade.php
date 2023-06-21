<!DOCTYPE html>
<html>

<head>
    <title>Order Detail</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }

        .container {
            width: 80%;
            margin: auto;
            padding-top: 20px;
        }

        h1 {
            text-align: center;
        }

        table {
            font-size: 18px;
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 40px;
        }

        th,
        td {
            text-align: left;
            border-bottom: 1px solid #ddd;
            padding: 15px;
        }

        .total {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 24px;
            font-weight: bold;
            padding: 15px;
            background-color: #f2f2f2;
        }

        .btn {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            margin-top: 20px;
        }

        .btn:hover {
            background-color: #333;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>Order Detail</h1>
        <table>
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
            
                <tr>
                    <td>wheat</td>
                    <td>10</td>
                    <td>50</td>
                    <td>500</td>
                </tr>
                
            </tbody>
        </table>

        <div class="total">
            <span>Order Total:</span>
            <span>500</span>
        </div>
        <br><br><br><br><br><br><br><br><br>
        <center>
        <a href="/home" class="btn">Back to Homepage</a>
    </div>
    <center>
</body>

</html>
