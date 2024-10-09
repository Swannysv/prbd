-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Director`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Director` (
  `idDirector` INT NOT NULL,
  `Dirname` VARCHAR(45) NULL,
  `facult` VARCHAR(10) NULL,
  PRIMARY KEY (`idDirector`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`group` (
  `idgroup` INT NOT NULL,
  `profil` VARCHAR(45) NULL,
  `napr` VARCHAR(45) NULL,
  PRIMARY KEY (`idgroup`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Student` (
  `idStudent` INT NOT NULL,
  `studname` VARCHAR(25) NULL,
  `Director_idDirector` INT NOT NULL,
  `group_idgroup` INT NOT NULL,
  PRIMARY KEY (`idStudent`),
  INDEX `fk_Student_Director1_idx` (`Director_idDirector` ASC) VISIBLE,
  INDEX `fk_Student_group1_idx` (`group_idgroup` ASC) VISIBLE,
  CONSTRAINT `fk_Student_Director1`
    FOREIGN KEY (`Director_idDirector`)
    REFERENCES `mydb`.`Director` (`idDirector`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_group1`
    FOREIGN KEY (`group_idgroup`)
    REFERENCES `mydb`.`group` (`idgroup`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`post` (
  `idpost` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idpost`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employee` (
  `idemployee` INT NOT NULL,
  `empname` VARCHAR(25) NULL,
  `employeecol` VARCHAR(45) NULL,
  `Director_idDirector` INT NOT NULL,
  `post_idpost` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idemployee`),
  INDEX `fk_employee_Director1_idx` (`Director_idDirector` ASC) VISIBLE,
  INDEX `fk_employee_post1_idx` (`post_idpost` ASC) VISIBLE,
  CONSTRAINT `fk_employee_Director1`
    FOREIGN KEY (`Director_idDirector`)
    REFERENCES `mydb`.`Director` (`idDirector`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_post1`
    FOREIGN KEY (`post_idpost`)
    REFERENCES `mydb`.`post` (`idpost`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Subject` (
  `idSubject` INT NOT NULL,
  `Subjecnamr` VARCHAR(45) NULL,
  `Subjinddi` VARCHAR(45) NULL,
  PRIMARY KEY (`idSubject`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Lessontype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Lessontype` (
  `idLessontype` INT NOT NULL,
  PRIMARY KEY (`idLessontype`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employee_has_Subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employee_has_Subject` (
  `employee_idemployee` INT NOT NULL,
  `Subject_idSubject` INT NOT NULL,
  PRIMARY KEY (`employee_idemployee`, `Subject_idSubject`),
  INDEX `fk_employee_has_Subject_Subject1_idx` (`Subject_idSubject` ASC) VISIBLE,
  INDEX `fk_employee_has_Subject_employee1_idx` (`employee_idemployee` ASC) VISIBLE,
  CONSTRAINT `fk_employee_has_Subject_employee1`
    FOREIGN KEY (`employee_idemployee`)
    REFERENCES `mydb`.`employee` (`idemployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_Subject_Subject1`
    FOREIGN KEY (`Subject_idSubject`)
    REFERENCES `mydb`.`Subject` (`idSubject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`scedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`scedule` (
  `group_idgroup` INT NOT NULL,
  `Subject_idSubject` INT NOT NULL,
  `Lessontype_idLessontype` INT NOT NULL,
  `week` INT NULL,
  `day` CHAR(3) NOT NULL,
  `day` CHAR(3) NOT NULL,
  `#room` CHAR(3) NULL,
  PRIMARY KEY (`group_idgroup`, `Subject_idSubject`, `day`, `day`),
  INDEX `fk_group_has_Subject_Subject1_idx` (`Subject_idSubject` ASC) VISIBLE,
  INDEX `fk_group_has_Subject_group1_idx` (`group_idgroup` ASC) VISIBLE,
  INDEX `fk_group_has_Subject_Lessontype1_idx` (`Lessontype_idLessontype` ASC) VISIBLE,
  CONSTRAINT `fk_group_has_Subject_group1`
    FOREIGN KEY (`group_idgroup`)
    REFERENCES `mydb`.`group` (`idgroup`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_has_Subject_Subject1`
    FOREIGN KEY (`Subject_idSubject`)
    REFERENCES `mydb`.`Subject` (`idSubject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_has_Subject_Lessontype1`
    FOREIGN KEY (`Lessontype_idLessontype`)
    REFERENCES `mydb`.`Lessontype` (`idLessontype`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vedomost`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vedomost` (
  `Student_idStudent` INT NOT NULL,
  `employee_idemployee` INT NOT NULL,
  `Subject_idSubject` INT NOT NULL,
  `date` DATE NOT NULL,
  `mark` VARCHAR(45) NULL,
  PRIMARY KEY (`Student_idStudent`, `employee_idemployee`, `date`),
  INDEX `fk_Student_has_employee_employee1_idx` (`employee_idemployee` ASC) VISIBLE,
  INDEX `fk_Student_has_employee_Student1_idx` (`Student_idStudent` ASC) VISIBLE,
  INDEX `fk_Student_has_employee_Subject1_idx` (`Subject_idSubject` ASC) VISIBLE,
  CONSTRAINT `fk_Student_has_employee_Student1`
    FOREIGN KEY (`Student_idStudent`)
    REFERENCES `mydb`.`Student` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_has_employee_employee1`
    FOREIGN KEY (`employee_idemployee`)
    REFERENCES `mydb`.`employee` (`idemployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_has_employee_Subject1`
    FOREIGN KEY (`Subject_idSubject`)
    REFERENCES `mydb`.`Subject` (`idSubject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
