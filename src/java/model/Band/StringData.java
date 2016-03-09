package model.Band;

public class StringData {
 public String bandId = "";
 public String bandEmail = "";
 public String bandPass = "";
 public String bandName = "";
 public String dateFormed = "";
 public String bandDescription = "";
 public String errorMsg = ""; // this field is used, for example, to hold db error while attempting login.
 public String toString() { // this method is mostly just for debugging
 return "Band Id:" + this.bandId+
 ", Email Address:" + this.bandEmail+
 ", password:" + this.bandPass+
 ", Band Name:" + this.bandName+
 ", Date Formed:" + this.dateFormed+
 ", Band Description:" + this.bandDescription+
 ", errorMsg:"+this.errorMsg;
 }
}