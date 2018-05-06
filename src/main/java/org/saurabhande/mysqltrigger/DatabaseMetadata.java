/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.saurabhande.mysqltrigger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.saurabhande.mysqlqueries.StaticSql;

/**
 *
 * @author LAPTOP
 */
public class DatabaseMetadata {

    Connection conn;

    public DatabaseMetadata(Connection conn) {
        this.conn = conn;
    }

    public List<String> showTables(String database) {
        List<String> showtables = new ArrayList<String>();
        try {
            PreparedStatement pst = conn.prepareStatement(StaticSql.showTables);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                showtables.add(rs.getString(1));
            }

            showtables.remove("audit_table");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return showtables;
    }

    public List<String> showDatabases() {
        List<String> showdatabases = new ArrayList<String>();
        try {
            PreparedStatement pst = conn.prepareStatement(StaticSql.database);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                showdatabases.add(rs.getString(1));
            }
            showdatabases.remove("information_schema");
            showdatabases.remove("performance_schema");
            showdatabases.remove("mysql");
            showdatabases.remove("test");
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return showdatabases;
    }

}
