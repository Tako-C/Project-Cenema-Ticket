-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema CinemaTicket
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CinemaTicket
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CinemaTicket` DEFAULT CHARACTER SET utf8 ;
USE `CinemaTicket` ;

-- -----------------------------------------------------
-- Table `CinemaTicket`.`Movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CinemaTicket`.`Movie` (
  `movieID` INT NOT NULL,
  `movieName` VARCHAR(100) NOT NULL,
  `movieGenre` VARCHAR(45) NOT NULL,
  `movieDirector` VARCHAR(50) NOT NULL,
  `studio` VARCHAR(50) NOT NULL,
  `duration` INT NOT NULL,
  `movieDescription` VARCHAR(200) NOT NULL,
  `language` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`movieID`),
  UNIQUE INDEX `movieID_UNIQUE` (`movieID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CinemaTicket`.`Poster`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CinemaTicket`.`Poster` (
  `posterID`VARCHAR(20) NOT NULL ,
  `posterName` VARCHAR(45) NOT NULL,
  `quantity` INT NOT NULL,
  `movieID` INT NOT NULL,
  PRIMARY KEY (`posterID`),
  UNIQUE INDEX `posterID_UNIQUE` (`posterID` ASC) VISIBLE,
  INDEX `fk_poster_movie1_idx` (`movieID` ASC) VISIBLE,
  CONSTRAINT `fk_poster_movie1`
    FOREIGN KEY (`movieID`)
    REFERENCES `CinemaTicket`.`Movie` (`movieID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CinemaTicket`.`Screen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CinemaTicket`.`Screen` (
  `screenID` INT NOT NULL,
  `screenName` VARCHAR(45) NOT NULL,
  `ScreenPrice` INT NOT NULL,
  PRIMARY KEY (`screenID`),
  UNIQUE INDEX `screenID_UNIQUE` (`screenID` ASC) VISIBLE,
  UNIQUE INDEX `screenName_UNIQUE` (`screenName` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CinemaTicket`.`Cinema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CinemaTicket`.`Cinema` (
  `cinemaNumber` INT NOT NULL,
  `cinemaName` VARCHAR(10) NOT NULL,
  `screenID` INT NOT NULL,
  UNIQUE INDEX `hallNumber_UNIQUE` (`cinemaNumber` ASC) VISIBLE,
  PRIMARY KEY (`cinemaNumber`),
  INDEX `fk_ halls_screen1_idx` (`screenID` ASC) VISIBLE,
  CONSTRAINT `fk_ halls_screen1`
    FOREIGN KEY (`screenID`)
    REFERENCES `CinemaTicket`.`Screen` (`screenID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CinemaTicket`.`ShowTime`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CinemaTicket`.`ShowTime` (
  `showTime_ID` INT NOT NULL,
  `showDate` DATE NOT NULL,
  `showTime` TIME NOT NULL,
  UNIQUE INDEX `showTime_ID_UNIQUE` (`showTime_ID` ASC) VISIBLE,
  PRIMARY KEY (`showTime_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CinemaTicket`.`MemberType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CinemaTicket`.`MemberType` (
  `MemberTypeID` INT NOT NULL,
  `MemberTypeName` VARCHAR(45) NOT NULL,
  `PromotionDiscount` INT NOT NULL,
  PRIMARY KEY (`MemberTypeID`),
  UNIQUE INDEX `Ticketclass_UNIQUE` (`MemberTypeID` ASC) VISIBLE,
  UNIQUE INDEX `MemberTypeName_UNIQUE` (`MemberTypeName` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CinemaTicket`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CinemaTicket`.`Staff` (
  `staffID` INT NOT NULL,
  `staffFirstname` VARCHAR(45) NOT NULL,
  `staffLastName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`staffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CinemaTicket`.`Member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CinemaTicket`.`Member` (
  `MemberID` INT NOT NULL,
  `MemberFirstName` VARCHAR(80) NOT NULL,
  `MemberLastName` VARCHAR(80) NOT NULL,
  `brithDate` DATE NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `MemberTypeID` INT NULL,
  `staffID` INT NOT NULL,
  UNIQUE INDEX `MemberID_UNIQUE` (`MemberID` ASC) VISIBLE,
  PRIMARY KEY (`MemberID`),
  INDEX `fk_Member_MPass1_idx` (`MemberTypeID` ASC) VISIBLE,
  INDEX `fk_Member_staffs1_idx` (`staffID` ASC) VISIBLE,
  CONSTRAINT `fk_Member_MPass1`
    FOREIGN KEY (`MemberTypeID`)
    REFERENCES `CinemaTicket`.`MemberType` (`MemberTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Member_staffs1`
    FOREIGN KEY (`staffID`)
    REFERENCES `CinemaTicket`.`Staff` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CinemaTicket`.`CinemaProgram`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CinemaTicket`.`CinemaProgram` (
  `cinemaProgramID` VARCHAR(45) NOT NULL,
  `movieID` INT NOT NULL,
  `showTime_ID` INT NOT NULL,
  `cinemaNumber` INT NOT NULL,
  PRIMARY KEY (`cinemaProgramID`),
  INDEX `fk_movie_has_showTime_showTime1_idx` (`showTime_ID` ASC) VISIBLE,
  INDEX `fk_movie_has_showTime_movie1_idx` (`movieID` ASC) VISIBLE,
  INDEX `fk_movie_has_showTime_Theater1_idx` (`cinemaNumber` ASC) VISIBLE,
  UNIQUE INDEX `ScheduleID_UNIQUE` (`cinemaProgramID` ASC) VISIBLE,
  CONSTRAINT `fk_movie_has_showTime_movie1`
    FOREIGN KEY (`movieID`)
    REFERENCES `CinemaTicket`.`Movie` (`movieID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_has_showTime_showTime1`
    FOREIGN KEY (`showTime_ID`)
    REFERENCES `CinemaTicket`.`ShowTime` (`showTime_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_has_showTime_Theater1`
    FOREIGN KEY (`cinemaNumber`)
    REFERENCES `CinemaTicket`.`Cinema` (`cinemaNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CinemaTicket`.`SeatType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CinemaTicket`.`SeatType` (
  `seatType` INT NOT NULL,
  `seatName` VARCHAR(45) NOT NULL,
  `seatPrice` INT NOT NULL,
  PRIMARY KEY (`seatType`),
  UNIQUE INDEX `seatType_UNIQUE` (`seatType` ASC) VISIBLE,
  UNIQUE INDEX `seatName_UNIQUE` (`seatName` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CinemaTicket`.`Seat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CinemaTicket`.`Seat` (
  `seatID` VARCHAR(5) NOT NULL,
  `seatNumber` VARCHAR(3) NOT NULL,
  `cinemaProgramID` VARCHAR(45) NOT NULL,
  `seatType` INT NOT NULL,
  `TotalPrice` INT NOT NULL,
  `reserve` TINYINT NOT NULL,
  UNIQUE INDEX `seatID_UNIQUE` (`seatID` ASC) VISIBLE,
  PRIMARY KEY (`seatID`),
  UNIQUE INDEX `seatNumber_UNIQUE` (`seatNumber` ASC) VISIBLE,
  INDEX `fk_seat_Schedule1_idx` (`cinemaProgramID` ASC) VISIBLE,
  INDEX `fk_seat_seatType1_idx` (`seatType` ASC) VISIBLE,
  CONSTRAINT `fk_seat_Schedule1`
    FOREIGN KEY (`cinemaProgramID`)
    REFERENCES `CinemaTicket`.`CinemaProgram` (`cinemaProgramID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_seat_seatType1`
    FOREIGN KEY (`seatType`)
    REFERENCES `CinemaTicket`.`SeatType` (`seatType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CinemaTicket`.`OrderTicket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CinemaTicket`.`OrderTicket` (
  `orderTicket_ID` INT NOT NULL,
  `orderDate` DATE NOT NULL,
  `orderTime` TIME NOT NULL,
  `MemberID` INT NULL,
  `seatID` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`orderTicket_ID`),
  UNIQUE INDEX `orderTicket_ID_UNIQUE` (`orderTicket_ID` ASC) VISIBLE,
  INDEX `fk_orderTicket_Member1_idx` (`MemberID` ASC) VISIBLE,
  INDEX `fk_orderTicket_seat1_idx` (`seatID` ASC) VISIBLE,
  UNIQUE INDEX `seatID_UNIQUE` (`seatID` ASC) VISIBLE,
  CONSTRAINT `fk_orderTicket_Member1`
    FOREIGN KEY (`MemberID`)
    REFERENCES `CinemaTicket`.`Member` (`MemberID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderTicket_seat1`
    FOREIGN KEY (`seatID`)
    REFERENCES `CinemaTicket`.`Seat` (`seatID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CinemaTicket`.`Chashier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CinemaTicket`.`Chashier` (
  `ChashierId` INT NOT NULL,
  PRIMARY KEY (`ChashierId`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
