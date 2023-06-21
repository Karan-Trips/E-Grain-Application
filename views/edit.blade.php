<!DOCTYPE html>
<html>
  <head>
    <title>
      Edit Orders Page
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
  padding: 15px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
  text-align: center;
  font-size: 120%;
  font-weight: bold;
}

input[type=submit] {
  background-color: red;
  color: white;
  padding: 20px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: orangered;
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
<center>
<form action="/update/{id}" method="get">
  @foreach($products as $e)
  <input type="hidden" name="id" value="{{$e->id}}">
  <label>Enter updated grain name:</label>
  <input type="text" name="grain" value="{{$e->grain}}">
  <br>
  <label>Enter ordered Kgs:</label>
  <input type="text" name="orderkg" value="{{$e->available}}">
  <br>
  <label>Enter Tax Name:</label>
  <input type="text" name="taxname" value="{{$e->taxname}}">
  <br>
  <label>Enter Price:</label>
  <input type="text" name="price" value="{{$e->price}}">
  <br>
  <input type="submit" name="submit" style="font-size: 100%;">
  @endforeach
</form>

</center>
</body>
</center>
</html>





<!-- <form action="" method="get">
@foreach($products as $p)
  <label>Enter updated grain name:</label>
  <input type="text" name="grain" value="{{$p->grain}}">
  <br>
  <label>Enter ordered Kgs:</label>
  <input type="text" name="orderkg">
  <br>
  <label>Enter Price:</label>
  <input type="text" name="price">
  <br>
  <input type="submit" name="submit">
@endforeach
</form> -->