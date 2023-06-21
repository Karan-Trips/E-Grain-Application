<!DOCTYPE html>
<html>
  <head>
    <title>
      Contact-us Page
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
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
}

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  margin: 8px;
}

.about-section {
  padding: 50px;
  text-align: center;
  background-color: #474e5d;
  color: white;
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}

.button:hover {
  background-color: #555;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
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
<div class="about-section">
  <h1>About Us Page</h1>
  <p>Some text about who we are and what we do.</p>
</div>

<h2 style="text-align:center">Our Team</h2>
<div class="row">
  <div class="column">
    <div class="card">
      <img src="/assets/download.jpeg" alt="Jane" style="width:100%">
      <div class="container">
        <h2>Priyanka</h2>
        <p class="title">CEO & Founder</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>priyanka@example.com</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
      <img src="/assets/download.jpeg" alt="Mike" style="width:100%">
      <div class="container">
        <h2>Aditya</h2>
        <p class="title">Art Director</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>aditya@example.com</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>
  
  <div class="column">
    <div class="card">
      <img src="/assets/download.jpeg" alt="John" style="width:100%">
      <div class="container">
        <h2>Karan</h2>
        <p class="title">Designer</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>karan@example.com</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>
</div>
</body>
</html>