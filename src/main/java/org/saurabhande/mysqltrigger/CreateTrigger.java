/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.saurabhande.mysqltrigger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.saurabhande.dbconnection.DataSource;
import org.saurabhande.mysqlqueries.StaticSql;

/**
 *
 * @author LAPTOP
 */
public class CreateTrigger {

    Connection conn;

    public CreateTrigger(Connection conn) {
        this.conn = conn;
    }

    public List<String> descTable(String tableName) {
        List<String> descTableList = new ArrayList<String>();
        try {
            PreparedStatement pst = conn.prepareStatement("desc " + tableName);
            System.out.println("" + pst.toString());
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                if (!rs.getString("Key").equals("PRI")) {
                    descTableList.add(rs.getString("FIELD"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return descTableList;
    }

    public boolean createTrigger(String triggerOperation,String database, List<String> tableList) throws SQLException {
        PreparedStatement pst = null;
        try {

            for (String table : tableList) {

                String tableIfElseQuery = getSubqueryForTrigger(table).toString();
                if (tableIfElseQuery.isEmpty()) {
                    continue;
                }
                String triggerName=table + "_trigger"+triggerOperation.replace(" ", "_");
                executeDropTrigger(triggerName);
                String triggerSQL = StaticSql.createTrigger(database, triggerName,
                        triggerOperation, table, tableIfElseQuery);
                pst = conn.prepareStatement(triggerSQL);
                System.out.println(" " + pst.toString());
                pst.execute();
            }
            /*if (pst.executeBatch().length >= 0) {
                return true;
            }*/

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pst != null) {
                pst.close();
            }
        }

        return false;
    }

    private StringBuilder getSubqueryForTrigger(String table) {

        List<String> columnList = descTable(table);
        StringBuilder stringBuilderIfElse = new StringBuilder();
        for (String column : columnList) {

            String ifelseStringBuilder = " IF  (CAST(NEW." + column + " as CHAR(5000))"
                    + " LIKE CAST(OLD." + column + " as CHAR(5000)) ) LIKE 0 "
                    + " THEN SET description=concat(description,\" " + column + " (\",OLD." + column + ",\" -> \",NEW." + column + ",\") , \"),"
                    + " summary = concat(summary,'" + column + "',',');"
                    + " END IF; ";

            stringBuilderIfElse.append(ifelseStringBuilder);
        }
        return stringBuilderIfElse;
    }

    public boolean executeUseDatabase(String databaseName) {
        PreparedStatement pst = null;
        try {
            pst = conn.prepareStatement(" use " + databaseName);
            if (pst.executeUpdate() >= 0) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CreateTrigger.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }

        return false;
    }

    public boolean executeCreateAuditTable(String database) {
        PreparedStatement pst = null;
        try {
            pst = conn.prepareStatement(" CREATE TABLE " + database + ".audit_table ("
                    + "   `_id` int(11) NOT NULL AUTO_INCREMENT,"
                    + "   `datetime` datetime DEFAULT NULL,"
                    + "   `description` longtext,"
                    + "   `summary` longtext,"
                    + "   PRIMARY KEY (`_id`)"
                    + " ) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 ");
            if (pst.executeUpdate() >= 0) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CreateTrigger.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }

        return false;
    }

    public boolean executeDropAuditTableIfExists(String database) {
        PreparedStatement pst = null;
        try {
            pst = conn.prepareStatement(" DROP TABLE IF EXISTS " + database + ".audit_table");
            if (pst.executeUpdate() >= 0) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CreateTrigger.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }

        return false;
    }

    public boolean executeDropTrigger(String triggerName) {
        PreparedStatement pst = null;
        try {
            String dropTriggerSql = StaticSql.dropTrigger( triggerName);
            pst = conn.prepareStatement(dropTriggerSql);
            System.out.println(" " + pst.toString());
            if (pst.executeUpdate() >= 0) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CreateTrigger.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }

        return false;
    }

    public static void main(String[] args) {
        String[] triggerOperations = {//"AFTER INSERT",
            //"BEFORE INSERT",
            "AFTER UPDATE",
            "BEFORE UPDATE",
            //"AFTER DELETE",
            //"BEFORE DELETE"
        };
        String dbname = "information_schema";
        try {
            System.out.println(" start ");
            Connection conn = DataSource.getInstance(dbname).getConnection();
            DatabaseMetadata databaseMetadata = new DatabaseMetadata(conn);
            List<String> databaseList = databaseMetadata.showDatabases();
            for (String database : databaseList) {
                conn = DataSource.getInstance(database).getConnection();
                CreateTrigger createTrigger = new CreateTrigger(conn);
                createTrigger.executeUseDatabase(database);
                createTrigger.executeDropAuditTableIfExists(database);
                createTrigger.executeCreateAuditTable(database);
                databaseMetadata = new DatabaseMetadata(conn);
                List<String> tableList = databaseMetadata.showTables(database);
                System.out.println(" Database " + database + " tableList " + tableList);
                for (String triggerOperation : triggerOperations) {
                    createTrigger.createTrigger(triggerOperation,database, tableList);
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
