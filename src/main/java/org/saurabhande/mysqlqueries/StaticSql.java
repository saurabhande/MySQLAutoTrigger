/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.saurabhande.mysqlqueries;

/**
 *
 * @author LAPTOP
 */
public class StaticSql {

    public static final String database = "show databases";
    public static final String showTables = "show tables";
    public static final String createAuditTable = " CREATE TABLE `audit_table` ("
            + "   `_id` int(11) NOT NULL AUTO_INCREMENT,"
            + "   `datetime` datetime DEFAULT NULL,"
            + "   `operation` varchar(50),"
            + "   `description` longtext,"
            + "   `summary` longtext,"
            + "   PRIMARY KEY (`_id`)"
            + " ) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1";
    public static final String dropTrigger(String triggerName){
        return "DROP TRIGGER IF EXISTS "+triggerName;
    }

    public static final String createTrigger(String database,String triggerName,String triggerOperation, String tableName, String ifElsecondition) {
        return " CREATE TRIGGER "+database+"."+ triggerName + " "//trigger name
                + " "+triggerOperation+" ON " + tableName + " for each row"//tableName
                + " BEGIN"
                + " "
                + " DECLARE description varchar(5000) default '';"
                + " DECLARE summary varchar(5000) default ''; "
                + " " + ifElsecondition + " "
                + " INSERT INTO audit_table (`datetime`, `operation`, `description`, `summary`)"
                + " values (now(),`"+triggerOperation+"`, description, summary); "
                + " END     ";
    }
}
