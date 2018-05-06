# MySQLAutoTrigger 0.1 version
MySQLAutoTrigger is a program which automatically create Triggers in MySql for Auditing purposes
on running CreateTriggers.java file.

We need to create trigger for assessment of Domain Area's Performance and Efficiency.
This audit provides data which can be used to analyse pattern for performance and compliances.

Just Run file CreateTrigger.java file to create
Make sure Mysql is running on port 3306.

After Running you can view Triggers by running below queries :
SELECT trigger_schema, trigger_name FROM information_schema.TRIGGERS;

(information_schema is default database in MySql which contains metadata of the other newly created database)
