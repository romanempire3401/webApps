package view;

// classes imported from java.sql.*
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// classes in my project
import dbUtils.*;
import java.math.BigDecimal;

public class BandView {

    /* This method returns a HTML table displaying all the records of the web_user table. 
     * cssClassForResultSetTable: the name of a CSS style that will be applied to the HTML table.
     *   (This style should be defined in the JSP page (header or style sheet referenced by the page).
     * dbc: an open database connection.
     */
    public static String listAllUsers(String cssTableClass, DbConn dbc) {

        // String type could have been used, but StringBuilder is more efficient 
        // in this case where we are just appending
        StringBuilder sb = new StringBuilder("");

        PreparedStatement stmt = null;
        ResultSet results = null;
        try {
            //sb.append("ready to create the statement & execute query " + "<br/>");
            String sql = "select user_role.role_name, Band.band_email, Band.band_name, "
                    + "Band.date_formed, Band.band_desc, Band.band_id, Band.role_id, "
                    + "Band.band_pass from SP16_2308_tuf83083.user_role, SP16_2308_tuf83083.Band "
                    + "where Band.role_id = user_role.role_id order by "
                    + "user_role.role_name, Band.band_email, Band.band_name, Band.date_formed, "
                    + "Band.band_desc, Band.band_id, Band.band_pass";
            stmt = dbc.getConn().prepareStatement(sql);
            results = stmt.executeQuery();
            //sb.append("executed the query " + "<br/><br/>");
            sb.append("<table class='");
            sb.append(cssTableClass);
            sb.append("'>");
            sb.append("<tr>");
            sb.append("<th style='text-align:right'>User Role</th>");
            sb.append("<th style='text-align:left'>Band e-mail</th>");
            sb.append("<th style='text-align:left'>Band Name</th>");
            sb.append("<th style='text-align:right'>Date Formed</th>");
            sb.append("<th style='text-align:center'>Band Description</th>");
            sb.append("<th style='text-align:center'>Band ID</th>");
            sb.append("<th style='text-align:center'>Band Pass</th>");
            sb.append("</tr>");
            while (results.next()) {
                sb.append("<tr>");
                sb.append(FormatUtils.formatStringTd(results.getObject("user_role.role_name")));
                sb.append(FormatUtils.formatStringTd(results.getObject("Band.band_email")));
                sb.append(FormatUtils.formatStringTd(results.getObject("Band.band_name")));
                sb.append(FormatUtils.formatDateTd(results.getObject("Band.date_formed")));
                sb.append(FormatUtils.formatStringTd(results.getObject("Band.band_desc")));
                sb.append(FormatUtils.formatIntegerTd(results.getObject("Band.band_id")));
                sb.append(FormatUtils.formatStringTd(results.getObject("Band.band_pass")));
                sb.append("</tr>\n");
            }
            sb.append("</table>");
            results.close();
            stmt.close();
            return sb.toString();
        } catch (Exception e) {
            return "Exception thrown in WebUserSql.listAllUsers(): " + e.getMessage()
                    + "<br/> partial output: <br/>" + sb.toString();
        }
    }
}