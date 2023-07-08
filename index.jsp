<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.top-container {
  background-color:rgb(0,0,0,.5);
  padding: 30px;
  text-align: center;
}

.header {height: 80px;
  padding: 10px 16px;
  background:rgb(0,0,0,.7);
  color: #f1f1f1;
}

.content {
    background-image: url('Stockk.png');
    background-color:rgb(0,0,0,.1);
  padding: 16px;
}

.sticky {
  position: fixed;
  top: 0;
  width: 100%;
}

.sticky + .content {
  padding-top: 102px;
}
.header a {
  float: left;
  color: rgb(255, 255, 255);
  text-align: center;
  padding: 12px;
  text-decoration: none;
  font-size: 18px; 
  line-height: 25px;
  border-radius: 4px;
}

.header a.logo {
  font-size: 25px;
  font-weight: bold;
}

.header a:hover {
  background-color: #ddd;
  color: black;
}

.header a.active {
  background-color: dodgerblue;
  color: white;
}

.header-right {
  float: right;
}

@media screen and (max-width: 500px) {
  .header a {
    float: none;
    display: block;
    text-align: left;
  }
  
  .header-right {
    float: none;
  }
}
.column {
  float: left;
  width: 20%;
  padding: 0 30px;
}

/* Remove extra left and right margins, due to padding */
.row {margin: 0 -5px;}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive columns */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
    display: block;
    margin-bottom: 20px;
  }
}

/* Style the counter cards */
.card {
  box-shadow: 0 20px 40px 0 rgba(255, 250, 250, 0.2);
  padding: 16px;
  text-align: center;
  background-color:rgb(0,0,0,.2);
  height: 300px;
  border-radius: 30px;
  color:white;
}
img{
    border-radius: 20px;
}
</style>
</head>
<body>

<div class="top-container">
  <h1 style="color:orange;"><strong>STOCK MANAGEMENT SYSTEM</strong></h1>
  <p><h3 style="color:red;"><strong>UNDER THE GUIDENCE OF </strong></h3></p>
  <font style="font-size:30px;color:white;"><strong><p href="" class="typewrite" data-period="2000" data-type='["MR.DUSHMANTA PADHY"]'>
              
  </p></strong></font>
</div>

<div class="header" id="myHeader">
    <div class="header-center">
        <a  href="index.jsp"><button style="width:100px;height:50px;border-radius: 20px;background-color:rgb(73, 127, 197);color:white;">Home</button></a>
        <a href="Login.jsp"><button style="width:100px;height:50px;border-radius: 20px;background-color:rgb(227, 69, 30);color:white;">Login</button></a>
        <a href="singup.jsp"><button style="width:100px;height:50px;border-radius: 20px;background-color:rgb(0, 143, 64);color:white;">Sing up</button></a><br><br>
      </div>
</div>

<div class="content"><br><br>
    <p><font style="color:blue;font-size: 40px;"><h1><font size="8" href="" color="green" class="typewrite" data-period="2000" data-type='["Hii"]'></font>,WELL COME TO</h1></font></p>
    <p><font style="color:orange;font-size: 60px;"><h1>STOCK MANAGEMENT SYSTEM</h1></font></p>
   <br>
    <br>
 <div style="width:100%;margin: 0;height:500px;background-color: rgb(0,.0,0,.40);border-radius: 80px;">
   <center><font style="color:white;font-size: 40px;"><strong>Our Project Teams</strong></font></center><br><br><br>
   <div class="row">
    <div class="column">
      <div class="card">
        <h3>Student 1</h3>
       <br><br>
        <p>NAME:Swagat Kumar Dash</p>
           <p>ROLL no:RI 82321</p>
        <p>Redg no:40128/2020</p>
        <p>Class:BCA 3rd Year(2023)</p>
      </div>
    </div>
  
    <div class="column">
      <div class="card">
        <h3>Student 2</h3>
        <br><br>
        <p>NAME:Alok Nayak</p>
        <p>ROLL no:RI 76821</p>
        <p>Redg no:40972/2020</p>
        <p>Class:BCA 3rd Year(2023)</p>
      </div>
    </div>
    
    <div class="column">
      <div class="card">
        <h3>Student 3</h3>
        <br><br>
        <p>NAME:Sridhar Sahu</p>
           <p>ROLL no:RI 81821</p>
        <p>Redg no:41022/2020</p>
        <p>Class:BCA 3rd Year(2023)</p>
      </div>
    </div>
    
    <div class="column">
      <div class="card">
        <h3>Student 4</h3>
        <br><br>
        <p>NAME:Dhiren naidu</p>
           <p>ROLL no:10136/2019</p>
        <p>Redg no:RI 79821</p>
        <p>Class:BCA 3rd Year(2023)</p>
      </div>
    </div>
  </div>
 </div>
 <center><font style="color:white;"><strong>@Copy:Stock management System.com</strong></font></center>
  </div>
</div>

<script>
window.onscroll = function() {myFunction()};

var header = document.getElementById("myHeader");
var sticky = header.offsetTop;

function myFunction() {
  if (window.pageYOffset > sticky) {
    header.classList.add("sticky");
  } else {
    header.classList.remove("sticky");
  }
}
var TxtType = function(el, toRotate, period) {
        this.toRotate = toRotate;
        this.el = el;
        this.loopNum = 0;
        this.period = parseInt(period, 10) || 2000;
        this.txt = '';
        this.tick();
        this.isDeleting = false;
    };

   TxtType.prototype.tick = function() {
        var i = this.loopNum % this.toRotate.length;
        var fullTxt = this.toRotate[i];

        if (this.isDeleting) {
        this.txt = fullTxt.substring(0, this.txt.length - 1);
        } else {
        this.txt = fullTxt.substring(0, this.txt.length + 1);
        }

        this.el.innerHTML = '<span class="wrap">'+this.txt+'</span>';

        var that = this;
        var delta = 200 - Math.random() * 100;

        if (this.isDeleting) { delta /= 2; }

        if (!this.isDeleting && this.txt === fullTxt) {
        delta = this.period;
        this.isDeleting = true;
        } else if (this.isDeleting && this.txt === '') {
        this.isDeleting = false;
        this.loopNum++;
        delta = 500;
        }

        setTimeout(function() {
        that.tick();
        }, delta);
    };

    window.onload = function() {
        var elements = document.getElementsByClassName('typewrite');
        for (var i=0; i<elements.length; i++) {
            var toRotate = elements[i].getAttribute('data-type');
            var period = elements[i].getAttribute('data-period');
            if (toRotate) {
              new TxtType(elements[i], JSON.parse(toRotate), period);
            }
        }
        // INJECT CSS
        var css = document.createElement("style");
        css.type = "text/css";
        css.innerHTML = ".typewrite > .wrap { border-right: 0.08em solid #fff}";
        document.body.appendChild(css);
    }
</script>

</body>
</html>
