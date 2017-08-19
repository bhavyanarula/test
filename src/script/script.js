function decrypt(msg, pass){
	load("D:/Workspaces/practice/PaymentGateway/WebContent/js/gibberish-aes.js"); 

	GibberishAES.size(128);
	print(msg);
	print(pass);
	return GibberishAES.dec(msg, pass);
	
}

function encrypt(msg, pass){
	load("D:/Workspaces/practice/PaymentGateway/WebContent/js/gibberish-aes.js"); 

	GibberishAES.size(128);
	print(msg);
	print(pass);
	return GibberishAES.enc(msg, pass);
	
}
function f_sha1(msg){
	load("D:/Workspaces/practice/PaymentGateway/src/script/sha1.js");
	return Sha1.hash(str);
}


