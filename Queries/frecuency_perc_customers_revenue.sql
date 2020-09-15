SELECT
	freq AS Frequency,
	t1.currency AS currency,
	count(distinct t1.account_id) AS Sum_Customers,
	ROUND((count(distinct t1.account_id))/(SELECT COUNT(DISTINCT tt2.account_id) FROM csv_import_cohort tt2 WHERE tt2.currency = 'EUR'), 2) AS '% Customers',
	ROUND((SUM(t1.amount)/COUNT(t1.order_id)), 2) AS Average_Purchase_Value, 
	ROUND((COUNT(t1.order_id)/COUNT(DISTINCT t1.account_id)), 2) AS Average_Purchase_Frequency_Rate,
	ROUND((SUM(t1.amount)/COUNT(DISTINCT t1.account_id)), 2) AS Average_Revenue_x_User,
	SUM(t1.amount) AS total_revenue,
	ROUND(((SUM(t1.amount))/(SELECT SUM(tt3.amount) FROM csv_import_cohort tt3 where tt3.currency = 'EUR')), 3) AS '% Revenue'
from csv_import_cohort t1
INNER JOIN 
	(
		SELECT t1.account_id, COUNT(t1.account_id) AS freq
		FROM csv_import_cohort t1
		GROUP BY t1.account_id
	) t3 ON t1.account_id = t3.account_id
WHERE t1.currency = 'EUR'
GROUP BY freq, t1.currency;
