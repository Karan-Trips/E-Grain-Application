<!DOCTYPE html>
<html>
	<head>
		<title>
			Orders Page
		</title>
		<meta http-equiv="refresh" content="3; URL=/home" />
 
	<style>
		* {
/* Here i made the margin and padding 0 */
margin: 0;

	padding: 20;
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
	background-image: url("https://w0.peakpx.com/wallpaper/569/626/HD-wallpaper-wheat-grain-nature-grain-sandy-colour-wheat.jpg");
  background-repeat: no-repeat;
  background-size: cover;
}
h1{
	color: red;
	margin: auto;
  	width: 50%;
  	border: 3px solid green;
  	padding: 100px;
}
label{
	font-size: 120%;
	font-family: cursive;
	color: red;
	text-align: center;
}
	</style>
	</head>
	<body bgcolor="whitesmoke">
		<!-- here in nav tag i have used two classes
			that is navbar and background-->
		<!-- each class declared in nav tag will be
			used to design the form using CSS-->
		<nav class="navbar background">
			<!-- we have used list tag that is ul
				to list the items-->
			<ul class="nav-list">
				<li><a href="/home">Home</a></li>
				<li><a href="/orders">Orders</a></li>
				<li><a href="/payments">Payments</a></li>
				<li><a href="/contactus">Contact us</a></li>
				<li><a href="/about">About</a></li>
				<li><a href="/Userdetail">User detail</a></li>
			</ul>
			<!-- we have used rightnav in order to design
				the seachbar properly by using CSS-->
			<div class="rightNav">
				<button class="btn"><a href="/">Logout</a></button>
			</div>
		</nav>
		<center>
			<h1>WELCOME TO GRAIN-E PORTAL
				<br>
			<label>HELLO</label>
			<label>Record Inserted to databse</label></h1>
		</center>
	</body>
	</html>