use pipelines;
-- Master table list Start
CREATE TABLE IF NOT EXISTS `Status` (
  `id` SERIAL NOT NULL,
  `code` VARCHAR(10) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC) )
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Type` (
  `id` SERIAL NOT NULL,
  `code` VARCHAR(10) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC) )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `UserType` (
  `id` SERIAL NOT NULL,
  `code` VARCHAR(10) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC) )
ENGINE = InnoDB;

insert ignore into UserType (code, name) values ('lead', 'Lead Engineer');
insert ignore into UserType (code, name) values ('admin', 'Administrator');

CREATE TABLE IF NOT EXISTS `Segment` (
`id` SERIAL NOT NULL,
`code` VARCHAR(10) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC) )
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Probability` (
  `id` SERIAL NOT NULL,
  `code` VARCHAR(10) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC) )
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `QuoteStatus` (
  `id` SERIAL NOT NULL,
  `code` VARCHAR(10) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC) )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Country` (
  `id` SERIAL NOT NULL,
  `code` VARCHAR(10) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC) )
ENGINE = InnoDB;

-- Master Table list END
-- Permissions Table
CREATE TABLE IF NOT EXISTS `Permissions` (
  `id` SERIAL NOT NULL,
  `code` VARCHAR(10) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC) )
ENGINE = InnoDB;

insert ignore into Permissions (code, name) values ('regnew', 'Register New Pipeline');
insert ignore into Permissions (code, name) values ('upd', 'Update Registered Pipeline');
insert ignore into Permissions (code, name) values ('split', 'Split & Update Registered Pipeline');
insert ignore into Permissions (code, name) values ('swap', 'Swap pipeline');
insert ignore into Permissions (code, name) values ('wonlost', 'Won & Lost Pipeline Register');
insert ignore into Permissions (code, name) values ('savenprt', 'Reports Saving & Print by User');
insert ignore into Permissions (code, name) values ('dataacess', 'Pipeline Data Access');

insert ignore into Permissions (code, name) values ('dashboard', 'Dashboard');
insert ignore into Permissions (code, name) values ('dashdet', 'Details of Dashboard');
insert ignore into Permissions (code, name) values ('kpi', 'KPIs');
insert ignore into Permissions (code, name) values ('actpreg', 'Active Pipeline Register');
insert ignore into Permissions (code, name) values ('dorpreg', 'Dormant Pipeline Register');
insert ignore into Permissions (code, name) values ('piplcycle', 'Pipeline Life Cycle');
insert ignore into Permissions (code, name) values ('wnlpreg', 'Won & Lost Pipeline Register');
insert ignore into Permissions (code, name) values ('agerep', 'Aging Report');


CREATE TABLE IF NOT EXISTS `Users` (
  `id` SERIAL NOT NULL,
  `username` VARCHAR(50) NOT NULL,
  `loginid` VARCHAR(50) NOT NULL,
  `password` VARCHAR(1000) NOT NULL,
  `status` int not null default 2,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_UNIQUE` (`loginid` ASC) )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `UserRole` (
  `id` SERIAL NOT NULL,
  `userid` int not null,
  `typeid` int not null,
  PRIMARY KEY (`id`)
--   FOREIGN KEY (`userid`) REFERENCES Users(`id`) ON DELETE CASCADE,
--  FOREIGN KEY (`typeid`) REFERENCES UserType(`id`) ON DELETE CASCADE
) ENGINE = InnoDB;

-- User Permission table
CREATE TABLE IF NOT EXISTS `UserPermissions` (
  `id` SERIAL NOT NULL,
  `userid` bigint not null,
  `permid` bigint not null,
  PRIMARY KEY (`id`))
  -- FOREIGN KEY (permid) REFERENCES Permissions(id),
  -- FOREIGN KEY (userid) REFERENCES Users(id),
ENGINE = InnoDB;

-- Custromer table
CREATE TABLE IF NOT EXISTS `Customers` (
  `id` SERIAL NOT NULL,
  `code` VARCHAR(30) NOT NULL,
  `name` VARCHAR(150) NOT NULL,
  `location` varchar(150),
  `country` varchar(100),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC) )
ENGINE = InnoDB;

-- Custromer table
CREATE TABLE IF NOT EXISTS `Pipeline` (
  `id` SERIAL NOT NULL,
  `code` VARCHAR(30) NOT NULL,
  `revision` VARCHAR(30) NOT NULL,
  `customer` bigint NOT NULL,
  `custname` varchar(150) not null,
  `custlocation` varchar(150),
  `custcountry` varchar(100),
  `description` TEXT,
  PRIMARY KEY (`id`),
  -- FOREIGN KEY (customer) REFERENCES Customers(id),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC) )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Pipelinedetails` (
	`id` SERIAL NOT NULL,
    `pid` bigint not null,
    `leadeng` bigint not null,
    `status` bigint not null,
    `geography` VARCHAR(50),
    `type` bigint NOT NULL,
    `value` decimal(10,2) not null,
    `segment` bigint not null,
    `winprob` bigint not null,
    `oexpected` date,
    `dexpected` date,
    `qstatus` bigint not null,
    `qnumber` varchar(50),
    `pdate` date,
    `notes` text,
    PRIMARY KEY (`id`)
	-- FOREIGN KEY (pid) REFERENCES Pipeline(id),
    -- FOREIGN KEY (leadeng) REFERENCES Users(id)
)
ENGINE = InnoDB;
