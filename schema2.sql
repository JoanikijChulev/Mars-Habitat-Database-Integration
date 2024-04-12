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
  
  CREATE TABLE energyProd (
energy_pid mediumint(8) unsigned NOT NULL auto_increment,
energy_amount mediumint(8), /* in percent*/
	energy_type varchar(255),
    
	PRIMARY KEY (energy_pid));
    
    INSERT INTO energyProd (energy_amount,energy_type)
VALUES
 (17,"Nuclear"),
  (7,"Nuclear"),
  (1,"Wind "),
  (13,"Solar"),
  (20,"Nuclear"),
    (0,"Wind "),
  (2,"Wind"),
  (17,"Nuclear"),
  (20,"Nuclear"),
  (2,"Solar");
  
  
  CREATE TABLE energyNeed (
energy_nid mediumint(8) unsigned NOT NULL auto_increment,
energy_need mediumint(8), /* in percent*/
    
	PRIMARY KEY (energy_nid));
    
    INSERT INTO energyNeed (energy_need)
VALUES
 (8),
  (11),
  (11),
  (1),
  (5),
    (7),
  (10),
  (8),
  (7),
  (11);
  
    CREATE TABLE facEnergyOutcome (
facility_id mediumint(8) unsigned,
energy_pid mediumint(8) unsigned,
energy_nid mediumint(8) unsigned,
    
	PRIMARY KEY (facility_id,energy_pid,energy_nid),
    foreign key (facility_id) references facility (facility_id),
    foreign key (energy_pid) references energyProd (energy_pid),
    foreign key (energy_nid) references energyNeed (energy_nid));
    
     INSERT INTO facEnergyOutcome (facility_id,energy_pid,energy_nid)
VALUES
 (9,9,8),
  (5,5,4),
  (7,6,1),
  (2,4,3),
  (10,7,5),
  (1,2,9),
  (3,1,2),
  (4,3,6),
  (8,10,7),
  (6,8,10);
  
  create table faultyFacTech (
  SELECT DISTINCT facility_id FROM facenergyoutcome NATURAL JOIN energyprod NATURAL JOIN energyneed WHERE energy_need>energy_amount);
  
    /*The chemist wants to know which facilities need >10% of the total energy to fucntion!*/
     SELECT DISTINCT facility_id FROM facenergyoutcome NATURAL JOIN energyneed WHERE energy_need>10;