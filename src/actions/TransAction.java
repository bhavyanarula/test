package actions;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.security.MessageDigest;
import java.util.Base64;
import java.util.StringTokenizer;

import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

public class TransAction {

	private String msg;
	private ScriptEngine engine = new ScriptEngineManager().getEngineByName("nashorn");
	Invocable invocable;
	
	private String resp;
	public TransAction() throws FileNotFoundException, ScriptException{
		engine.eval(new FileReader("D:/Workspaces/practice/PaymentGateway/src/script/script.js"));
		invocable = (Invocable) engine;
	}
	public String transact() throws Exception{
		
		msg = new String(Base64.getDecoder().decode(msg));
		String reqMsg = (String)invocable.invokeFunction("decrypt", msg, "Q9fbkBF8au24C9wshGRW9ut8ecYpyXye5vhFLtHFdGjRg3a4HxPYRfQaKutZx5N4");
		
		
		String reqParams[] = new String[7];
		StringTokenizer st = new StringTokenizer(reqMsg, "|");
		int i = 0;
		String stringExHash = "";
		while(st.hasMoreTokens()){
			reqParams[i] = st.nextToken();
			if(i!=6)
				stringExHash+="|"+reqParams[i];
			i++;
		}
		
		String txn_success = "";
		//String hash = DigestUtils.shaHex(stringExHash.substring(1));
		
		MessageDigest mDigest = MessageDigest.getInstance("SHA1");
        byte[] result = mDigest.digest(stringExHash.getBytes());
        StringBuffer sb = new StringBuffer();
        for (int j = 0; j < result.length; j++) {
            sb.append(Integer.toString((result[j] & 0xff) + 0x100, 16).substring(1));
        }
         
        String hash =  sb.toString();
        
        
		if(hash.equals(reqParams[6].substring(6))){
			txn_success="success";
		} else {
			txn_success="failure";
		}
		
		
		resp = "txn_success="+txn_success;
		resp = (String)invocable.invokeFunction("encrypt", resp, "Q9fbkBF8au24C9wshGRW9ut8ecYpyXye5vhFLtHFdGjRg3a4HxPYRfQaKutZx5N4");
		
		return "success";
		
	}



	public String getMsg() {
		return msg;
	}



	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getResp() {
		return resp;
	}
	public void setResp(String resp) {
		this.resp = resp;
	}



}
