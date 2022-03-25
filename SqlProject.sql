--Delete Tables

PRAGMA foreign_keys = OFF;
Drop TABLE if exists demo;
Drop TABLE if EXISTS owner;
Drop TABLE if EXISTS client;
Drop TABLE if EXISTS staff;
drop TABLE if EXISTS property;
drop TABLE if EXISTS estate_agent;
drop TABLE if EXISTS offer;
drop TABLE if EXISTS viewings;

PRAGMA foreign_keys = ON;

CREATE TABLE owner(
owner_id int(10) PRIMARY KEY
,first_name varchar(100),
last_name varchar(100),
phone varchar(25),
street_address varchar(400),
postcode varchar(10),
city varchar(100)
 );
  

CREATE TABLE estate_agent(
estateagent_id int(10) PRIMARY KEY
,company_name varchar(300),
phone varchar(25),
street_address varchar(400),
postcode varchar(10),
city varchar(100)
 );
 
 
 CREATE TABLE client(
client_id int(10) PRIMARY KEY
,first_name varchar(100),
    lastname varchar(100),
phone varchar(25),
street_address varchar(400),
postcode varchar(10),
city varchar(100)
 );
  
  
 CREATE TABLE staff(
staff_id int(10) PRIMARY KEY
,first_name varchar(100),
last_name varchar(100),
phone varchar(25),
dob date ,
 salaray decimal(10,2),
street_address varchar(400),
postcode varchar(10),
city varchar(100)
 );
 

create TABLE property(
  property_id int(10) PRIMARY key,
  street_address varchar(400),
postcode varchar(10),
city varchar(100),
property_value decimal(20,2),
  property_type varchar(50),
  property_status varchar(50),
  owner_id int(10),
  estateagent_id int(10),
  FOREIGN KEY (owner_id) REFERENCES owner(owner_id)
   FOREIGN KEY (estateagent_id) REFERENCES estate_agent(estateagent_id)
);

  Create table offer(
    offer_id int(10) primary key ,
  offer_amount decimal(20,2),
    offer_date date,
    offer_time time,
    offer_status varchar(25),
    property_id int(10),
    client_id int(10),
   FOREIGN KEY (property_id) REFERENCES property(property_id),
   FOREIGN KEY (client_id) REFERENCES client(client_id)
);
  
    
    CREATE table viewings(
      viewing_id integer PRIMARY KEY AUTOINCREMENT,
      viewing_date date,
      viewing_time time,
      staff_id int(10),
      property_id int(10),
      client_id int(10),
      FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
   FOREIGN KEY (client_id) REFERENCES client(client_id),
     FOREIGN KEY (property_id) REFERENCES property(property_id)
);
   
  
  
-- Data Entry
Insert INTO owner
VALUES(1,	'Bibi',	'Treversh'	,	'0391856306',	'140 Hallows Park',	'Manchester',	'M17 3SA'),
(2	,'Katina',	'Priestland',	'0179520034',	'32 Brown Plaza',	'Manchester',	'M12 3BQ'),
(3	,'Karee',	'Drain',	'0855444631', '83 Elgar Way',	'Leeds','LS21 4GH'),
(4, 'Emmeline', 'Andrysiak' ,	'0452895298',	'58 Sheridan Court' ,	'Bradford'	,'B29 4YJ'),
(5	,'Micky',	'Josephs' , '0278642281','43 Scott Place',	'Manchester' ,'M21 5SD');

INSERT INTO staff(staff_id,first_name,last_name,dob,phone,street_address,city,postcode,salaray)
 VALUES(1,	'Amity',	'Grewe',	'2001-11-28',	'07591633241',	'65 Ramsey Plaza',	'Manchester',	'M18 7BA',	24680.62),
(2	,'Darsie',	'Dance',	'2001-03-28'	,'07558969414',	'17 Haas Point',	'Manchester',	'M25 3GH',	27453.25),
(3,	'Heywood',	'Westcot',	'2002-01-09','07412563258',	'63 Carpenter Parkway',	'Salford',	'M6 7JK',	21500.33),
(4,	'Deanna',	'Eborn',	'1995-07-22',	'07963852741',	'3 Northwestern Junction',	'Stockport',	'SK6 7NF',	26356.33),
(5,	'Ced',	'Yetton',	'1993-07-10'	,'07365214895',	'6 Browning Road',	'Knutsofrd',	'WA14 4XA',	34121.91);

INSERt into client(client_id,first_name, lastname, phone, street_address,city, postcode)
 VALUES(1,	'Carissa',	'Cawdery',	'07528639417',	'66 Monterey Centre',	'London',	'SE11 1DR'),
(2,	'Giselle',	'Hollindale',	'07412356956',	'58 Tennyson Street',	'Newcastle',	'N4 9PU'),
(3,	'Nevsa',	'Dutnell',	'07951753852',	'31 Banding Trail',	'Manchester',	'M1 2WC'),
(4,	'Amii',	'Grenkov',	'07489156723',	'79 Clove Street',	'Manchester',	'M20 4BG'),
(5,	'Hiram',	'Dunford', '07935716284',	'19 Charing Cross Place',	'Leeds'	, 'LS6 6FF');

