SELECT
	(case
		when freq=12 then '12'
		when freq>=10 and freq<12   then '10_11'
		when freq>=8 and freq<10   then '8_9'
		when freq>=6 and freq<8   then '6_7'
		when freq>=4 and freq<6   then '4_5'
		when freq>=2 and freq<4   then '2_3'
		when freq= 1 then '1' END) AS Frequency_Band,
	count(distinct t1.account_id) AS Sum_Customers,
	ROUND((count(distinct t1.account_id))/(SELECT COUNT(DISTINCT tt2.account_id) FROM csv_import_cohort tt2), 2) AS '% Customers',
	ROUND((SUM(t1.amount)/COUNT(t1.order_id)), 2) AS Average_Purchase_Value, 
	ROUND((COUNT(t1.order_id)/COUNT(DISTINCT t1.account_id)), 2) AS Average_Purchase_Frequency_Rate,
	ROUND((SUM(t1.amount)/COUNT(DISTINCT t1.account_id)), 2) AS Average_Revenue_x_User,
	SUM(t1.amount) AS total_value,
	ROUND(((SUM(t1.amount))/(SELECT SUM(tt3.amount) FROM csv_import_cohort tt3)), 3) AS '% Value'
from csv_import_cohort t1
INNER JOIN 
	(
		SELECT t1.account_id, COUNT(t1.account_id) AS freq
		FROM csv_import_cohort t1
		GROUP BY t1.account_id
	) t3 ON t1.account_id = t3.account_id
GROUP BY (case
		when freq=12 then '12'
		when freq>=10 and freq<12   then '10_11'
		when freq>=8 and freq<10   then '8_9'
		when freq>=6 and freq<8   then '6_7'
		when freq>=4 and freq<6   then '4_5'
		when freq>=2 and freq<4   then '2_3'
		when freq= 1 then '1' END);
