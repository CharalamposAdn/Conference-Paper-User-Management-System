package com.site;

//UserValidator.java

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UserValidator {

 public static boolean isValidUsername(String username) {
     // Username must start with a letter and have at least 5 characters,
     // which can be alphanumeric or '_'.
     String usernameRegex = "^[a-zA-Z]\\w{4,}$";
     Pattern pattern = Pattern.compile(usernameRegex);
     Matcher matcher = pattern.matcher(username);
     return matcher.matches();
 }

 public static boolean isValidPassword(String password) {
     // Password must have a size of at least 8 characters and comprise both
     // capital and lowercase letters, digits, and special characters.
     String passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
     Pattern pattern = Pattern.compile(passwordRegex);
     Matcher matcher = pattern.matcher(password);
     return matcher.matches();
 }
}
