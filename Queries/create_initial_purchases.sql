DROP view if EXISTS qustodio.v_initial_purchases;
CREATE view qustodio.v_initial_purchases AS
(
	SELECT 
		t1.account_id, 
		t1.order_id, 
		t1.purchase_date, 
		t1.product, 
		t1.currency
	FROM qustodio.csv_import_cohort AS t1
	JOIN 
		(
	   	SELECT 
				account_id, 
				MIN(purchase_date) AS first_Date
		   FROM qustodio.csv_import_cohort
		   GROUP BY account_id
		) AS t2 ON t1.account_id = t2.account_id AND t1.purchase_date = t2.first_Date);

SELECT *
FROM initial_purchases t1
WHERE t1.order_id ='QrS7jxHqnE';

SELECT *
FROM initial_purchases
WHERE account_id = '401708';

SELECT *
FROM csv_import_cohort
WHERE account_id = '401708'
ORDER BY purchase_date;

SELECT *
FROM csv_import_cohort
WHERE order_id ='QrS7jxHqnE'
ORDER BY purchase_date;
