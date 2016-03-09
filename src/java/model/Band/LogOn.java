package model.Band;

import dbUtils.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LogOn {

    public static StringData find(DbConn dbc, String emailAddress, String userPwd) {
        StringData foundCust = new StringData(); // default constructor sets all fields to "" (empty string)
        try {
            String sql = "select Band.band_id, Band.band_email from SP16_2308_tuf83083.Band where email_address = ? and pwd = ?";
            PreparedStatement stmt = dbc.getConn().prepareStatement(sql);
            // System.out.println("*** statement prepared- no sql compile errors");
            // this puts the user's input (from variable emailAddress) into the 1st question mark of the sql statement above.
            stmt.setString(1, emailAddress);
            // System.out.println("*** email address substituted into the sql");
            // this puts the user's input (from variable userPwd) into the 2nd question mark of the sql statement above.
            stmt.setString(2, userPwd);
            // System.out.println("*** pwd substituted into the sql");
            ResultSet results = stmt.executeQuery();
            // System.out.println("*** query executed");
            // since the email address is required (in database) to be unique, we don't need a while loop like we did
            // for the display data lab. An "if" statement is better for this purpose.
            if (results.next()) {
                //System.out.println("*** record selected");
                foundCust.bandId = results.getObject("band_id").toString();
                foundCust.bandEmail = emailAddress; // we can take this from input parameter instead of db.
                foundCust.bandName = FormatUtils.formatStringTd(results.getObject("Band.band_email"));
                //System.out.println("*** 3 fields extracted from result set");
                return foundCust;
            } else {
                return null; // means customer not found with given credentials.
            }
        } catch (Exception e) {
            foundCust.errorMsg = "Exception thrown in Logon.find(): " + e.getMessage();
            return foundCust;
        }
    }
}
