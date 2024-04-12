
CREATE TABLE educations (
  education_id mediumint(8) unsigned NOT NULL auto_increment,
  education varchar(255) default NULL,
  PRIMARY KEY (education_id)
) AUTO_INCREMENT=1;

INSERT INTO educations (education)
VALUES
  ("Chemistry"),
  ("Physics"),
  ("Ecology"),
  ("Medicine"),
  ("Robotics"),
  ("General"),
  ("Maths"),
  ("Astronomy"),
  ("IT"),
  ("Managment");
  
  CREATE TABLE crewMember (
  member_id mediumint(8) unsigned NOT NULL auto_increment,
  name varchar(255) default NULL,
  country varchar(100) default NULL,
  novice_astronaut varchar(255) default NULL,
   age mediumint default NULL,
  PRIMARY KEY (member_id)
) AUTO_INCREMENT=1;

INSERT INTO crewMember (name,country,novice_astronaut,age)
VALUES
  ("Chantale","Philippines","Yes",41),
  ("Josephine","China","No",55),
  ("Nigel","Belgium","No",63),
  ("Candace","Turkey","No",65),
  ("Emery","Ukraine","No",40),
  ("Leilani","Canada","Yes",64),
  ("Prescott","Russian Federation","No",66),
  ("Berk","Nigeria","No",22),
  ("Emi","New Zealand","Yes",48),
  ("Hashim","Norway","No",23),
  ("Courtney","Russian Federation","No",27),
  ("Reece","Sweden","No",25),
  ("Aphrodite","Spain","Yes",29),
  ("Alma","Vietnam","Yes",27),
  ("Miranda","Spain","No",33),
  ("Christopher","Australia","No",36),
  ("Kelly","Sweden","Yes",23),
  ("Lucian","Ukraine","No",37),
  ("Evan","Italy","No",34),
  ("Chastity","Australia","No",60);
  
    CREATE TABLE taskedWith (
	education_id mediumint(8)unsigned,
	member_id mediumint(8)unsigned,
	task varchar(255) default NULL,
	PRIMARY KEY (education_id,member_id),
  	 foreign key (education_id) references educations (education_id)
     		on delete cascade,
	 foreign key (member_id) references crewMember (member_id) on delete cascade
);

INSERT INTO taskedWith (education_id,member_id,task)
VALUES
(3,1,'Indoor Ecosystem control'),
(1,2,'Research'),
(3,3,'Outdoor Ecosystem Evaluatoin'),
(2,4,'Research'),
(7,5,'Research'),
(4,6,'Crew Health'),
(4,7,'Crew Health'),
(8,8,'Research'),
(3,9,'Outdoor Ecosystem Evaluatoin'),
(8,10,'Research'),
(4,11,'Crew Health'),
(3,12,'Indoor Ecosystem control'),
(5,13,'Rover Maintnance'),
(9,14,'System Maintnance'),
(1,15,'Research'),
(5,16,'Rover Maintnance'),
(6,17,'Help'),
(6,18,'Help'),
(9,19,'System Maintnance'),
(10,20,'Team Managment');

 CREATE TABLE facility (
	facility_whereabouts mediumint(8), /* 1 is for indoor,2 for outdoor*/
	distance_to_base mediumint(8),
	fac_purpose varchar(255),
	PRIMARY KEY (fac_purpose));
    
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

      CREATE TABLE workGroups (
	group_id mediumint(8),
       member_id mediumint(8)unsigned,
	fac_purpose varchar(255),
	PRIMARY KEY (member_id),
    foreign key (member_id) references crewMember (member_id),
  	 foreign key (fac_purpose) references facility (fac_purpose)
);

    INSERT INTO workGroups (group_id,member_id,fac_purpose)
VALUES
      (1,6,'Hospital'),
      (1,7,'Hospital'),
      (1,11,'Hospital'),
	  (2,5,'Resarch Centre 1'),
      (2,4,'Resarch Centre 1'),
      (2,15,'Resarch Centre 1'),
      (2,1,'Resarch Centre 1'),
      (2,12,'Resarch Centre 1'),
	  (3,3,'Resarch Centre 2'),
       (3,9,'Resarch Centre 2'),
        (3,2,'Resarch Centre 2'),
        (4,8,'Research Centre 3'),
        (4,10,'Research Centre 3'),
         (5,13,'System Mainframe'),
         (5,16,'System Mainframe'),
          (5,14,'System Mainframe'),
           (5,19,'System Mainframe');
           
           /*The Computer scientsit hasnt seen his crew in a week working on the system software, and he forgot who the youngest doctor was!
           This is the query */
           SELECT group_id,age,name FROM workGroups NATURAL JOIN crewmember WHERE fac_purpose='Hospital' AND age<30;