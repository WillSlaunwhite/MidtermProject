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
  `pro_tips` TEXT NULL,
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
  `distance_miles` DOUBLE NOT NULL,
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
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (2, NULL, 'Golden', 'CO', '80401', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (3, NULL, 'Aurora', 'CO', '80013', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (4, NULL, 'Boulder', 'CO', '80301', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (5, NULL, 'Aurora', 'CO', '80013', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (6, NULL, 'Keystone', 'CO', '80435', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (7, NULL, 'Twin Lakes', 'CO', '81251', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (8, NULL, 'Twin Lakes', 'CO', '81251', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (9, NULL, 'Durango', 'CO', '81301', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (10, NULL, 'Allenspark', 'CO', '80510', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (11, NULL, 'Georgetown', 'CO', '80444', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (12, NULL, 'Georgetown', 'CO', '80444', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (13, NULL, 'Blue River', 'CO', '80424', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (14, NULL, 'Nathrop', 'CO', '81211', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (15, NULL, 'Littleton', 'CO', '80110', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (16, NULL, 'Crested Butte', 'CO', '81224', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (17, NULL, 'Salida', 'CO', '81201', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (18, NULL, 'Pine', 'CO', '80470', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (19, NULL, 'Grand Junction', 'CO', '80501', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (20, NULL, 'Durango', 'CO', '81301', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (21, NULL, 'Aspen', 'CO', '81610', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (22, NULL, 'Cortez', 'CO', '81321', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (23, NULL, 'Buena Vista', 'CO', '81211', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (24, NULL, 'Arboles', 'CO', '81121', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (25, NULL, 'Pueblo', 'CO', '81001', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (26, NULL, 'Lake George', 'CO', '80827', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (27, NULL, 'Lakewood', 'CO', '80123', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (28, NULL, 'Craig', 'CO', '81625', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (29, NULL, 'Eagle', 'CO', '81631', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (30, NULL, 'Rifle', 'CO', '81650', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (31, NULL, 'Del Norte', 'CO', '81132', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (32, NULL, 'Eagle', 'CO', '81631', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (33, NULL, 'Aurora', 'CO', '80013', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (34, NULL, 'Walden', 'CO', '80480', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (35, NULL, 'Leadville', 'CO', '80461', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (36, NULL, 'Aspen', 'CO', '81611', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (37, NULL, 'Walden', 'CO', '80480', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (38, NULL, 'Gunnison', 'CO', '81230', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (39, NULL, 'Buena Vista', 'CO', '81211', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (40, NULL, 'Durango', 'CO', '81301', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (41, NULL, 'Dinosaur', 'CO', '81610', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (42, NULL, 'Glenwood Springs', 'CO', '81602', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (43, NULL, 'Pagosa Springs', 'CO', '81147', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (44, NULL, 'Estes Park', 'CO', '80517', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (45, NULL, 'Cortez', 'CO', '81321', NULL, NULL);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `latitude`, `longitude`) VALUES (46, NULL, 'Idaho Springs', 'CO', '80452', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `activity`
-- -----------------------------------------------------
START TRANSACTION;
USE `otddb`;
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (1, 'Sloan\'s Lake Loop', 'Lots of access to water which was great for refilling water bottles and cooling off. ', 13, 'Loop', 1, 1, 1, 'This easy, family-friendly stroll goes around the lake in Sloan\'s Lake Park. Accessibility: There are 2 designated accessible spaces in the small paved parking lot off of West Byron Place at the northwest end of the trail. Both of them are van-accessible with a striped access aisle. The trail surface is paved (with railings at bridges) and smooth. It is typically at least 4 to 6 feet wide (with some wider passing spaces). There is a painted dividing line along the trail which reduces the width.  The entire trail is estimated to be in the flat grade category (1% or less). This trail will likely be navigable for most wheelchairs/mobility equipment or stroller users. There are benches and picnic tables along the route for resting. There are wheelchair-accessible bathrooms along the trail.', 'https://cdn-assets.alltrails.com/uploads/photo/image/27257608/extra_large_05f6ac6a01e9df8c6ce7520521a7325d.jpg', 1, 1, 1, 2.6);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (2, 'Clear Creek Trail', 'Platte River Trail north of I-76 (Welby) and Clear Creek Canyon Rd./US 6 west of 6th Ave. (Golden)', 223, 'Asphalt, Concrete, Crushed Stone, Dirt', 1, 1, 1, 'The Clear Creek Trail runs more than 20 miles from metro Denver, through Wheat Ridge, to Golden along a picturesque creek with views of the North and South Table Mountains. A highlight of the trail is the legendary Coors Brewing Company on the path\'s western end; factory tours are available. In Golden, the trail runs right along the river and travelers will see families tubing down the river and fly fishermen along its banks. The trail is paved downtown, but becomes crushed stone and more tree-lined as you head west out of town. Numerous pedestrian bridges dot the route, allowing trail users easy access to both sides of Clear Creek, and interpretative panels along the way share the region\'s history.', 'https://cloudfront.traillink.com/photos/clear-creek-trail-(co)_174777_sc.jpg', 2, 2, 1, 21.8);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (3, 'Cherry Creek Reservoir', 'Cherry Creek State Park charges a fee to enter. Entrance fees are per vehicle. An annual pass is also available.', 147, 'Loop', 1, 2, 1, 'Cherry Creek Reservoir Loop Trail is a 6.7 mile heavily trafficked loop trail located near Centennial, Colorado that features a lake and is good for all skill levels. The trail offers a number of activity options and is accessible year-round. Dogs are also able to use this trail but must be kept on leash.', 'https://cdn-assets.alltrails.com/uploads/photo/image/39585202/extra_large_afb6936fff226e402b15e57468f8d1d0.jpg', 3, 3, 1, 6.7);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (4, 'Gross Reservoir', 'The reservoir receives water from the western side of the Continental Divide through the Moffat Tunnel. South Boulder Creek flows out of the 340 foot-high dam.', 75, 'Loop', 2, 2, 1, 'Gross Reservoir Paddle Route is a 7 mile lightly trafficked loop trail located near Golden, Colorado that features a lake. The trail is good for all skill levels.', 'https://cdn-assets.alltrails.com/uploads/photo/image/14581982/extra_large_c2958673933db1e990f00b89b04d9c34.jpg', 4, 4, 1, 7);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (5, 'Aurora Reservoir', 'Parks pass required;\nDay Pass, $10\nAnnual Pass, Non-Resident  $65\nAnnual Pass, Aurora Resident  $55\nAnnual Pass, Non-Resident Senior, 62+  $55\nAnnual Pass, Aurora Resident Senior, 62+  $45\nAdditional Vehicle Pass,  $30\n\nFees are charged per vehicle in most cases.\nPasses are valid at both Aurora and Quincy Reservoirs.', 137, 'Clearing', 1, 1, 1, 'Aurora Reservoir is a 8 mile loop trail located near Aurora, Colorado that features a lake and is good for all skill levels. The trail is primarily used for walking, fishing, and road biking. Dogs are also able to use this trail but must be kept on leash.', 'https://cdn-assets.alltrails.com/uploads/photo/image/38546872/extra_large_cf3ef2cfce7e92bcf22dc80ff2595ae6.jpg', 5, 5, 1, 8);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (6, 'Grays Peak', 'Since the Grays Peak trail is both beginner-friendly and easy to get to, it often gets crowded during peak season (June through October). Arrive early for the best chance of beating the crowds.', 3366, 'Out and Back', 2, 1, 1, 'Grays Peak is a 7.3 mile heavily trafficked out and back trail located near Silver Plume, Colorado that features a river and is rated as difficult. The trail is primarily used for hiking and is best used from May until October. Dogs are also able to use this trail but must be kept on leash.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Grays_and_Torreys_Peaks_2006-08-06.jpg/544px-Grays_and_Torreys_Peaks_2006-08-06.jpg', 1, 6, 1, 3.5);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (7, 'Huron Peak', 'A lot of rock scrambling on loose boulders after this with little to no trail for guidance, felt relatively safe but was very slow going. You still have a ways to go after Browns until you connect with the main trail up Huron, as you have another (longer) boulder field to traverse. There are a lot more rocks, less path, and less vegetation than some older YouTube videos about this route show, but it\'s still very doable if you take your time. Summiting Huron along the main path felt a lot easier and less technical than the rest of the route!', 3881, 'Loop', 2, 1, 2, 'Huron Peak via Lulu Gulch is a 11.2 mile lightly trafficked loop trail located near Twin Lakes, Colorado that offers the chance to see wildlife and is rated as difficult. The trail is primarily used for hiking and running and is best used from May until October. Dogs are also able to use this trail.', 'https://photos.alltrails.com/eyJidWNrZXQiOiJhc3NldHMuYWxsdHJhaWxzLmNvbSIsImtleSI6InVwbG9hZHMvcGhvdG8vaW1hZ2UvMzAwNTUyMDcvNThkZDEyOGJjMzI1NjNhNDRlZDZmMDQ2YjRkZDkzNDQuanBnIiwiZWRpdHMiOnsidG9Gb3JtYXQiOiJqcGVnIiwicmVzaXplIjp7IndpZHRoIjoyMDQ4LCJoZWlnaHQiOjIwNDgsImZpdCI6Imluc2lkZSJ9LCJyb3RhdGUiOm51bGwsImpwZWciOnsidHJlbGxpc1F1YW50aXNhdGlvbiI6dHJ1ZSwib3ZlcnNob290RGVyaW5naW5nIjp0cnVlLCJvcHRpbWlzZVNjYW5zIjp0cnVlLCJxdWFudGlzYXRpb25UYWJsZSI6M319fQ==', 1, 7, 2, 11.2);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (8, 'Mount Elbert', 'Great trail. But - ACCESS TO THE TRAILHEAD IS NOT REOPENED YET. PARK AT THE TRAILHEAD AT YOUR OWN RISK. Some hiker must have moved the \"road closed\" sign, or else the forest service got their wires crossed and removed it too early. When I got down from the mountain today there was a grumpy ranger asking for everyone\'s ID to try to figure out how the sign got moved.', 4468, 'Out and Back', 2, 1, 2, 'North Mount Elbert Trail is a 10.4 mile heavily trafficked out and back trail located near Twin Lakes, Colorado that features beautiful wild flowers and is only recommended for very experienced adventurers. The trail is primarily used for hiking and is best used from May until October.', 'https://cdn-assets.alltrails.com/uploads/photo/image/19637199/extra_large_832261429ba7979a47a44567a2e5a5c3.jpg', 1, 8, 2, 10.4);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (9, 'Windom Peak', 'Train was not running so had to come from the actual road. The trail is easy to follow.', 10780, 'Loop', 2, 1, 2, 'Sunlight Peak, Windom Peak, North Eolus and Mount Eolus via Purgatory Campground is a 37.6 mile moderately trafficked loop trail located near Durango, Colorado that features a great forest setting and is only recommended for very experienced adventurers. The trail is primarily used for hiking, running, nature trips, and bird watching and is best used from June until September. Dogs are also able to use this trail.', 'https://www-vacasa.imgix.net/estes_park_peter-pryharski-109884-unsplash.jpg?auto=format%2Ccompress&ixlib=python-3.2.1&q=45&w=1512', 1, 9, 2, 37.6);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (10, 'Longs Peak', 'Fire Closure: As of July 2021, there are closures in this park or area due to wildfire damage.', 5039, 'Out and Back', 2, 1, 2, 'The Keyhole and Longs Peak via Longs Peak Trail is a 14.8 mile heavily trafficked out and back trail located near Allenspark, Colorado that features a lake and is rated as difficult. The trail is primarily used for rock climbing and is best used from April until November.', 'https://www-vacasa.imgix.net/longs_peak_andrew-seaman-800313-unsplash.jpg?auto=format%2Ccompress&ixlib=python-3.2.1&q=45&w=1512', 1, 10, 3, 14.8);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (11, 'Mount Evans', 'Experienced my favorite sunrise to date. A lot of people noted the trail marking was difficult. While it’s not a well groomed trail, if you keep your eyes open, you can spot the markers. It posed for a fun seek and find on the way up! The mountain goats who greeted us were the cherry on top! ', 2112, 'Out and Back', 2, 1, 2, 'Mount Evans and Mount Spalding Trail is a 5.2 mile heavily trafficked out and back trail located near Georgetown, Colorado that features a lake and is rated as difficult. The trail is primarily used for hiking and rock climbing and is best used from April until November. Dogs are also able to use this trail but must be kept on leash.', 'https://www.backpacker.com/wp-content/uploads/2021/07/Mount-Evans-scaled.jpg?width=730', 1, 11, 1, 5.2);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (12, 'Mount Bierstadt', 'Bummer, this trail is closed. We\'ll update this page if and when it reopens.', 2736, 'Loop', 2, 1, 2, 'Mount Bierstadt is a 14,065-foot-high mountain summit in the Front Range of the Rocky Mountains, in the U.S. state of Colorado. The fourteener is located in the Mount Evans Wilderness of Pike National Forest, 9.4 miles south by east of the Town of Georgetown in Clear Creek County. It was named in honor of Albert Bierstadt, an American landscape painter who made the first recorded summit of the mountain in 1863.', 'https://upload.wikimedia.org/wikipedia/commons/0/05/2007-07-08-biers-reflectio2.jpg', 1, 12, 1, 4.6);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (13, 'Quandary Peak', 'Great views, very tough final ascent! Takes about 5 hours total. Some mountain goats on the trail. There’s a nearby house that offers parking for $30. ', 3326, 'Out and Back', 2, 1, 2, 'Quandary Peak Trail is a 6.6 mile heavily trafficked out and back trail located near Blue River, Colorado that features beautiful wild flowers and is rated as difficult. The trail is primarily used for hiking and snowshoeing and is accessible year-round. Dogs are also able to use this trail but must be kept on leash.', 'https://cdn-assets.alltrails.com/uploads/photo/image/38755584/extra_large_cb83a4659983ac1a3848a1a176028647.jpg', 1, 13, 1, 6.6);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (15, 'Colorado Trail', 'Colorado Trail: Segment 1 is a 18 mile moderately trafficked point-to-point trail located near Littleton, Colorado that features a river and is rated as difficult. The trail offers a number of activity options and is best used from April until September.', 2795, 'Point to Point', 2, 1, 1, 'Amazing singletrack, killer views, and lung busting elevation - what more could you ask for? Portions of the Colorado Trail are off limits to bikes so you\'ll need to detour around each of the 6 designated wilderness areas. Many day trip routes are available and connecting trails abound.', 'https://cdn-assets.alltrails.com/uploads/photo/image/20582214/extra_large_49a9a2778078313bfd6f606fbe5ef99b.jpg', 2, 15, 1, 18);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (16, 'Doctor Park', 'The first few miles are incredibly technical and steep uphill. Lots of bikers heading downhill but easy lines of sight and I was always able to step to the side.  Really gorgeous views and transitions from rocks to aspens and ponderosa pines.  Great camping at the trail head. The river is right there for a cool dip when you’re done!', 3024, 'Loop', 2, 1, 2, 'Doctor Park is a 19.1 mile lightly trafficked loop trail located near Crested Butte, Colorado that features beautiful wild flowers and is only recommended for very experienced adventurers. The trail offers a number of activity options and is best used from April until October. Dogs and horses are also able to use this trail.', 'https://cdn-assets.alltrails.com/uploads/photo/image/39521110/extra_large_7acd12a15144da3711106df8b7c484c2.jpg', 2, 16, 1, 19.1);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (17, 'Monarch Crest Trail', 'It’s not a descent. There is a lot of descending, but you’re gonna climb too. Some climbing is easier than other. But the hard climbing is HARD so prepare yourself. It’s not impossible. ', 2168, 'Point to Point', 2, 2, 2, 'Monarch Crest Trail is a 31.3 mile moderately trafficked point-to-point trail located near Sargents, Colorado that features beautiful wild flowers and is rated as moderate. The trail offers a number of activity options and is best used from March until October.', 'https://cdn-assets.alltrails.com/uploads/photo/image/13758527/extra_large_2fb730374dee0c18e0a3e96a7f145821.jpg', 2, 17, 1, 31.3);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (18, 'Buffalo Creek', 'Massive trail with monster climbs that burn into super fast descents over 30mph.', 2795, 'Loop', 2, 1, 2, 'Buffalo Creek Loop: Strawberry Jack to Gashouse 726 and Homestead 728 is a 18.5 mile moderately trafficked loop trail located near Pine, Colorado that features beautiful wild flowers and is rated as difficult. The trail offers a number of activity options and is accessible year-round. Dogs are also able to use this trail but must be kept on leash.', 'https://cdn-assets.alltrails.com/uploads/photo/image/41060075/extra_large_f4189f99ffab8d84935b5163a60733e9.jpg', 2, 18, 1, 18.5);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (19, 'Lunch Loop', 'Challenging course that offers a variety of great views including the whole Grand Valley.', 777, 'Loop', 2, 1, 2, 'Lunch Loops is a 6.4 mile lightly trafficked loop trail located near Grand Junction, Colorado that features beautiful wild flowers and is rated as moderate. The trail offers a number of activity options and is best used from April until October. Dogs are also able to use this trail but must be kept on leash.', 'https://cdn-assets.alltrails.com/uploads/photo/image/40810213/extra_large_c043a95c904e5761aea7c0dfb56e5891.jpg', 2, 19, 1, 6.4);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (20, 'Horse Gulch', 'Not the most scenic trail but it\'s proximity to town and options for side trails and to get a variety of climbs made it worth it. All the trails are really well marked with maps at pretty much each junction.', 482, 'Loop', 2, 2, 2, 'Meadow Loop via Horse Gulch Trail is a 3.3 mile moderately trafficked loop trail located near Durango, Colorado that offers scenic views and is rated as moderate. The trail is primarily used for hiking, walking, and mountain biking and is best used from April until October.', 'https://cdn-assets.alltrails.com/uploads/photo/image/40615018/extra_large_9412bae18a620827b72e01ae10ccff2a.jpg', 2, 20, 1, 3.3);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (21, 'Government Trail', 'Protective Closure: This area is subject to closure due to habitat protection. ', 4038, 'Out and Back', 2, 1, 2, 'Government Trail is a 19 mile lightly trafficked out and back trail located near Aspen, Colorado that features beautiful wild flowers and is rated as moderate. The trail offers a number of activity options and is best used from July until May. Dogs are also able to use this trail.', 'https://cdn-assets.alltrails.com/uploads/photo/image/11068095/extra_large_502bb58ece5cde0677b07dcfde50a77e.jpg', 2, 21, 2, 19);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (22, 'Phil\'s World', 'This awesome area of groomed singletrack screams for mountain bikers. Rollers are big, fast, and simply astounding. This area is limited to human powered travel - no motorcyckes, ATVs, horses, etc.', 1532, 'Loop', 2, 1, 2, 'Phil\'s World Mountain Bike Trail is a 18.9 mile heavily trafficked loop trail located near Cortez, Colorado that features beautiful wild flowers and is rated as moderate. The trail offers a number of activity options and is best used from September until May. Dogs are also able to use this trail.', 'https://photos.alltrails.com/eyJidWNrZXQiOiJhc3NldHMuYWxsdHJhaWxzLmNvbSIsImtleSI6InVwbG9hZHMvcGhvdG8vaW1hZ2UvMzExMjA0MjYvOTMxMmM5NzgwZTk5ZmVhYzg4OTMwMzlmZjc4OTllN2UuanBnIiwiZWRpdHMiOnsidG9Gb3JtYXQiOiJqcGVnIiwicmVzaXplIjp7IndpZHRoIjoyMDQ4LCJoZWlnaHQiOjIwNDgsImZpdCI6Imluc2lkZSJ9LCJyb3RhdGUiOm51bGwsImpwZWciOnsidHJlbGxpc1F1YW50aXNhdGlvbiI6dHJ1ZSwib3ZlcnNob290RGVyaW5naW5nIjp0cnVlLCJvcHRpbWlzZVNjYW5zIjp0cnVlLCJxdWFudGlzYXRpb25UYWJsZSI6M319fQ==', 2, 22, 2, 18.9);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (23, 'Arkansas River Trail', 'This route runs through private property and is used by private companies.', 9, 'Point to Point', 2, 2, 2, 'While there is plenty of space to kayak along the Arkansas River, there is a particular area that you will want to visit if you really enjoy whitewater kayaking. That is the Arkansas Headwaters Recreation Area.\n\nThis is an area that you will have to register before you head up because of how popular it is. There are class 4 and 5 rapids along the river that you can experience. It’s truly a great time, but it’s not for the faint of heart or those that are new to kayaking.\nWhile there is plenty of space to kayak along the Arkansas River, there is a particular area that you will want to visit if you really enjoy whitewater kayaking. That is the Arkansas Headwaters Recreation Area. This is an area that you will have to register before you head up because of how popular it is. There are class 4 and 5 rapids along the river that you can experience. It’s truly a great time, but it’s not for the faint of heart or those that are new to kayaking.', 'https://www.bvadventurehub.com/content/files/uploads/2018/07/kayak.jpg', 3, 23, 4, 6);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (24, 'Navajo Reservoir', 'The lake is part of the Colorado River Storage Project, which here manages the upper reaches of the San Juan River, storing and releasing water that is used locally for irrigation, or ultimately reaching the Colorado River in Utah. ', 554, 'Loop', 2, 2, 2, 'The Navajo Reservoir is part of the Navajo State Park. Part of the park crosses into New Mexico, but there’s a lot more to experience on the Colorado side of the park. The reservoir is huge and there are plenty of ways for you to enjoy the reservoir, but kayaking will be an excellent way to get out there and see everything that is out on the water. You’ll not only be surprised by the number of people in seemingly the middle of nowhere, but also by all the spectacular sights. Extend your kayaking trip by making it a camping trip down there as well.', 'https://mk0uncovercolor8845v.kinstacdn.com/wp-content/uploads/2017/10/Navajo-Reservoir-New-Mexico-Aerial-View-1280x720.jpg', 3, 24, 3, 8.6);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (25, 'Lake Pueblo', 'Lake Pueblo State Park charges an entrance fee of $10/vehicle. An annual pass is also available for $80.', 1190, 'Loop', 2, 2, 2, 'Lake Pueblo Loop- The Duke, Voodoo, and South Shore Loop is a 21.6 mile moderately trafficked loop trail located near Pueblo, Colorado that offers scenic views and is rated as moderate. The trail offers a number of activity options and is best used from April until September.', 'https://cdn-assets.alltrails.com/uploads/photo/image/19948186/extra_large_4daeb2cdd25ae225257c14f0e9d69257.jpg', 3, 25, 2, 21.6);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (26, 'Eleven Mile', 'Great spot to do some fly fishing in Colorado.  Remember to bring some cash, there is a small entrance fee of $7 in 2020, this may increase in the future by small amounts. This route is not open to OHV’s.  It is only open to licensed vehicles. ', 1033, 'Out and Back', 2, 2, 1, 'Eleven Mile Canyon Route is a 17.8 mile moderately trafficked out and back trail located near Lake George, Colorado that features a river and is good for all skill levels. The trail is primarily used for camping, fishing, and scenic driving and is best used from May until September.', 'https://photos.alltrails.com/eyJidWNrZXQiOiJhc3NldHMuYWxsdHJhaWxzLmNvbSIsImtleSI6InVwbG9hZHMvcGhvdG8vaW1hZ2UvMTQwNDgwNTcvNmQ3YzMzMGZjY2MzMDZmODIwOTg4MTA0YTliMzQ3NzYuanBnIiwiZWRpdHMiOnsidG9Gb3JtYXQiOiJqcGVnIiwicmVzaXplIjp7IndpZHRoIjoyMDQ4LCJoZWlnaHQiOjIwNDgsImZpdCI6Imluc2lkZSJ9LCJyb3RhdGUiOm51bGwsImpwZWciOnsidHJlbGxpc1F1YW50aXNhdGlvbiI6dHJ1ZSwib3ZlcnNob290RGVyaW5naW5nIjp0cnVlLCJvcHRpbWlzZVNjYW5zIjp0cnVlLCJxdWFudGlzYXRpb25UYWJsZSI6M319fQ==', 3, 26, 2, 17.8);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (27, 'Bear Creek Lake', 'Be careful as the mosquitos will attack you with a vengeance along the brush. Bring bug spray. ', 695, 'Loop', 2, 1, 1, 'Bear Creek Lake Trail Loop is a 9.4 mile heavily trafficked loop trail located near Morrison, Colorado that features a lake and is rated as moderate. The trail offers a number of activity options and is best used from April until October. Dogs are also able to use this trail but must be kept on leash.', 'https://photos.alltrails.com/eyJidWNrZXQiOiJhc3NldHMuYWxsdHJhaWxzLmNvbSIsImtleSI6InVwbG9hZHMvcGhvdG8vaW1hZ2UvNDAzMDgwNjAvZGJlODA2YWY2MmE1ODcxNjczNzI1ZWI2ZDA4YjBiNGYuanBnIiwiZWRpdHMiOnsidG9Gb3JtYXQiOiJqcGVnIiwicmVzaXplIjp7IndpZHRoIjoyMDQ4LCJoZWlnaHQiOjIwNDgsImZpdCI6Imluc2lkZSJ9LCJyb3RhdGUiOm51bGwsImpwZWciOnsidHJlbGxpc1F1YW50aXNhdGlvbiI6dHJ1ZSwib3ZlcnNob290RGVyaW5naW5nIjp0cnVlLCJvcHRpbWlzZVNjYW5zIjp0cnVlLCJxdWFudGlzYXRpb25UYWJsZSI6M319fQ==', 3, 27, 2, 9.4);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (28, 'Elkhead Reservoir', 'Elkhead Reservoir State Park charges a fee to enter. Entrance fees are $9/vehicle or $4/person for any non-vehicle entry. An annual pass is also available for $80.', 42, 'Out and Back', 2, 1, 1, 'Elkhead Reservoir  is a 1 mile lightly trafficked out and back trail located near Craig, Colorado that features a lake and is good for all skill levels. The trail is primarily used for walking, nature trips, and fishing and is accessible year-round. Dogs are also able to use this trail but must be kept on leash.', 'https://mk0uncovercolor8845v.kinstacdn.com/wp-content/uploads/2017/10/Elkhead-Reservoir-State-Park-Craig-Colorado-1000x563.jpg', 3, 28, 1, 1);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (29, 'Sylvan Lake', 'Sylvan Lake State Park charges a fee to enter. Entrance fees are $9/vehicle or $4/person for any non-vehicle entry. An annual pass is also available for $80.', 78, 'Loop', 2, 1, 1, 'Sylvan Lake Trail is a 1.4 mile moderately trafficked loop trail located near Eagle, Colorado that features a lake and is good for all skill levels. The trail is primarily used for hiking, walking, nature trips, and fishing and is best used from May until October. Dogs are also able to use this trail.', 'https://cdn-assets.alltrails.com/uploads/photo/image/38761206/extra_large_e125f861e965536a8c5a294364b87c7a.jpg', 3, 29, 1, 1.4);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (30, 'Rifle Gap', 'Rifle Gap State Park charges a fee to enter. Entrance fees are $9/vehicle or $4/person for any non-vehicle entry. An annual pass is also available for $80.', 91, 'Out and Back', 2, 1, 1, 'Rifle Gap Reservoir is a 1.5 mile moderately trafficked out and back trail located near Rifle, Colorado that features a lake and is good for all skill levels. The trail offers a number of activity options and is best used from March until October. Dogs are also able to use this trail.', 'https://photos.alltrails.com/eyJidWNrZXQiOiJhc3NldHMuYWxsdHJhaWxzLmNvbSIsImtleSI6InVwbG9hZHMvcGhvdG8vaW1hZ2UvMjI3MzMyOTcvZWM2NTBkYTA3OTQ3NjQxOTM3NjA5MTA0ZmIzMTRmODUuanBnIiwiZWRpdHMiOnsidG9Gb3JtYXQiOiJqcGVnIiwicmVzaXplIjp7IndpZHRoIjoyMDQ4LCJoZWlnaHQiOjIwNDgsImZpdCI6Imluc2lkZSJ9LCJyb3RhdGUiOm51bGwsImpwZWciOnsidHJlbGxpc1F1YW50aXNhdGlvbiI6dHJ1ZSwib3ZlcnNob290RGVyaW5naW5nIjp0cnVlLCJvcHRpbWlzZVNjYW5zIjp0cnVlLCJxdWFudGlzYXRpb25UYWJsZSI6M319fQ==', 3, 30, 1, 1.5);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (31, 'Arkansas River Rafting', 'During its long journey in the Rockies there are other notable rafting sections besides Cañon City’s Royal Gorge. Thrill seekers will enjoy tackling The Numbers by Buena Vista, before enjoying a family friendly float down the scenic Browns Canyon, Browns Canyon, a national monument located between Nathrop and Salida. Another beginner/intermediate section is Bighorn Sheep Canyon by Cañon City. Choose from half and full day adventures on the Arkansas River.', 0, 'Point to Point', 2, 2, 2, 'The mighty Arkansas River is the most rafted river in the state, and one of the most well known in the country. The headwaters of the Arkansas River begin near Leadville and flows south past Buena Vista and Nathrop, to Salida, before venturing east to Cañon City, Pueblo and the plains. It features many epic sections and trips you can take, none more popular than the Royal Gorge. This advanced trip leads through the narrow canyon, encountering some Class IV and V rapids along the way. You’ll pass under the stunning suspension bridge and possibly by the train.', 'https://mk0uncovercolor8845v.kinstacdn.com/wp-content/uploads/2020/07/arkansas-river-whitewater-rafting-colorado.jpg', 4, 39, 4, 15.9);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (32, 'Animas River', 'The ancestral Puebloan site of Aztec Ruins National Monument is situated along the river in the present day town of Aztec and for much of its course the river flows through native Ute and Navajo lands.', 0, 'Point to Point', 2, 2, 2, 'Durango is Southwest Colorado’s largest mountain towns in terms of population, and one of the biggest in the state at around 20,000 residents. The historic town may be most known for its narrow gauge railroad, but the Animas River provides a surge of energy and recreation throughout the year. What’s cool about the Animas River is both lazy floats and raging whitewater can be found on half and full day trips.', 'https://mk0uncovercolor8845v.kinstacdn.com/wp-content/uploads/2020/07/animas-river-whitewater-rafting-durango-co.jpg', 4, 40, 2, 126);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (33, 'Yampa River', 'Northwest Colorado’s most notorious river is the Yampa River. It’s actually the longest non-dammed rivers in the state. ', 0, 'Point to Point', 2, 2, 2, 'The rafting trips down the Yampa River are usually relaxing, multi-day lazy floats, perfect for a peaceful retreat and sightseeing through Yampa Canyon. There’s some whitewater thrills along the way. It meets up with the Green River in Dinosaur National Monument. Because Vernal, UT is the most popular town around Dinosaur National Monument, many of the overnight trips meet up there and shuttle out. Rafting trips down the Yampa River provide a chance to encounter Class III and IV rapids, best run from May through July. They are mostly multi-day camping and rafting trips, some either 4 or 5 days. There are also some shorter half day trips that launch out of downtown Steamboat Springs. These provide some Class II and III whitewater from May to early June.', 'https://mk0uncovercolor8845v.kinstacdn.com/wp-content/uploads/2020/07/yampa-river-colorado-mathers-hole-grand-overhang.jpg', 4, 41, 5, 250);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (34, 'Colorado River', 'It’s located a few miles upstream from Radium and its notorious primitive hot springs pool. Much further downstream will bring you to Glenwood Canyon near Glenwood Springs. It’s really popular for groups of friends and families looking for half and full day trips. ', 0, 'Point to Point', 2, 2, 2, 'The Colorado River runs its course from near Kremmling to the southwest past Radium, Glenwood Springs and onto Utah and beyond. There are many great sections of the Colorado River to raft, from family friendly trips down Glenwood Canyon near Glenwood Springs, to super gnarly, raging whitewater in Gore Canyon. Widely regarded as the most fierce, commercially rafted whitewater in Colorado, Gore Canyon is far from your typical float. This epic, advanced whitewater section near Kremmling is reserved only for experienced rafters with knowledgeable guides. It boasts numerous Class IV and V rapids that are monstrous when the CFS and water is high.', 'https://mk0uncovercolor8845v.kinstacdn.com/wp-content/uploads/2020/07/rafting-upper-colorado-river-glenwood-canyon.jpg', 4, 42, 4, 1450);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (35, 'Piedra River', 'It may not offer the longest stretch of river to raft, or most whitewater, but for a few months each season it makes a great beginner, introduction-to-rafting trip. It passes directly through the Pagosa’s whitewater park in downtown. Then after you have a river under your belt, tackle one or both sections of the other local river.', 0, 'Point to Point', 2, 2, 2, 'The Upper Piedra River is located northwest of Pagosa Springs. Trips are technical so it’s best suited for children 12 years and up. It includes numerous Class II, III and IV rapids. If you’re feeling adventurous and really want to experience the best of Colorado, combine it with an overnight rafting trip, which hits the Lower (box of the) Piedra River the next day. Outfitters guide trips, set up tents and cook your meals for you.\n\nAfter warming up on the Upper Piedra, spend another day on the Lower Piedra River. It’s even more extreme with several huge drops during its run in a thousand-foot-deep box canyon. This section has big thrills and suited for ages 16 and up. Piedra means “rock” in Spanish, so it. gets the name “The River of Stone Wall”. The action packed trip down the Lower Piedra has Class IV+ rapids, descending multiple deep box canyons.', 'https://mk0uncovercolor8845v.kinstacdn.com/wp-content/uploads/2020/07/piedra-river-pagosa-springs-co-1600x800-1-1600x800.jpg', 4, 43, 2, 40);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (36, 'Cache La Poudre River', 'Known simply as the Poudre (“Poo-der”), this river has a limited number of outfitters guiding trips on it, so it’s much less than crowded than some of the others.', 0, 'Point to Point', 2, 2, 2, 'Poudre Canyon is an extremely scenic place. It’s located on the Cache La Poudre-North Park Byway, a national scenic byway drive west to Walden from Fort Collins. The river itself is the only one designated a national wild and scenic river. Choose from a beginner/intermediate half day on Class II and III rapids and/or a half day of advanced Class III and IV rapids on Poudre River. Rafting generally start around mid May and go to early September for easier floats and early August for harder ones.', 'https://mk0uncovercolor8845v.kinstacdn.com/wp-content/uploads/2020/07/cache-la-poudre-river-whitewater-rafting-colorado.jpg', 4, 44, 2, 126);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (37, 'Dolores River', 'Raft the Dolores anywhere from a 3 to 10 day trips. Most trips generally depart from nearby Cortez, but the longer trips meet up in Durango, departing further upstream on the Dolores River. The wilderness is remote and gorgeous along its route. Remember the window is limited for this river, depending on the conditions and water level, so it’s generally around May. You’ll hit Class III rapids on the way, suitable for ages 10 years and older.', 0, 'Point to Point', 2, 2, 2, 'The Dolores River is another scenic Southwest Colorado rafting hotspot, when it’s permitted. This one is a little more hit or miss though as there are only limited trips available, usually starting in April and finishing in June. Those in the know, know it as one of the top multi-day rafting trips available in Colorado and beyond. It leads you down some exciting canyons and drops during its 175-mile raftable section.', 'https://mk0uncovercolor8845v.kinstacdn.com/wp-content/uploads/2020/07/dolores-river-snaggle-tooth-whitewater-rafting-colorado.jpg', 4, 45, 3, 175);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (38, 'Clear Creek', 'In Denver’s own mountain backyard of sorts, Idaho Springs offers an exciting rafting opportunity closest to the Metro. Only 30 miles west of downtown on I-70 leads you to this historic former mining town.', 0, 'Point to Point', 2, 2, 2, 'Clear Creek is the steepest river in the state that’s commercially rafted. It flows through a narrow canyon within Clear Creek Canyon, shaping numerous technical rapids and steep drops. You’ll never know it from the highway, but this river features a wild ride. 80% of the county is public lands, so nature and wildlife are always present.', 'https://mk0uncovercolor8845v.kinstacdn.com/wp-content/uploads/2020/07/clear-creek-whitewater-rafters-idaho-springs1.jpg', 4, 46, 3, 66);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (39, 'Rio Grande River', 'This section offers up some of the best catches of the river. The best time to fish in the river are from June to July when fish hatches are in full swing.', 23, 'River', 1, 1, 2, 'This is a windy river that begins in the San Juan Mountains in Southwest Colorado and ends in the Gulf of Mexico. The best fishing section of the river lies in the San Juans between the towns of Del Norte and South Fork.', 'https://mk0uncovercolor8845v.kinstacdn.com/wp-content/uploads/2017/10/Rio-Grande-River-Fishing-Colorado-1280x720.jpg', 5, 31, 1, 2);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (40, 'Gore Creek', 'Although this stream is relatively small, it is one of the best fishing destinations in Colorado. You can find lots of cutthroats, brooks, browns, and rainbows in this stream.', 86, 'Creek', 2, 1, 2, 'It’s a fairly small creek teeming with large trout. You can fish at any section of the creek beginning from the mountains at Gore lake and going down to the confluence with the Eagle River. However, there are two main fishing locations in the creek: the upper gore creek and the lower gore creek.', 'https://mk0uncovercolor8845v.kinstacdn.com/wp-content/uploads/2017/10/Gore-Creek-Fishing-Colorado-1280x720.jpg', 5, 32, 1, 18.5);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (41, 'Spinney Mountain Reservoir', 'It consistently offers up trophy trout, walleyes, and salmon. Although the reservoir provides great fishing opportunities throughout the year, the best time to fish is during summer in June.', 0, 'Reservoir', 1, 1, 2, 'This fishing destination does not just provide great fishing opportunities, but it also has beautiful shorelines and scenic views of the lake and surrounding landscapes. Anglers troop towards Spinney Mountain Reservoir because of its fly-fishing, belly boating, and trolling opportunities.', 'https://mk0uncovercolor8845v.kinstacdn.com/wp-content/uploads/2017/10/Spinney-Mountain-Reservoir-Fishing-Colorado-1280x720.jpg', 5, 33, 1, 112);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (42, 'North Platte River', 'This river has some of the best trout in the West.', 364, 'River', 1, 1, 2, 'The headwaters of the river is essentially all of Jackson County, Colorado whose boundaries are the continental divide on the west and south and the mountain drainage peaks on the east—the north boundary is the state of Wyoming boundary. ', 'https://mk0uncovercolor8845v.kinstacdn.com/wp-content/uploads/2017/10/Northgate-Canyon-North-Platte-River-Fishing-Colorado-1024x576.jpg', 5, 34, 1, 716);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (43, 'Upper Arkansas River', 'One of the most popular fishing sections of the river is the desert environment, which is quite popular with trout and rainbows.', 22, 'River', 1, 1, 2, 'The Arkansas River is a major tributary of the Mississippi River. It generally flows to the east and southeast as it traverses the U.S. states of Colorado, Kansas, Oklahoma, and Arkansas. The river\'s source basin lies in the western United States in Colorado, specifically the Arkansas River Valley. The headwaters derive from the snowpack in the Sawatch and Mosquito mountain ranges. It flows east into the Midwest via Kansas, and finally into the South through Oklahoma and Arkansas.', 'https://mk0uncovercolor8845v.kinstacdn.com/wp-content/uploads/2017/10/Upper-Arkansas-River-Fishing-Colorado-1280x720.jpg', 5, 35, 1, 1469);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (44, 'Fryingpan River', 'This fishing destination has gained an international reputation for fly and lure fishing. The state of Colorado has aptly managed this fishing habitat. You can easily catch 10-pound rainbows in some sections of the river. The best fishing location in this river is between Ruedi Reservoir and the confluence with Roaring Fork. This section has clear waters, lots of fish, and provides views of the beautiful mountain vistas surrounding the river.', 36, 'River', 1, 1, 2, 'The Fryingpan River is a tributary of the Roaring Fork River, in West Central Colorado. It rises in northeastern Pitkin County, in the White River National Forest in the Sawatch Mountains along the western side of the continental divide. It flows westward along the county line between Pitkin and Eagle County. Below Meredith, it is dammed to form the Ruedi Reservoir. It joins the Roaring Fork below Basalt. A portion of the river\'s water is diverted to the east side of the continental divide for irrigation and drinking water via the Fryingpan-Arkansas Project.', 'https://mk0uncovercolor8845v.kinstacdn.com/wp-content/uploads/2017/10/Frying-Pan-River-Fishing-Colorado-1280x720.jpg', 5, 36, 1, 42);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (45, 'South Platte River', 'The river is well known for its wild trophy population of brown and rainbow trout. As a result of its close proximity to Denver, the river has thousands of fly fishing enthusiasts visit each year.', 62, 'River', 1, 1, 2, 'The South Platte River makes its way from South Park into downtown Denver. The dream stream is the best section of the river. This section begins in the mountain meadows next to the Spinney Mountain Area and flows down to the Elevenmile Canyon Reservoir. The dream section teems with fish, especially during the spring migration. It is one of the best fishing places near Denver and accommodates large groups of anglers who come to the river to fish each year.', 'https://mk0uncovercolor8845v.kinstacdn.com/wp-content/uploads/2017/10/South-Platte-River-Fishing-Colorado-1280x720.jpg', 5, 37, 1, 439);
INSERT INTO `activity` (`id`, `title`, `pro_tips`, `elevation_gain_feet`, `route`, `handicap_accessible`, `dogs_allowed`, `parking`, `description`, `profile_url`, `category_id`, `location_id`, `difficulty`, `distance_miles`) VALUES (46, 'Gunnison River', 'The river\'s powerful current and many rapids make upstream travel nearly impossible. It is navigable by small craft throughout its course and by larger boats below the Black Canyon. Parts of the Black Canyon are non-navigable by any sort of craft because of giant cataracts. Navigation through the entire canyon is dangerous and for experienced boaters only.', 156, 'River', 1, 1, 2, 'This river provides some of the best fishing opportunities in Colorado. Among the best fishing sections are in the Black Canyon in Gunnison National Park, though it’s fly fishing and artificial lures only. However, be prepared to drive through the steep and windy roads leading up to the canyon. Despite the arduous journey you will have to make to reach the Gunnison River, the fishing is totally worth it. You may also get to the river by hiking along one of the inner canyon routes. However, you will be required to get a backcountry permit to go for the hike.', 'https://mk0uncovercolor8845v.kinstacdn.com/wp-content/uploads/2017/10/Gunnison-River-Fishing-Colorado-1280x720.jpg', 5, 38, 1, 138);

COMMIT;

