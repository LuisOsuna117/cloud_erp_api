USE `ironworks`;

DROP PROCEDURE IF EXISTS `getAllInventoryProducts`;

/* Returns all products in inventory */
CREATE PROCEDURE `getAllInventoryProducts`()
BEGIN
    SELECT * FROM `inventory`;
END