CREATE VIEW v_revenue_prod_currency AS (
SELECT 
	MONTH(t1.purchase_date) AS month_num, 
	MONTHNAME(t1.purchase_date) AS month_name, 
	t1.product AS product, 
	t1.currency AS currency, 
	SUM(t1.amount) AS amount
FROM csv_import_cohort t1
GROUP BY MONTH(t1.purchase_date), MONTHNAME(t1.purchase_date),t1.product, t1.currency
ORDER BY MONTH(t1.purchase_date), MONTHNAME(t1.purchase_date), t1.product DESC, t1.currency);