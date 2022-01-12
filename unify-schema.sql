-- -----------------------------------------------------
-- Table `University`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `University` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(128) NOT NULL,
  `Email` VARCHAR(128) NOT NULL,
  `EmailPrefix` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`ID`)
);


-- -----------------------------------------------------
-- Table `Organisation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Organisation` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `University` INT NOT NULL,
  `Name` VARCHAR(128) NOT NULL,
  `Description` VARCHAR(255),
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`University`)
  REFERENCES University(`ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `Administrator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Analyst` (
  `ID` BIGINT NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(128) NOT NULL,
  `Univeristy` INT NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`Univeristy`)
  REFERENCES University(`ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `Event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Event` (
  `ID` BIGINT NOT NULL AUTO_INCREMENT,
  `Organisation` INT NOT NULL,
  `Name` VARCHAR(128) NOT NULL,
  `Description` VARCHAR(255),
  `Image` VARCHAR(255),
  `Location` VARCHAR(128) NOT NULL,
  `Max_Capacity` INT,
  `Current_Capacity` INT NOT NULL DEFAULT '0', 
  `Start_Date` DATE NOT NULL,
  `End_Date` DATE NOT NULL,
  `Start_Time` TIME NOT NULL,
  `End_Time` TIME NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`Organisation`)
  REFERENCES Organisation(`ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `Tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tag` (
  `ID` BIGINT NOT NULL AUTO_INCREMENT,
  `Tag` INT NOT NULL,
  PRIMARY KEY (`ID`)
);

-- -----------------------------------------------------
-- Table `Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Course` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`ID`)
);


-- -----------------------------------------------------
-- Table `Hobby`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hobby` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`ID`)
);


-- -----------------------------------------------------
-- Table `DegreeType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DegreeType` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`ID`)
);


-- -----------------------------------------------------
-- Table `Accomodation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Accomodation` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Type` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`ID`)
);


-- -----------------------------------------------------
-- Table `Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Student` (
  `ID` BIGINT NOT NULL AUTO_INCREMENT,
  `University` INT NOT NULL,
  `Course` INT NOT NULL,
  `DegreeType` INT NOT NULL,
  `Accomodation` INT,
  `First_Name` VARCHAR(128) NOT NULL,
  `Last_Name` VARCHAR(128) NOT NULL,
  `DOB` DATE NOT NULL,
  `Gender` ENUM('Female', 'Male', 'Other', 'Unknown'),
  `Year_Of_Study` INT NOT NULL,
  `Username` VARCHAR(128) NOT NULL,
  `Points` INT DEFAULT '0',
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`University`)
  REFERENCES University(`ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY (`Course`)
  REFERENCES Course(`ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY (`DegreeType`)
  REFERENCES DegreeType(`ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY (`Accomodation`)
  REFERENCES Accomodation(`ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE

);


-- -----------------------------------------------------
-- Table `Friend`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Friend` (
  `Student01` BIGINT NOT NULL,
  `Student02` BIGINT NOT NULL,
  FOREIGN KEY (`Student01`)
  REFERENCES Student(`ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY (`Student02`)
  REFERENCES Student(`ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `StudentHobby`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StudentHobby` (
  `Student` BIGINT NOT NULL,
  `Hobby` INT NOT NULL,
  FOREIGN KEY (`Student`)
  REFERENCES Student(`ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY (`Hobby`)
  REFERENCES Hobby(`ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `OrganisationTag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OrganisationTag` (
  `Organisation` INT NOT NULL,
  `Tag` INT NOT NULL,
  FOREIGN KEY (`Organisation`)
  REFERENCES Organisation(`ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY (`Tag`)
  REFERENCES Tag(`ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `StudentEvent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StudentEvent` (
  `Event` BIGINT NOT NULL,
  `Student` BIGINT NOT NULL,
  FOREIGN KEY (`Event`)
  REFERENCES Event(`ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY (`Student`)
  REFERENCES Student(`ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `StudentOrganisation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StudentOrganisation` (
  `Organisation` INT NOT NULL,
  `Student` BIGINT NOT NULL,
  FOREIGN KEY (`Organisation`)
  REFERENCES Organisation(`ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY (`Student`)
  REFERENCES Student(`ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);
