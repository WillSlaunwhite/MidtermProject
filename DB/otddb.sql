-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema otddb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `otddb` ;

-- -----------------------------------------------------
-- Schema otddb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `otddb` DEFAULT CHARACTER SET utf8 ;
USE `otddb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NOT NULL,
  `role` VARCHAR(45) NULL,
  `create_date` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `activity_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location` ;

CREATE TABLE IF NOT EXISTS `location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(100) NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `zip_code` VARCHAR(5) NULL,
  `latitude` DOUBLE NULL,
  `longitude` DOUBLE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `activity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `activity` ;

CREATE TABLE IF NOT EXISTS `activity` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `pro_tips` TEXT NOT NULL,
  `elevation_gain_feet` INT NULL,
  `route` VARCHAR(45) NULL,
  `handicap_accessible` TINYINT NULL,
  `dogs_allowed` TINYINT NULL,
  `parking` TINYINT NULL,
  `description` TEXT NOT NULL,
  `profile_url` VARCHAR(1000) NULL,
  `category_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  `difficulty` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_activity_category1_idx` (`category_id` ASC),
  INDEX `fk_activity_location1_idx` (`location_id` ASC),
  CONSTRAINT `fk_activity_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activity_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `image` ;

CREATE TABLE IF NOT EXISTS `image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(10000) NOT NULL,
  `user_id` INT NOT NULL,
  `activity_id` INT NOT NULL,
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_image_user1_idx` (`user_id` ASC),
  INDEX `fk_image_activity1_idx` (`activity_id` ASC),
  CONSTRAINT `fk_image_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_image_activity1`
    FOREIGN KEY (`activity_id`)
    REFERENCES `activity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` TEXT NOT NULL,
  `user_id` INT NOT NULL,
  `activity_id` INT NOT NULL,
  `create_date` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_comment_activity1_idx` (`activity_id` ASC),
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_activity1`
    FOREIGN KEY (`activity_id`)
    REFERENCES `activity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rating` ;

CREATE TABLE IF NOT EXISTS `rating` (
  `user_id` INT NOT NULL,
  `activity_id` INT NOT NULL,
  `rating` INT NOT NULL DEFAULT 0,
  `rate_comment` VARCHAR(500) NULL,
  PRIMARY KEY (`user_id`, `activity_id`),
  INDEX `fk_user_has_activity_activity1_idx` (`activity_id` ASC),
  INDEX `fk_user_has_activity_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_activity_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_activity_activity1`
    FOREIGN KEY (`activity_id`)
    REFERENCES `activity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS otduser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'otduser'@'localhost' IDENTIFIED BY 'otd';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'otduser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `otddb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `create_date`) VALUES (1, 'admin', 'otdadmin', 1, NULL, '2021-09-23');

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `otddb`;
INSERT INTO `category` (`id`, `activity_type`) VALUES (1, 'Hiking');
INSERT INTO `category` (`id`, `activity_type`) VALUES (2, 'Biking');
INSERT INTO `category` (`id`, `activity_type`) VALUES (3, 'Kayaking');
INSERT INTO `category` (`id`, `activity_type`) VALUES (4, 'Rafting');
INSERT INTO `category` (`id`, `activity_type`) VALUES (5, 'Fishing');

COMMIT;


-- -----------------------------------------------------
-- Data for table `location`
-- -----------------------------------------------------
START TRANSACTION;
USE `otddb`;
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (1, NULL, 'Denver', 'CO', '80212', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `activity`
-- -----------------------------------------------------
START TRANSACTION;
USE `otddb`;
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`) VALUES (1, 'Sloan\'s Lake Loop', 'The lake is closed for kayaks and water activities due to dangerous levels of blue algae. Keep your dogs away from the water.', 13, 'Loop', 1, 1, 1, 'This easy, family-friendly stroll goes around the lake in Sloan\'s Lake Park. Accessibility: There are 2 designated accessible spaces in the small paved parking lot off of West Byron Place at the northwest end of the trail. Both of them are van-accessible with a striped access aisle. The trail surface is paved (with railings at bridges) and smooth. It is typically at least 4 to 6 feet wide (with some wider passing spaces). There is a painted dividing line along the trail which reduces the width.  The entire trail is estimated to be in the flat grade category (1% or less). This trail will likely be navigable for most wheelchairs/mobility equipment or stroller users. There are benches and picnic tables along the route for resting. There are wheelchair-accessible bathrooms along the trail.', 'https://cdn-assets.alltrails.com/uploads/photo/image/27257608/extra_large_05f6ac6a01e9df8c6ce7520521a7325d.jpg', 1, 1, 1);

COMMIT;

