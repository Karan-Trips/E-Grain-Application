<!DOCTYPE html>
<html>
  <head>
    <title>
      Delete Orders Page
    </title>
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
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
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
      </ul>
      <!-- we have used rightnav in order to design
        the seachbar properly by using CSS-->
      <div class="rightNav">
        <button class="btn"><a href="/">Logout</a></button>
      </div>
    </nav>
   <center>
<h1 style="color: red;">STOCK DATA</h1>
<br><br>
<table border="3" cellpadding="5" cellspacing="10" bgcolor="NavajoWhite" style="font-size:120%">
	<tr style="text-align:center;">
		<th>ID</th>
		<th>Grain</th>
		<th>Available</th>
		<th>Tax Name</th>
		<th>Price</th>
    <th>Delete stock</th>
	</tr>
	@foreach($products as $p)
	<tr style="text-align: center;">
		<td>{{$p->id}}</td>
		<td>{{$p->grain}}</td>
		<td>{{$p->available}}</td>
		<td>{{$p->taxname}}</td>
		<td>{{$p->price}}</td>
		<td><a href="delete/{{$p->id}}">Delete</a></td>
	</tr>
	@endforeach
</table>
</body>
</center>
</html>