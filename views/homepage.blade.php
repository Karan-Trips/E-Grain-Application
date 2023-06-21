<!DOCTYPE html>
<html>
	<head>
		<title>
			Home Page
		</title>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

	<style>
		

.navbar {
	display: flex;
	position: sticky;
	justify-content: center;
	top: 0px;
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
	font-size: 110%;
}

.nav-list li a:hover {
	color: black;
}

.rightNav {
	width: 10%;
	text-align: right;
}
.btn{
	width: 300%;
	font-size: 105%;
}
.tab{
	background: linear-gradient(to bottom, #ffcc00 0%, #ffcc99 100%);
}

#search {
	padding: 5px;
	font-size: 17px;
	border: 2px solid grey;
	border-radius: 9px;
}

.background {
	background: linear-gradient(to right, #ff3300 0%, #ff9900 84%);
	
	background-size: cover;
}
body {
  background-image: url("https://w0.peakpx.com/wallpaper/569/626/HD-wallpaper-wheat-grain-nature-grain-sandy-colour-wheat.jpg");
  background-repeat: no-repeat;
  background-size: cover;
}
table {
    margin: 3px;
    font-family: sans-serif;
    min-width: 600px;
    min-height: 500px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
.dropdown{
	font-size: 140%;
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
.sidebar {
   display: block; /* show sidebar by default */
}

.sidebar.hidden {
   display: none; /* hide sidebar when it has a "hidden" class */
}
	</style>
	</head>
	<body>
		<!-- here in nav tag i have used two classes
			that is navbar and background-->
		<!-- each class declared in nav tag will be
			used to design the form using CSS-->
		<nav class="navbar background">
			<!-- we have used list tag that is ul
				to list the items-->
			<!-- <ul class="nav-list">
				<li><a href="/home">Home</a></li>
				<li><a href="/orders">Orders</a></li>
				<li><a href="/payments">Payments</a></li>
				<li><a href="/contactus">Contact us</a></li>
				<li><a href="/about">About</a></li>
			</ul> -->
			<!-- we have used rightnav in order to design
				the seachbar properly by using CSS-->
				<h3 align="center" style="align:center;">Home Page</h3>
		</nav>
		
		<!-- <div class="sidebar">
  
</div> -->
	<div class="w3-sidebar w3-colors w3-bar-block w3-card" style="width:15%; background-color:green;">
  <h3 class="w3-bar-item">Menu</h3>
  <a href="/welcome" class="w3-bar-item w3-button w3-card-2 w3-color w3-animate-top">Home</a>
  <a href="/home" class="w3-bar-item w3-button w3-card-2 w3-color w3-animate-top">ADD</a>
  <a href="/orders" class="w3-bar-item w3-button w3-card-2 w3-color w3-animate-top">Orders</a>
  <a href="/payments" class="w3-bar-item w3-button w3-card-2 w3-color w3-animate-top">Payments</a>
  <a href="/contactus" class="w3-bar-item w3-button w3-card-2 w3-color w3-animate-top">Terms and conditions</a>
  <a href="/" class="w3-bar-item w3-button w3-card-2 w3-color w3-animate-top">Logout</a>
  <a href="/Userdetail" class="w3-bar-item w3-button w3-card-2 w3-color w3-animate-top">User-Detail</a>
  <a href="/Order_detail" class="w3-bar-item w3-button w3-card-2 w3-color w3-animate-top">Order-detail</a>
</div>
<center>
		<form action="/saveProd">
			<h1 align="center">STOCK AVAILABILITY</h1><br><br><br>
		<table border="2" cellpadding="5" cellspacing="15" class="tab" style="font-size:70%">
			<!-- <tr>
				<td  colspan="2" style="font-size:150%">Grain Type:</td>
				<td align="center" style="font-size:150%"><input type="radio" name="grain" id="Rice">Rice
				<select name="rice" id="rice" style="font-size:70%; font-family:verdana;">
  					<option>Basmati</option>
  					<option>Brown</option>
  					<option>JeeraSar</option>
  					<option>Sharbati</option>
  				</select></td>
				<td align="center"style="font-size:150%"><input type="radio" name="grain" id="wheat">Wheat</td>
				<td align="center" style="font-size:150%"><input type="radio" name="grain" id="bajra">Bajra</td>
				<td align="center" style="font-size:150%"><input type="radio" name="grain" id="dal">Dal</td>
			</tr>
			<tr>
				<td>--------------------</td></tr><tr>
				<td>--------------------</td></tr>
			</tr>
			<tr>
				<td colspan="2"style="font-size:150%">Tax:</td>
				
				<td align="center" style="font-size:150%"><input type="radio" name="ask" id="yes">Yes</td>
				<td align="center" style="font-size:150%"><input type="radio" name="ask" id="no">No</td><td></td>

			</tr>
			<tr>
				<td>--------------------</td></tr><tr>
				<td>--------------------</td></tr>
			</tr>
			<tr>
				<td colspan="2" style="font-size:150%">Tax Name*:</td>
				<td align="center"><input type="text" name="tname" required></td>
				<td></td>
				<td align="center"><input type="number" required></td>
			</tr>
			<tr>
				<td>--------------------</td></tr><tr>
				<td>--------------------</td></tr>
			</tr>	
			<tr>
				<td colspan="2" style="font-size:150%">Item available:</td>
				<td align="center" style="font-size:150%"><input type="radio" name="ask1">Yes</td>
				<td align="center" style="font-size:150%"><input type="radio" name="ask1">No</td>
			</tr>
			<tr>
				<td>--------------------</td></tr><tr>
				<td>--------------------</td></tr>
			</tr>
			<tr>
				<td colspan="2" style="font-size:150%">Add price per quintal:</td>
				<td colspan="2" align="center"><input type="number" name="pp"></td>
			</tr>
			</tr>
		</table>
		<br><br>
		<br><br>
		<button style="font-size:120%" type="submit">SAVE</button> -->
		<tr>
			<td colspan="4" align="center" style="font-size:170%; font-weight:bold;">Details</td>
		</tr>
		<tr>
			<td style="font-size:140%">Grain Name:</td>
			<td class="dropdown">
			<select name="grain" id="grain" id="ddl" onchange="configureDropDownLists(this,document.getElementById('ddl2'))">
				<option value=""></option>
    		<option value="Wheat">Wheat</option>
    		<option value="Juvar">Juvar</option>
    		<option value="Bajra">Bajra</option>
    		<option value="Rice">Rice</option>
    		<option value="Makai">Makai</option>
  			</select>
			</td>
			<td style="font-size:140%">Type:</td>
			<td class="dropdown"><select id="ddl2"></select></td>
		</tr>
		<tr>
			<td style="font-size:140%">Quantity Available(in quintal):</td>
			<td colspan="4"><input type="text" name="qavail"></td>
		</tr>
		<tr>
			<td style="font-size:140%">Tax According:</td>
			<td><input type="text" name="taxnm" required></td>
			<td style="font-size:140%">Percent:</td>
			<td><input type="text" required></td>
		</tr>
		<tr>
			<td style="font-size:140%">Availability</td>
			<td style="font-size:140%" colspan="4"><input type="radio" name="yes_no" checked>Yes</input> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="yes_no">No</input></td>
		</tr>
		<tr>
			<td style="font-size:140%">Price Per Quintal</td>
			<td colspan="4"><input type="text" name="price"></td>
		</tr>
		<tr>
			<td style="font-size: 140%;">Upload Image:</td>
			<td colspan="4"><input type="file" id="myFile" name="filename"></td>
		</tr>
		<tr>
			<td style="font-size:140%" colspan="4" align="center"><button style="font-size:90%; width:100%; background-color: maroon; color:white ;">SAVE</button></td>
		</tr>
		</table>
	</form>
	</center>

	</body>
	<script type="text/javascript">
		function configureDropDownLists(ddl1,ddl2) {
    var rice = ['Basmati', 'Long', 'Small', 'Half'];

    switch (ddl1.value) {
        case 'Rice':
            ddl2.options.length = 0; 
        for (i = 0; i < rice.length; i++) {
            createOption(ddl2, rice[i], rice[i]);
            }
            break;
    }

}

    function createOption(ddl, text, value) {
        var opt = document.createElement('option');
        opt.value = value;
        opt.text = text;
        ddl.options.add(opt);
    }
	</script>
</html>
