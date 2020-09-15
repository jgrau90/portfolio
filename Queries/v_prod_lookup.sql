create v_prod_lookup AS 
	(
		SELECT 
			t1.product AS product, 
			t1.amount AS amount
		FROM csv_import_cohort t1
		GROUP BY t1.product
	);