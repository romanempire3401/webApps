package view;

// classes imported from java.sql.*
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// classes in my project
import dbUtils.*;
import java.math.BigDecimal;

public class RequestsView {

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
            String sql = "SELECT Band.band_name, Requests.request_id, Instrument.instrument_name, "
                    + "Requests.request_qty FROM SP16_2308_tuf83083.Requests, "
                    + "SP16_2308_tuf83083.Band, SP16_2308_tuf83083.Instrument WHERE "
                    + "Requests.band_id = Band.band_id AND "
                    + "Requests.instrument_id = Instrument.instrument_id ORDER BY "
                    + "Band.band_name, Requests.request_id, Instrument.instrument_name, "
                    + "Requests.request_qty";
            stmt = dbc.getConn().prepareStatement(sql);
            results = stmt.executeQuery();
            //sb.append("executed the query " + "<br/><br/>");
            sb.append("<table class='");
            sb.append(cssTableClass);
            sb.append("'>");
            sb.append("<tr>");
            sb.append("<th style='text-align:right'>Band Name</th>");
            sb.append("<th style='text-align:left'>Request ID</th>");
            sb.append("<th style='text-align:left'>Instrument Name</th>");
            sb.append("<th style='text-align:right'>Request Qty</th>");
            sb.append("</tr>");
            while (results.next()) {
                sb.append("<tr>");
                sb.append(FormatUtils.formatStringTd(results.getObject("Band.band_name")));
                sb.append(FormatUtils.formatIntegerTd(results.getObject("Requests.request_id")));
                sb.append(FormatUtils.formatStringTd(results.getObject("Instrument.instrument_name")));
                sb.append(FormatUtils.formatIntegerTd(results.getObject("Requests.request_qty")));
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