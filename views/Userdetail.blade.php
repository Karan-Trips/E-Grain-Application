<!DOCTYPE html>
<html>
	<head>
		<title>
			Orders Page
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
body{
	background-color: #ffddf4;
}

	</style>
	</head>
	<body>
		<nav class="navbar background">
			<h3 align="center" style="align:center;">Order Page</h3>
    </nav>
		<!-- here in nav tag i have used two classes
			that is navbar and background-->
		<!-- each class declared in nav tag will be
			used to design the form using CSS-->
<div class="w3-sidebar w3-colors w3-bar-block w3-card" style="width:15%;">
  <h3 class="w3-bar-item">Menu</h3>
  <a href="/home" class="w3-bar-item w3-button w3-card-2 w3-color w3-animate-top">Home</a>
  <a href="/orders" class="w3-bar-item w3-button w3-card-2 w3-color w3-animate-top">Orders</a>
  <a href="/payments" class="w3-bar-item w3-button w3-card-2 w3-color w3-animate-top">Payments</a>
  <a href="/contactus" class="w3-bar-item w3-button w3-card-2 w3-color w3-animate-top">Terms and conditions</a>
  <a href="/" class="w3-bar-item w3-button w3-card-2 w3-color w3-animate-top">Logout</a>
  <a href="/Userdetail" class="w3-bar-item w3-button w3-card-2 w3-color w3-animate-top">User-Details</a>
</div>
<center>
	
				
&nbsp;
		</form>
		<br><br><br>
        
        <br><br><br><br><br><br>
    <h1>User Registered</h1>
    <table  border="2" style="font-size:150%; text-align: center;">
   
      <tr style="font-size:120%">
        <th>Name</th>
        <th>Email</th> 
        <th>Street</th> 
        <th>Landmark</th> 
        <th>pincode</th> 
		
      
        @foreach($ud as $ud)
     
      <tr>
      <td>{{$ud->fullname}}</td>
        <td>{{$ud->email}}</td>
        <td>{{$ud->street}}</td>
		<td>{{$ud->landmark}}</td>
		<td>{{$ud->pincode}}</td>
      

      </tr>
      @endforeach
    
    </table>
</center>
  </body>
</html>