Insert into estate_agent(estateagent_id, company_name, phone, street_address, city, postcode)
 VALUES (1,	'Hills-Beatty'	,'0161252658',	'19 Algoma Street',	'Manchester',	'M23 4BN'),
(2,	'Christiansen-Heaney',	'0161231415',	'533 Sage Circle',	'Cardiff',	'CF24 4XA'),
(3,	'Buckridge-Bartoletti',	'0161251365',	'1 Caliangt Avenue',	'Leeds',	'L49 4LK'),
(4,	'Boyer LLC',	'0161897654',	'28 Express Point',	'Manchester',	'M18 4VC'),
(5,	'Swaniawski Inc',	'0161235478',	'6 Merchant Avenue',	'Manchester',	'M5 3GR');

INSERT into property(property_id,street_address,city,postcode,property_type,property_value,property_status,owner_id,estateagent_id)
VALUES(1,'28 Kinsman Hill',	'Manchester',	'M20 9WR',	'house',	272867.00	,'sold',	2,	1);

INSERT into property(property_id,street_address,city,postcode,property_type,property_value,property_status,owner_id,estateagent_id)
VALUES(2, '77 Nobel Parkway',	'London',	'SE15 2RP',	'commercial',	175780.00,	'not sold',	3,	1);
;
INSERT into property(property_id,street_address,city,postcode,property_type,property_value,property_status,owner_id,estateagent_id)
VALUES(3,	'4 Rockefeller Crossing',	'Manchester',	'M12 6BN',	'house',	287429.00,	'not sold',	5	,2)	;

INSERT into property(property_id,street_address,city,postcode,property_type,property_value,property_status,owner_id,estateagent_id)
VALUES(4,	'2 Junction',	'Leeds',	'LS9 5KL',	'house',	268249.00	, 'not sold',	1,	3);

INSERT into property(property_id,street_address,city,postcode,property_type,property_value,property_status,owner_id,estateagent_id)
VALUES(5,	'7 Basil Hill',	'Manchester',	'M1 1PS',	'commercial',	204854.00,	'sold',	1,	3);

INSERT into property(property_id,street_address,city,postcode,property_type,property_value,property_status,owner_id,estateagent_id)
VALUES(6,	'6 Mitchell Court',	'Manchester',	'M50 9AH',	'house',	231120.00,	'not sold',	2,	5);

INSERT into property(property_id,street_address,city,postcode,property_type,property_value,property_status,owner_id,estateagent_id)
VALUES(7,	'64 Crescent Oaks Alley',	'Liverpool',	'L3 3ZA',	'house',	300000.00,	'not sold',	3	,5	);

INSERT into property(property_id,street_address,city,postcode,property_type,property_value,property_status,owner_id,estateagent_id)
VALUES(8,	'8 Logan Pass',	'Liverpool','L4 8DF', 'house',	160756.00,	'sold'	,4	,3	);

INSERT into property(property_id,street_address,city,postcode,property_type,property_value,property_status,owner_id,estateagent_id)
VALUES(9,	'83 Service Court',	'Manchester',	'M25 9BM',	'house',	194358.00,	'sold',	1,	4);

INSERT into property(property_id,street_address,city,postcode,property_type,property_value,property_status,owner_id,estateagent_id)
VALUES
(10
 ,'9 Golf Pass'
 ,	'Manchester'
 ,	'M17 4QE'
 ,'house'
 ,274822.00
 ,'not sold'
 ,2,
 3);
INSERT into offer(offer_id,	offer_amount,	offer_status, offer_date, offer_time,property_id, client_id)
VALUES(1,237350.09,	"Accepted",	'2020-10-07',	'20:51:30',1,5),
(2,	167667.27,	"Not Accepted",	'2020-10-08',	'23:27:40',2,2),
(3,	174990.51,	'Not Accepted',	'2020-10-08',	'10:32:12',2,3),
(4,	231261.71,	'Accepted',	'2020-10-09',	'12:06:28',5,1),
(5,	215716.17,	'Accepted',	'2020-10-08',	'22:38:33',4,4),
(6,	171437.58,	'Not Accepted',	'2020-10-08',	'7:29:20',2,1),
(7,	240183.82,	'Accepted',	'2020-10-08',	'11:32:29',3,2),
(8,	269592.57,	'Accepted',	'2020-10-07',	'10:22:43',2,2),
(9,	177028.21,	'Not Accepted',	'2020-10-07',	'10:48:50',3,5),
(10, 247666.22,	'Accepted',	'2020-10-07',	'8:13:59', 4,3);

INSERT into viewings(viewing_date, viewing_time,property_id,staff_id,client_id)
VALUES 
('2020-07-09',	'20:13:06', 1,1,5),
('2020-10-07',	'14:36:41',2,3,1),
('2020-10-07',	'15:01:06',2,3,2),
('2020-08-09',	'14:21:19',3,4,4),
('2020-12-07',	'14:36:50', 4,5,1),
('2020-12-08',	'14:25:37', 4,5	,3),
('2020-07-09',	'21:41:14',	5,2,4 ),
('2020-10-09',	'17:55:42', 5,3,4 ),
('2020-10-07',	'13:20:09', 1,3,4),
('2020-11-08',	'13:22:21', 2,4,2);




