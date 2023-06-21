<!DOCTYPE html>
<html>
	<head>
		<title>
			Payments Page
		</title>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<style>
		* {
/* Here i made the margin and padding 0 */
margin: 0;

	padding: 20;
}

body {
  background-image: url("https://w0.peakpx.com/wallpaper/569/626/HD-wallpaper-wheat-grain-nature-grain-sandy-colour-wheat.jpg");
  background-repeat: no-repeat;
  background-size: cover;
}
.background {
	background: linear-gradient(to right, #ff3300 0%, #ff9900 84%);
	
	background-size: cover;
}
.w3-card{
background-color: grey;
}
.w3-color{
	background: linear-gradient(to bottom, #ffcc00 0%, #ffcc99 100%);
}
.w3-colors{
	background: linear-gradient(to bottom, #ff9900 0%, #ff6600 100%);

}
.tab{
	background: linear-gradient(to bottom, #ffcc00 0%, #ffcc99 100%);
}

.navbar {
	display: flex;

/* This is used to make the navbar sticky, So that the
	navbar stays at the top part even if we scroll */
	position: sticky;
	align-items: center;
	justify-content: center;
	top: 0px;

/*it specifies the mouse cursor to be displayed
	when it is pointed over the element */
	cursor: pointer;
}

.nav-list {
	width: 50%;
	display: flex;
}

.nav-list li {
	list-style: none;
	padding: 26px 30px;
}

.nav-list li a {
	text-decoration: none;
	color: whitesmoke;
	font-size: 130%;
}

.nav-list li a:hover {
	color: black;
}

.rightNav {
	width: 50%;
	text-align: right;
}
.btn{
	width: 10%;
	font-size: 105%;
}

#search {
	padding: 5px;
	font-size: 17px;
	border: 2px solid grey;
	border-radius: 9px;
}

.background {
	background: orangered;
	
	background-size: cover;
}

	</style>
	</head>
	<body bgcolor="whitesmoke">
		<nav class="navbar background">
			<h3 align="center" style="align:center;">Payment Details Page</h3>
    </nav>
<div class="w3-sidebar w3-colors w3-bar-block w3-card" style="width:15%; background-color:green;">
  <h3 class="w3-bar-item">Menu</h3>
  <a href="/home" class="w3-bar-item w3-button w3-card-2 w3-color w3-animate-top">Home</a>
  <a href="/orders" class="w3-bar-item w3-button w3-card-2 w3-color w3-animate-top">Orders</a>
  <a href="/payments" class="w3-bar-item w3-button w3-card-2 w3-color w3-animate-top">Payments</a>
  <a href="/contactus" class="w3-bar-item w3-button w3-card-2 w3-color w3-animate-top">Terms and conditions</a>
  <a href="/" class="w3-bar-item w3-button w3-card-2 w3-color w3-animate-top">Logout</a>
  <a href="/Userdetail" class="w3-bar-item w3-button w3-card-2 w3-color w3-animate-top">User-Detail</a>
</div>
		</nav>
		<center>
		<h1 align="center">CUSTOMER PAYMENT DETAILS</h1>
		<br><br><br>
		<form>
			<table>
				<th style="font-size:130%; background-color:yellow;">SEARCH FILTER</th>
				<tr>
					<td style="font-size:140%">Order Id:</td>
					<td><input type="number"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td style="font-size:140%">
						Order status:
					</td>

				
					<td>
						<select name="SELECT" id="ABC">
 							 <option value="Delivered">Delivered</option>
 							 <option value="Deliverednot">NOT Delivered</option>
						</select>
					</td>

				</tr>
				<tr>
					<td>-----------------------</td>
					<td>-----------------------</td>
				</tr>

				<tr>
					<td style="font-size:140%">
						From Date:
					</td>
					<td>
						<input type="date" name="">
					</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>

					<td style="font-size:140%">
						To Date:
					</td>
					<td>
						<input type="date" name="">
					</td>
				</tr>	
			</table>
			<br><br><br>
			<button type="submit" style="font-size:120%; background-color:orangered;">Search</button>&nbsp;
			<button type="reset" style="font-size:120%; background-color:orangered;">Reset</button>
		</form>
		<br><br><br>
		<form>
			<table border="1" class="tab" style="font-size:100%; margin-right: -10%;">
				<th>
					Sr No.
				</th>
				<th>Customer Name</th>
				<th>Order ID</th>
				<th>Order Date</th>
				<th>Order amount</th>
				<th>Payment Mode</th>
				<th>Payment Status</th>
				<th>Invoice</th>
				<tr>
					<td align="center">1</td>
					<td align="center">ABC</td>
					<td align="center">101101</td>
					<td align="center">27-02-23</td>
					<td align="center">17000</td>
					<td align="center">COD</td>
					<td align="center">Success</td>
					<td align="center"><a href="#">View</a></td>
				</tr>
				<tr>
					<td align="center">2</td>
					<td align="center">XYZ</td>
					<td align="center">101102</td>
					<td align="center">12-02-23</td>
					<td align="center">11000</td>
					<td align="center">CHEQUE</td>
					<td align="center">Success</td>
					<td align="center"><a href="#">View</a></td>
				</tr>
				<tr>
					<td align="center">3</td>
					<td align="center">PQR</td>
					<td align="center">101103</td>
					<td align="center">23-01-23</td>
					<td align="center">10000</td>
					<td align="center">CHEQUE</td>
					<td align="center">Success</td>
					<td align="center"><a href="#">View</a></td>
				</tr>
				<tr>
					<td align="center">4</td>
					<td align="center">JKL</td>
					<td align="center">101103</td>
					<td align="center">23-01-23</td>
					<td align="center">10000</td>
					<td align="center">COD</td>
					<td align="center">Success</td>
					<td align="center"><a href="#">View</a></td>
				</tr>
				<tr>
					<td align="center">5</td>
					<td align="center">KLM</td>
					<td align="center">101103</td>
					<td align="center">23-01-23</td>
					<td align="center">10000</td>
					<td align="center">COD</td>
					<td align="center">Success</td>
					<td align="center"><a href="#">View</a></td>
				</tr>
				<tr>
					<td align="center">6</td>
					<td align="center">IOP</td>
					<td align="center">101103</td>
					<td align="center">23-01-23</td>
					<td align="center">10000</td>
					<td align="center">COD</td>
					<td align="center">Success</td>
					<td align="center"><a href="#">View</a></td>
				</tr>
				<tr>
					<td align="center">7</td>
					<td align="center">ERT</td>
					<td align="center">101103</td>
					<td align="center">23-01-23</td>
					<td align="center">10000</td>
					<td align="center">COD</td>
					<td align="center">Success</td>
					<td align="center"><a href="#">View</a></td>
				</tr>
			</table>
		</form>
	</center>
	</body>
</html>
