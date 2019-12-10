-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`restaurant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`menu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `restaurant_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_menu_restaurant_idx` (`restaurant_id` ASC),
  CONSTRAINT `fk_menu_restaurant`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `mydb`.`restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`dish`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`dish` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` DECIMAL NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`dish_has_menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`dish_has_menu` (
  `menu_id` INT NOT NULL,
  `dish_id` INT NOT NULL,
  PRIMARY KEY (`menu_id`, `dish_id`),
  INDEX `fk_dish_has_menu_menu1_idx` (`menu_id` ASC),
  INDEX `fk_dish_has_menu_dish1_idx` (`dish_id` ASC),
  CONSTRAINT `fk_dish_has_menu_dish1`
    FOREIGN KEY (`dish_id`)
    REFERENCES `mydb`.`dish` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dish_has_menu_menu1`
    FOREIGN KEY (`menu_id`)
    REFERENCES `mydb`.`menu` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
