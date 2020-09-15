create database qustodio;
use qustodio;
drop table if exists qustodio.csv_import_cohort;
CREATE TABLE `csv_import_cohort` (
	`order_id` VARCHAR(30) NOT NULL COLLATE 'utf8_unicode_ci',
	`account_id` VARCHAR(15) NOT NULL COLLATE 'utf8_unicode_ci',
	`purchase_date` DATE NOT NULL,
	`product` VARCHAR(15) NOT NULL COLLATE 'utf8_unicode_ci',
	`amount` DECIMAL(10,2) NOT NULL,
	`currency` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8_unicode_ci',
	PRIMARY KEY (`order_id`) USING BTREE,
	INDEX `account_id` (`account_id`) USING BTREE,
	INDEX `purchase_date` (`purchase_date`) USING BTREE,
	INDEX `product` (`product`) USING BTREE,
	INDEX `currency` (`currency`) USING BTREE
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB
;

    
SELECT *
FROM qustodio.csv_import_cohort;


	
    