// Declare the counting variables
var counter = 0;
var counters = 0;

//Everytime the user clicks, increase the counter by 1
function cookieClick() {
  counter++;
  updatecounter();
}

//This removes the decimals from the cookie number to make it look clean
//and then pushes the number to the the HTML and the tab title
function updatecounter() {
  counters = counter.toFixed(0);
  document.getElementById("cookies").innerHTML = "Current Vote Power: " + counters;
  document.title = "Vote Power: " + counters;
  pricecheck();
}


var exdays = 100;
var date = new Date();
//Save Function
function save() {
  date.setTime(date.getTime() + (exdays * 24 * 60 * 60 * 1000));
  var expires = "expires=" + date.toUTCString();
  document.cookie = "counter=" + counters + ";" + expires;
  document.cookie = "poller=" + poller + ";" + expires;
  document.cookie = "voter=" + voter + ";" + expires;
  document.cookie = "illuminati=" + illuminati + ";" + expires;
  document.cookie = "wall=" + wallcount + ";" + expires;
  console.log(document.cookie);
  return false
}
//Load Function, substring removes the "cookie=" part
function load() {
  var ca = document.cookie.split(';');
  console.log(ca);
  var c = ca[0];
  var cookiedata1 = parseInt(c.substring(8));
  var c2 = ca[1];
  cookiedata2 = parseInt(c2.substring(8));
  while (cookiedata2 > poller) {
    buyPoller();
  }
  var c3 = ca[2];
  cookiedata3 = parseInt(c3.substring(7));
  while (cookiedata3 > voter) {
    buyVoter();
  }
  var c4 = ca[3];
  cookiedata4 = parseInt(c4.substring(12));
  while (cookiedata4 > illuminati) {
    buyIlluminati();
  }
  var c5 = ca[4];
  cookiedata5 = parseInt(c5.substring(6));
  while (cookiedata5 > wallcount) {
    buildwall();
  }
  counter = cookiedata1;
  return false;
}


//Checks to see if the user can afford to buy anything, if not
//the button is disabled
function pricecheck() {
  if (counter < Pprice) {
    document.getElementById("buyPoller").disabled = true;
  } else {
    document.getElementById("buyPoller").disabled = false;
  }
  if (counter < Vprice) {
    document.getElementById("buyVoter").disabled = true;
  } else {
    document.getElementById("buyVoter").disabled = false;
  }
  if (counter < Iprice) {
    document.getElementById("buyIlluminati").disabled = true;
  } else {
    document.getElementById("buyIlluminati").disabled = false;
  }
  if (cps < wallprice) {
    document.getElementById("buildwall").disabled = true;
  } else {
    document.getElementById("buildwall").disabled = false;
  }
}


//All the math for buying stuff is here

var poller = 0;
var Pprice = 10;
var Pincome = 1;

function buyPoller() {
  counter = counter - Pprice;
  Pprice = Pprice * 1.5;
  Pprice = Pprice.toFixed(0);
  poller++;
  document.getElementById("pollercount").innerHTML = poller;
  document.getElementById("Pprice").innerHTML = Pprice;
  updatecounter();
  updatecps();
}

var voter = 0;
var Vprice = 50;
var Vincome = 5;

function buyVoter() {
  counter = counter - Vprice;
  Vprice = Vprice * 1.5;
  Vprice = Vprice.toFixed(0);
  voter++;
  document.getElementById("votercount").innerHTML = voter;
  document.getElementById("Vprice").innerHTML = Vprice;
  updatecounter();
  updatecps();
}

var illuminati = 0;
var Iprice = 200;
var Iincome = 20;

function buyIlluminati() {
  counter = counter - Iprice;
  Iprice = Iprice * 1.5;
  Iprice = Iprice.toFixed(0);
  illuminati++;
  document.getElementById("illuminaticount").innerHTML = illuminati;
  document.getElementById("Iprice").innerHTML = Iprice;
  updatecounter();
  updatecps();
}

//This is for the "wall"
var currentwall = "____________________________________________________________"
var wallprice = 0;
var wallcount = 0;
var walltotalprice = 0;

//We check if wallcount is even or odd, that way we can make an
//alternating pattern
function buildwall() {
  if (wallcount % 2) {
    currentwall = currentwall + "___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|_";
  } else {
    currentwall = currentwall + " _|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|";
  }
  wallcount++;
  walltotalprice = walltotalprice + wallprice;
  wallprice = 100;
  document.getElementById("walltext").innerText = currentwall;
  updatecps();
}

//This runs everything we need at startup
function foo() {
  trumpcomments();
  buildwall();
  printcps();
}
windowonload = foo();


//Show CPS
var cps = 0;
//This handles the math for the VPS
function updatecps() {
  cps = 0;
  cps = Pincome * poller;
  cps = cps + (Vincome * voter);
  cps = cps + (Iincome * illuminati);
  cps = cps - ((wallcount - 1) * 100);
  updatecounter();
}

//This outputs the VPS and adds it to the counter
//We do this seperately so we can call updatecps without
//Having it add extra cookies
function printcps() {
  counter = counter + (cps * 1);
  document.getElementById("cps").innerHTML = "Current VPS: " + cps;
  updatecounter();
  setTimeout(printcps, 1000)
}

//Trumps Comments
//Randomly Picks a number in the array every 10seconds
function trumpcomments() {
  var comments = [];
  comments[0] = "“An ‘extremely credible source’ has called my office and told me that Barack Obama’s birth certificate is a fraud”";
  comments[1] = "“You know, it really doesn’t matter what the media write as long as you're young, beautiful and got a piece of ass.”";
  comments[2] = "“The beauty of me is that I’m very rich”", "“I have never seen a thin person drinking Diet Coke.”";
  comments[3] = "“The other candidates — they went in, they didn’t know the air conditioning didn’t work. They sweated like dogs...How are they gonna beat ISIS? I don’t think it’s gonna happen.”";
  comments[4] = "“We need to build a wall, and it has to be built <b>quickly!</b>”";
  document.getElementById("comment").innerHTML = " " + comments[Math.round(Math.random() * 4)];
  setTimeout(trumpcomments, 10000);
}

// (c) Jos Spencer - CrazyAndroid101@Gmail.com
// Cookie Clicker Clone, but 100% coded from scratch by me
