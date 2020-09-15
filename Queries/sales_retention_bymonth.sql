DROP VIEW if EXISTS v_monthly_purchases_retentions;

CREATE VIEW v_monthly_purchases_retentions AS
(
SELECT 
	MONTH(t1.purchase_date) AS month_num, 
	MONTHNAME(purchase_date) AS month_sub,
	t1.product,
	t1.currency, 
	COUNT(DISTINCT t1.account_id) AS num_subs, 
	COUNT(DISTINCT tt2.order_id) AS num_retentions,
	((COUNT(DISTINCT t1.account_id))+(COUNT(DISTINCT tt2.order_id))) AS current_subs
FROM v_initial_purchases t1
LEFT JOIN v_retentions tt2 
	ON t1.product = tt2.product 
	AND MONTH(t1.purchase_date) = tt2.month_retained 
	AND t1.currency = tt2.currency
GROUP BY month_num, MONTHNAME(purchase_date), t1.product, t1.currency
ORDER BY month_num, product DESC
);

SELECT 
	t1.month_num, 
	t1.month_sub, 
	t1.currency,  
	t1.product,
	(t1.num_subs) as subs, 
	t1.num_subs*t3.amount AS subs_value,
	IFNULL((case
		when (t2.current_subs)!=(t1.num_retentions) then (t2.current_subs-t1.num_retentions)
		ELSE null END), 0)AS num_unsubs,
	IFNULL((case
		when (t2.current_subs)!=(t1.num_retentions) then (t2.current_subs-t1.num_retentions)
		ELSE null END )*(t3.amount), 0) AS value_unsubs,
	t1.num_retentions, 
	t1.current_subs, 
	(t1.num_retentions/IFNULL(t2.current_subs, 1)) AS '% retention'
FROM v_monthly_purchases_retentions t1
left outer JOIN v_monthly_purchases_retentions t2 
	ON t1.product = t2.product 
	AND t1.currency = t2.currency 
	AND t1.month_num = t2.month_num+1
JOIN v_prod_lookup t3 ON t1.product = t3.product
GROUP BY t1.month_num, t1.month_sub, t1.product, t1.currency
ORDER BY t1.product DESC,t1.currency, t1.month_num;




