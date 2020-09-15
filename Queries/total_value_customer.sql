SELECT 
	t1.account_id, 
	SUM(t1.amount) AS total_value
FROM csv_import_cohort t1
GROUP BY t1.account_id
ORDER BY SUM(t1.amount) desc;