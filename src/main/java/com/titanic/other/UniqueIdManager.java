package com.titanic.other;

import java.security.SecureRandom;

// UNIQUE ID & CODE GENERATE PURPOSE
public class UniqueIdManager {
	
	// GENERATE RANDOM
	public static String getRandom(int length) {
		SecureRandom random = new SecureRandom();
		long longToken = Math.abs(random.nextLong());
		return Long.toString(longToken, 16).substring(length);
	}
	
	// GENERATE UNIQUE CODE
	public static String getUniqueCode(String prefix) {
		return "T-" + prefix + "-" + getRandom(4);
	}

}
