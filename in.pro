<!DOCTYPE html>
<html manifest="tw.appcache">
<head>
	<script type="text/javascript">
		(function(document,navigator,standalone) {
			// prevents links from apps from oppening in mobile safari
			// this javascript must be the first script in your <head>
			if ((standalone in navigator) && navigator[standalone]) {
				var curnode, location=document.location, stop=/^(a|html)$/i;
				document.addEventListener('click', function(e) {
					curnode=e.target;
					while (!(stop).test(curnode.nodeName)) {
						curnode=curnode.parentNode;
					}
					// Condidions to do this only on links to your own app
					// if you want all links, use if('href' in curnode) instead.
					if('href' in curnode ) {
						e.preventDefault();
						location.href = curnode.href;
					}
				},false);
			}
		})(document,window.navigator,'standalone');
	</script>
<script type="text/javascript" src="http:///ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

var addToHomeConfig = {
	returningVisitor: true,		// Show the message only to returning visitors (ie: don't show it the first time)
	expire: 720					// Show the message only once every 12 hours
};


function hideAddressBar()
{
  if(!window.location.hash)
  {
      if(document.height < window.outerHeight)
      {
          document.body.style.height = (window.outerHeight + 50) + 'px';
      }

      setTimeout( function(){ window.scrollTo(0, 1); }, 50 );
  }
}
</script>
<link rel="stylesheet" href="add2home.css">
<script type="application/javascript" src="add2home.js"></script>
<link rel="shortcut icon" href="http://www.btrnt.com/favicon.ico?t="/>
<?php
  $browser = strpos($_SERVER['HTTP_USER_AGENT'],"iPhone");
    if ($browser == true){
    $browser = 'iphone';
  }
?>
<?php if($browser == 'iphone'){ ?>
  <title>Bot R Not</title>
  <meta name="format-detection" content="telephone=no">
 <meta name="viewport" id="vp" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" />
 <meta name="viewport" id="vp" content="initial-scale=1.0,user-scalable=no,maximum-scale=1" media="(device-height: 568px)" />
  <link rel="stylesheet" type="text/css" href="mobile.css" media="all">
  <meta name="apple-touch-fullscreen" content="yes" />
    <meta name="apple-mobile-web-app-capable" content="yes" /> <!-- you can comment this out to test to make sure it works-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />

<?php }else{ ?>
  <title>Bot R Not by @jamescampbell</title>
  <link rel="stylesheet" type="text/css" href="view.css" media="all">
<?php } ?>

<?php include 'mycon.php'?>
<?php include 'getpop.php'?>
<link rel="apple-touch-icon-precomposed" href="apple-touch-icon.png"/>
</head>
<body id="main_body" onload="hideAddressBar()">
	<div id="form_container">
	<form action="JavaScript:SubmitFrm()">
		<div id='titler'><h1><a href="http://www.btrnt.com">bot r not</a></h1></div>
			<div class="form_description">
				<p style="text-align:center">"know before you follow"</p>
			</div>						
			
			<ul style="text-align:center" >
			
					<li class="noback"id="li_1" >
						<label class="description" for="username"></label>
						
						<div>
	<input id="username" name="username" class="username" type="text" maxlength="16" size="30" value="" placeholder="twitter username to analyze" onblur="JavaScript:userCheck($('#username').val())" /> 
						</div>
						<!-- displays red or green text after onblur twitter user validation -->
						<div id="verified">verified - twitter user exists</div><div id="invalid">invalid - no twitter username found</div> 
					</li>
		
		
					<label for="code"></label> 
					<li id="txtCaptchaDiv" style="color:#F00;text-align:center;"></li><!-- this is where the script will place the generated code -->
		
					<li><input type="hidden" id="txtCaptcha" style="text-align:center;" /></li>
						<!-- this is where the script will place a copy of the code for validation: this is a hidden field -->
	
					<li class='noback'> <input type="text" name="txtInput" id="txtInput" size="30" placeholder="write code you see in red" /></li>
					<li id='noback'class="buttons">
						<input id="clicker" class="button" type="button" name="clicker" onmouseup="JavaScript:SubmitFrm()" value="Submit→" />
					</li>
			</ul>
	</form>
		<div id="footer">
			by <a href="http://www.twitter.com/jamescampbell">@jamescampbell</a> | <a href= "http://www.btrnt.com/about-	faq.html">about & FAQ</a> 
		</div>
		<div id="stats">
			<ul>
			<?php echo "<li>total in database: $totalcount</li>";
			echo "<li>worst rated user: <a href='http://www.btrnt.com/results.html?username=$topbot'>$topbot</a></li>";
			echo "<li>last checked: <a href='http://www.btrnt.com/results.html?username=$lasttenone'>$lasttenone</a></li>";?>
			</ul>
		</div>
	</div>
	
<script type="text/javascript">

	//Check if userexists onblur from user field
function userCheck(user){
	var userfix = 'name='+user;
	$.ajax({
	    type: "GET",
	    url: "check.php",
	    data: userfix,
	    cache: false,
	    datatype: 'html',
	    success: function(data){
	    if (data == '1') {
	       $('#verified').css({'display':'block'});
	       $('#invalid').css({'display':'none'});
	        //alert('user exists' + data);
	    } else {
	    	$('#invalid').css({'display':'block'});
	    	$('#verified').css({'display':'none'});
	        //alert('user does not exist' + data);
	    }
	    //alert(result);    
	    }
	});
	}


		// Remove the spaces from the entered and generated code
		function removeSpaces(string){
			return string.split(' ').join('');
		}

	function SubmitFrm(){
	    var username = $('#username').val();
		if (username == '') {alert ("username cannot be blank"); return false;} else { 
		var str1 = removeSpaces(document.getElementById('txtCaptcha').value);
		var str2 = removeSpaces(document.getElementById('txtInput').value);
		if (str1 == str2){
	        //var Searchtxt = document.getElementById("username").value;
	        window.location = "http://www.btrnt.com/results.html?username=" + username; } 
			else{
				alert("code failure, try again");
			}
	    }
	}
//Generates the captcha function   

    var a = Math.ceil(Math.random() * 9)+ '';

    var b = Math.ceil(Math.random() * 9)+ '';      
    var c = Math.ceil(Math.random() * 9)+ ''; 
    var d = Math.ceil(Math.random() * 9)+ ''; 
    var e = Math.ceil(Math.random() * 9)+ ''; 
    var f = Math.ceil(Math.random() * 9)+ ''; 
    var g = Math.ceil(Math.random() * 9)+ '';
    var h = Math.ceil(Math.random() * 9)+ '';

    var codelong = a + b + c + d + e + f + g + h;
    var code = a + f + c + h;
    document.getElementById("txtCaptcha").value = code;
    document.getElementById("txtCaptchaDiv").innerHTML = code; 
    //event listeners to do full screen mode
    window.addEventListener("load", function(){ if(!window.pageYOffset){ hideAddressBar(); } } );
window.addEventListener("orientationchange", hideAddressBar );
$('#username').mousedown(function() {
  $('#username').css({'placeholder':''});
});
$('#txtInput').mousedown(function() {
	$('#txtInput').css({'placeholder':''});	
})
</script>
	</body>
</html>