function validator(){
	
	// VALIDATION FOR CURENCY
	$.validator.addMethod("currency", function(value, element, param) {
	    var isParamString = typeof param === "string",
	        symbol = isParamString ? param : param[0],
	        soft = isParamString ? true : param[1],
	        regex;

	    symbol = symbol.replace(/,/g, "");
	    symbol = soft ? symbol + "]" : symbol + "]?";
	    regex = "^[" + symbol + "([1-9]{1}[0-9]{0,2}(\\,[0-9]{3})*(\\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\\.[0-9]{0,2})?|0(\\.[0-9]{0,2})?|(\\.[0-9]{1,2})?)$";
	    regex = new RegExp(regex);
	    return this.optional(element) || regex.test(value);

	}, "Please specify a valid currency");
	
	// SELECTBOX VALIDATION
	 $.validator.addMethod("valueNotEqualsToDefault", function(value, element, arg){
		  return arg !== value;
		 }, "Please Select One!.");
	 
	 
	 
	 $('.selectboxField').each(function () {
	      $(this).rules('add', {
	    	  
	    	  valueNotEqualsToDefault:"default",
	      });
	    });
	 
	 $('.currencyField').each(function () {
	      $(this).rules('add', {
	    	  required: true,
	    	  currency:true,
	    	  currency: ["$", false]
	      });
	    });
	 $('.textFiled, .uniqueTextFiled').each(function () {
	      $(this).rules('add', {
	          required: true,
	          minlength:3
	      });
	 });
	 $('.numberFiled').each(function () {
	      $(this).rules('add', {
	          required: true,
	          minlength:10,
	          maxlength:12
	      });
	    });
	 $('.passwordFiled').each(function () {
 	      $(this).rules('add', {
 	          required: true,
 	          minlength:5
 	      });
 	    });
	 
	 $('.emailFiled').each(function () {
	      $(this).rules('add', {
	    	  required: true,
	          email:true
	      });
	    });
	 $('.dateField').each(function () {
	      $(this).rules('add', {
	    	  required: true,
	          date:true
	      });
	    });
		
}

// CLEAR FORMS
function reset(){
	 $('.form-control input[type="text"]').val('');
}