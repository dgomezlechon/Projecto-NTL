-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema etlproject
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema etlproject
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `etlproject` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `etlproject` ;

-- -----------------------------------------------------
-- Table `etlproject`.`events_apple`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `etlproject`.`events_apple` (
  `Date` TEXT NOT NULL,
  `Price_change` DOUBLE NULL DEFAULT NULL,
  `news_link` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`Date`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `etlproject`.`apple_earnings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `etlproject`.`apple_earnings` (
  `Announcement Date` TEXT NOT NULL,
  `Fiscal Quarter End` TEXT NULL DEFAULT NULL,
  `Estimated EPS` DOUBLE NULL DEFAULT NULL,
  `Actual EPS` DOUBLE NULL DEFAULT NULL,
  `events_apple_Date` TEXT NOT NULL,
  PRIMARY KEY (`Announcement Date`, `events_apple_Date`),
  INDEX `fk_apple_earnings_events_apple1_idx` (`events_apple_Date` ASC) VISIBLE,
  CONSTRAINT `fk_apple_earnings_events_apple1`
    FOREIGN KEY (`events_apple_Date`)
    REFERENCES `etlproject`.`events_apple` (`Date`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `etlproject`.`apple_price`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `etlproject`.`apple_price` (
  `Date` TEXT NOT NULL,
  `Open` DOUBLE NULL DEFAULT NULL,
  `High` DOUBLE NULL DEFAULT NULL,
  `Low` DOUBLE NULL DEFAULT NULL,
  `Close` DOUBLE NULL DEFAULT NULL,
  `Adj Close` DOUBLE NULL DEFAULT NULL,
  `Volume` DOUBLE NULL DEFAULT NULL,
  `Price_change` DOUBLE NULL DEFAULT NULL,
  `apple_earnings_Announcement Date` TEXT NOT NULL,
  PRIMARY KEY (`Date`, `apple_earnings_Announcement Date`),
  INDEX `fk_apple_price_apple_earnings1_idx` (`apple_earnings_Announcement Date` ASC) VISIBLE,
  CONSTRAINT `fk_apple_price_apple_earnings1`
    FOREIGN KEY (`apple_earnings_Announcement Date`)
    REFERENCES `etlproject`.`apple_earnings` (`Announcement Date`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `etlproject`.`events_microsoft`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `etlproject`.`events_microsoft` (
  `Date` TEXT NOT NULL,
  `Price_change` DOUBLE NULL DEFAULT NULL,
  `news_link` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`Date`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `etlproject`.`events_twitter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `etlproject`.`events_twitter` (
  `Date` TEXT NOT NULL,
  `Price_change` DOUBLE NULL DEFAULT NULL,
  `news_link` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`Date`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `etlproject`.`microsoft_earnings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `etlproject`.`microsoft_earnings` (
  `Announcement Date` TEXT NOT NULL,
  `Fiscal Quarter End` TEXT NULL DEFAULT NULL,
  `Estimated EPS` DOUBLE NULL DEFAULT NULL,
  `Actual EPS` DOUBLE NULL DEFAULT NULL,
  `events_microsoft_Date` TEXT NOT NULL,
  PRIMARY KEY (`Announcement Date`, `events_microsoft_Date`),
  INDEX `fk_microsoft_earnings_events_microsoft1_idx` (`events_microsoft_Date` ASC) VISIBLE,
  CONSTRAINT `fk_microsoft_earnings_events_microsoft1`
    FOREIGN KEY (`events_microsoft_Date`)
    REFERENCES `etlproject`.`events_microsoft` (`Date`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `etlproject`.`microsoft_price`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `etlproject`.`microsoft_price` (
  `Date` TEXT NOT NULL,
  `Open` DOUBLE NULL DEFAULT NULL,
  `High` DOUBLE NULL DEFAULT NULL,
  `Low` DOUBLE NULL DEFAULT NULL,
  `Close` DOUBLE NULL DEFAULT NULL,
  `Adj Close` DOUBLE NULL DEFAULT NULL,
  `Volume` DOUBLE NULL DEFAULT NULL,
  `Price_change` DOUBLE NULL DEFAULT NULL,
  `microsoft_earnings_Announcement Date` TEXT NOT NULL,
  PRIMARY KEY (`Date`, `microsoft_earnings_Announcement Date`),
  INDEX `fk_microsoft_price_microsoft_earnings_idx` (`microsoft_earnings_Announcement Date` ASC) VISIBLE,
  CONSTRAINT `fk_microsoft_price_microsoft_earnings`
    FOREIGN KEY (`microsoft_earnings_Announcement Date`)
    REFERENCES `etlproject`.`microsoft_earnings` (`Announcement Date`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `etlproject`.`twitter_earnings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `etlproject`.`twitter_earnings` (
  `Announcement Date` TEXT NOT NULL,
  `Fiscal Quarter End` TEXT NULL DEFAULT NULL,
  `Estimated EPS` DOUBLE NULL DEFAULT NULL,
  `Actual EPS` DOUBLE NULL DEFAULT NULL,
  `events_twitter_Date` TEXT NOT NULL,
  PRIMARY KEY (`Announcement Date`, `events_twitter_Date`),
  INDEX `fk_twitter_earnings_events_twitter1_idx` (`events_twitter_Date` ASC) VISIBLE,
  CONSTRAINT `fk_twitter_earnings_events_twitter1`
    FOREIGN KEY (`events_twitter_Date`)
    REFERENCES `etlproject`.`events_twitter` (`Date`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `etlproject`.`twitter_price`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `etlproject`.`twitter_price` (
  `Date` TEXT NOT NULL,
  `Open` DOUBLE NULL DEFAULT NULL,
  `High` DOUBLE NULL DEFAULT NULL,
  `Low` DOUBLE NULL DEFAULT NULL,
  `Close` DOUBLE NULL DEFAULT NULL,
  `Adj Close` DOUBLE NULL DEFAULT NULL,
  `Volume` DOUBLE NULL DEFAULT NULL,
  `Price_change` DOUBLE NULL DEFAULT NULL,
  `twitter_earnings_Announcement Date` TEXT NOT NULL,
  PRIMARY KEY (`Date`, `twitter_earnings_Announcement Date`),
  INDEX `fk_twitter_price_twitter_earnings1_idx` (`twitter_earnings_Announcement Date` ASC) VISIBLE,
  CONSTRAINT `fk_twitter_price_twitter_earnings1`
    FOREIGN KEY (`twitter_earnings_Announcement Date`)
    REFERENCES `etlproject`.`twitter_earnings` (`Announcement Date`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
