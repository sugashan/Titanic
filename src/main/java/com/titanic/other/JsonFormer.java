package com.titanic.other;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.ObjectWriter;
import org.codehaus.jackson.map.SerializationConfig.Feature;
import org.json.JSONException;


public class JsonFormer {
	
	public static String form(GenericResult result) throws JSONException {
	    String resultJson = "{ status: false }";
            try {
                ObjectMapper mapper = new ObjectMapper();
                mapper.enable(Feature.INDENT_OUTPUT);
                mapper.configure(Feature.FAIL_ON_EMPTY_BEANS, false);
                ObjectWriter ow = mapper.writer().withDefaultPrettyPrinter();   
                resultJson = ow.writeValueAsString( result );
            }
            catch ( Exception e ) {
                e.printStackTrace();
            }
            
            return resultJson;
	}
}
