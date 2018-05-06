/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.saurabhande.dbconnection;

import java.beans.PropertyVetoException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;
import org.apache.commons.dbcp2.BasicDataSource;

/**
 *
 * @author LAPTOP
 */
public class DataSource {

    private static Map<String,DataSource> dataSourceList=new LinkedHashMap<String,DataSource>();
    private BasicDataSource ds;

    private DataSource(String dbname) throws IOException, SQLException, PropertyVetoException {
        ds = new BasicDataSource();
        ds.setDriverClassName("com.mysql.jdbc.Driver");
        ds.setUsername("root");
        ds.setPassword("");
        ds.setUrl("jdbc:mysql://localhost:3306/"+dbname);

        // the settings below are optional -- dbcp can work with defaults
        ds.setMinIdle(1);
        ds.setMaxIdle(3);
        ds.setMaxOpenPreparedStatements(50);

    }

    public static DataSource getInstance(String dbname) throws IOException, SQLException, PropertyVetoException {
        if (!dataSourceList.containsKey(dbname) ) {
            DataSource datasource = new DataSource(dbname);
            dataSourceList.put(dbname,datasource);
            return datasource;
        }else {
            return dataSourceList.get(dbname);
        }
    }

    public Connection getConnection() throws SQLException {
        return this.ds.getConnection();
    }

}
