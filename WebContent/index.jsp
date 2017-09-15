<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="./css/bootstrap.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-6">
			<div class="row">
			  <div class="col-md-4 col-xs-12 form-group">
			    <label for="email"></label>
			    <input type="text" name="ifsc" value="" />
			  </div>
		  	</div>
		  	<div class="row">
			  <div class="col-md-4 col-xs-12 form-group">
			  
			    <label for="email"></label>
			    <input type="text" name="destAccountNo" value="" />
			  </div>
		  	</div>
		  	<div class="row">
			  <div class="col-md-4 col-xs-12 form-group">
			    <label for="email"></label>
			    <input type="text" name="amount" value="" />
			  </div>
		  	</div>
		  	 <div class="row">
			  <div class="col-md-4 col-xs-12 form-group">
			    <label for="email"></label>
			    <button  name="" onclick="transact()" >Make Payment</button>
			  </div>
		  	</div><!--
		  	<div class="row">
			  <div class="col-md-4 col-xs-12 form-group">
			    <label for="email"></label>
			    <input type="text" name="" value="" />
			  </div>
		  	</div>
		  	<div class="row">
			  <div class="col-md-4 col-xs-12 form-group">
			    <label for="email"></label>
			    <input type="text" name="" value="" />
			  </div>
		  	</div> -->
		</div>
	</div>
</div>
</body>
<script src="//cdn.rawgit.com/chrisveness/crypto/4e93a4d/sha1.js"></script>

<script src="./js/gibberish-aes.js"></script>
<script>
	function transact(){
		var ifsc, accNum, amt, mTRef, tdate, pgMRef, hash;
		ifsc = $('#ifsc');
		accNum = $('#destAccountNo');
		//amt = Integer.parseInt($('#amount'));
		
		var str = 'bank_ifsc_code=ss|acc=123|amt=100|merchTransref=txn01|txndate=2014-11-11|paymentgatemerc_ref=merc001';
		
        var hash = Sha1.hash(str);
		
		var plSHAStr = str + '|hash='+hash;
		GibberishAES.size(128);
		var plPG = window.btoa(GibberishAES.enc(plSHAStr, "Q9fbkBF8au24C9wshGRW9ut8ecYpyXye5vhFLtHFdGjRg3a4HxPYRfQaKutZx5N4"));
		$.post( "transact", {'msg':plPG})
		  .done(function( data ) {
		    alert( "Data Loaded: " + data.resp);
		  });
		
		
	}
</script>
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
	<script>
	  (adsbygoogle = window.adsbygoogle || []).push({
	    google_ad_client: "ca-pub-1947886091160201",
	    enable_page_level_ads: true
	  });
	</script>
</html>
