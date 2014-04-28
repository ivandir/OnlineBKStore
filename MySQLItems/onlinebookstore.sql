SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';


-- -----------------------------------------------------
-- Table `onlinebookstore`.`creator`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `onlinebookstore`.`creator` (
  `name` VARCHAR(45) NOT NULL ,
  `address` VARCHAR(45) NULL ,
  `URL` VARCHAR(45) NULL ,
  PRIMARY KEY (`name`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlinebookstore`.`publisher`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `onlinebookstore`.`publisher` (
  `name` VARCHAR(45) NOT NULL ,
  `address` VARCHAR(45) NULL ,
  `phone` DECIMAL(9,0)  NULL ,
  `URL` VARCHAR(45) NULL ,
  PRIMARY KEY (`name`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlinebookstore`.`customer`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `onlinebookstore`.`customer` (
  `email` VARCHAR(45) NOT NULL ,
  `name` VARCHAR(45) NULL ,
  `address` VARCHAR(45) NULL ,
  `phone` DECIMAL(9,0)  NULL ,
  PRIMARY KEY (`email`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlinebookstore`.`book`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `onlinebookstore`.`book` (
  `ID` VARCHAR(10) NOT NULL ,
  `pages` INT NULL ,
  `weight` VARCHAR(15) NULL ,
  `price` DECIMAL(6,2)  NULL ,
  PRIMARY KEY (`ID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlinebookstore`.`warehouse`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `onlinebookstore`.`warehouse` (
  `code` VARCHAR(5) NOT NULL ,
  `address` VARCHAR(45) NULL ,
  `phone` VARCHAR(45) NULL ,
  PRIMARY KEY (`code`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlinebookstore`.`item`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `onlinebookstore`.`item` (
  `ID` VARCHAR(10) NOT NULL ,
  `year` YEAR NULL ,
  `language` VARCHAR(25) NULL ,
  `title` VARCHAR(100) NULL ,
  PRIMARY KEY (`ID`) ,
  CONSTRAINT `fk_table1_book1`
    FOREIGN KEY (`ID` )
    REFERENCES `onlinebookstore`.`book` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlinebookstore`.`blueraydisk`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `onlinebookstore`.`blueraydisk` (
  `ID` VARCHAR(10) NOT NULL ,
  `disks` INT NULL ,
  `region` VARCHAR(15) NULL ,
  `duration` TIME NULL ,
  `price` DECIMAL(6,2)  NULL ,
  PRIMARY KEY (`ID`) ,
  INDEX `fk_BlueRayDisk_Item1` (`ID` ASC) ,
  CONSTRAINT `fk_BlueRayDisk_Item1`
    FOREIGN KEY (`ID` )
    REFERENCES `onlinebookstore`.`item` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlinebookstore`.`downloadable_video`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `onlinebookstore`.`downloadable_video` (
  `ID` VARCHAR(10) NOT NULL ,
  `size` INT NULL ,
  `region` VARCHAR(15) NULL ,
  `duration` TIME NULL ,
  `format` VARCHAR(15) NULL ,
  `price` DECIMAL(6,2)  NULL ,
  PRIMARY KEY (`ID`) ,
  INDEX `fk_BlueRayDisk_Item1` (`ID` ASC) ,
  CONSTRAINT `fk_BlueRayDisk_Item10`
    FOREIGN KEY (`ID` )
    REFERENCES `onlinebookstore`.`item` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlinebookstore`.`created_by`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `onlinebookstore`.`created_by` (
  `name` VARCHAR(45) NOT NULL ,
  `ID` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`name`, `ID`) ,
  INDEX `fk_author_has_Item_Item1` (`ID` ASC) ,
  CONSTRAINT `fk_author_has_Item_author1`
    FOREIGN KEY (`name` )
    REFERENCES `onlinebookstore`.`creator` (`name` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_author_has_Item_Item1`
    FOREIGN KEY (`ID` )
    REFERENCES `onlinebookstore`.`item` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlinebookstore`.`published_by`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `onlinebookstore`.`published_by` (
  `ID` VARCHAR(10) NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`ID`, `name`) ,
  INDEX `fk_Item_has_publisher_publisher1` (`name` ASC) ,
  CONSTRAINT `fk_Item_has_publisher_Item1`
    FOREIGN KEY (`ID` )
    REFERENCES `onlinebookstore`.`item` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Item_has_publisher_publisher1`
    FOREIGN KEY (`name` )
    REFERENCES `onlinebookstore`.`publisher` (`name` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlinebookstore`.`stocks`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `onlinebookstore`.`stocks` (
  `ID` VARCHAR(10) NOT NULL ,
  `code` VARCHAR(5) NOT NULL ,
  `number` INT NULL ,
  PRIMARY KEY (`ID`, `code`) ,
  INDEX `fk_Item_has_warehouse_warehouse1` (`code` ASC) ,
  CONSTRAINT `fk_Item_has_warehouse_Item1`
    FOREIGN KEY (`ID` )
    REFERENCES `onlinebookstore`.`item` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Item_has_warehouse_warehouse1`
    FOREIGN KEY (`code` )
    REFERENCES `onlinebookstore`.`warehouse` (`code` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlinebookstore`.`shopping_basket`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `onlinebookstore`.`shopping_basket` (
  `basket_id` VARCHAR(45) NOT NULL ,
  `ID` VARCHAR(10) NOT NULL ,
  `number` INT NULL ,
  PRIMARY KEY (`basket_id`, `ID`) ,
  INDEX `fk_shopping_basket_has_item_item1` (`ID` ASC) ,
  CONSTRAINT `fk_shopping_basket_has_item_item1`
    FOREIGN KEY (`ID` )
    REFERENCES `onlinebookstore`.`item` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
