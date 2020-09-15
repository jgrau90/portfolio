SELECT
	t3.freq AS Frequency,
	t1.product,
	t1.currency AS currency,
	t1.account_id,
	t1.amount
from csv_import_cohort t1
INNER JOIN 
	(
		SELECT t2.account_id, COUNT(t2.account_id) AS freq
		FROM csv_import_cohort t2
		GROUP BY t2.account_id
	) t3 ON t1.account_id = t3.account_id
WHERE t3.freq IN (1,2,3)
GROUP BY t3.freq, t1.product, t1.currency, t1.account_id;