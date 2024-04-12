CREATE TABLE stroageType (
  storage_tid mediumint(8) unsigned NOT NULL auto_increment,
  storage_type varchar(255) default NULL,
  PRIMARY KEY (storage_tid)
) AUTO_INCREMENT=1;

INSERT INTO stroageType (storage_type)
VALUES
  ('Fuel'),
  ("Food"),
  ("Hardware Parts"),
  ("Fuel"),
  ("Water"),
  ("Substances"),  
  ("Water"),
  ("Research Tools"),
  ("General Storage"),
  ("Biomedical Storage");
  
  CREATE TABLE stroageAmount (
  storage_aid mediumint(8) unsigned NOT NULL auto_increment,
  storage_amount varchar(255) default NULL,
  PRIMARY KEY (storage_aid)
) AUTO_INCREMENT=1;

INSERT INTO stroageAmount (storage_amount)
VALUES
  (5),
  (3),
  (1),
  (3),
  (9),
   (2),
  (2),
  (2),
  (3),
  (3);
  
      CREATE TABLE storageLeft (
storage_container_id mediumint(8) unsigned NOT NULL auto_increment,
storage_tid mediumint(8) unsigned,
storage_aid mediumint(8) unsigned,
resources_left mediumint(8),
    
	PRIMARY KEY (storage_container_id),
    foreign key (storage_tid) references stroageType (storage_tid),
    foreign key (storage_aid) references stroageAmount (storage_aid));
    
    
    INSERT INTO storageLeft (storage_tid,storage_aid,resources_left)
VALUES

 (1,9,4),
  (5,5,2),
  (7,6,1),
  (2,4,2),
  (6,7,5),
  (9,2,2),
  (3,1,2),
  (4,3,1),
  (8,10,3),
  (10,8,3);
  
  
  CREATE TABLE facility (
facility_id mediumint(8) unsigned NOT NULL auto_increment,
	facility_whereabouts mediumint(8), /* 1 is for indoor,2 for outdoor*/
	distance_to_base mediumint(8),
	fac_purpose varchar(255),
	PRIMARY KEY (facility_id));
    
        INSERT INTO facility (facility_whereabouts,distance_to_base,fac_purpose)
VALUES
  (2,12,'Storage Unit 1'),
  (1,0,'Resarch Centre 1'),
  (1,0,'Living Space 1'),
  (2,1,'Rover Storage'),
  (1,0,'Hospital'),
  (1,0,'System Mainframe'),
  (2,15,'Storage Unit 2'),
  (2,6,'Resarch Centre 2'),
  (2,10,'Research Centre 3'),
  (1,0,'Living Space 2');
  
  CREATE TABLE storageLocations (
facility_id mediumint(8) unsigned,
storage_container_id mediumint(8) unsigned,
    
	PRIMARY KEY (facility_id,storage_container_id),
    foreign key (facility_id) references facility (facility_id),
    foreign key (storage_container_id) references storageLeft (storage_container_id));
    
    
    
        INSERT INTO storageLocations (storage_container_id,facility_id)
VALUES


   (1,7),
  (5,1),
  (7,3),
  (2,7),
  (6,1),
  (9,1),
  (3,1),
  (4,1),
  (8,7),
  (10,7);
  
 /* The Italian astronaut is very hungry, but he knows he must be conservative on food, so he checks how much kg of food they have!*/  

  SELECT resources_left,storage_type FROM storageleft NATURAL JOIN stroageType WHERE storage_type='food';