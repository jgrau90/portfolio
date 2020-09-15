DROP VIEW if EXISTS qustodio.v_retentions;
create view qustodio.v_retentions AS
(
	SELECT 
			MONTH(tt0.purchase_date) AS month_retained,
			tt0.product as product,
			tt0.currency AS currency,	
			tt0.order_id AS order_id,
			tt0.account_id as account_id
	FROM qustodio.csv_import_cohort tt0
	WHERE tt0.order_id NOT IN
		(
			SELECT 
				t0.order_id
			FROM qustodio.v_initial_purchases t0
		)
	GROUP BY month_retained,product, currency, order_id
	);