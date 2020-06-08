
insert into TypeCode
(typeName,orderby,value,shortDescription,longDescription,created_dt,created_by)
VALUES
('EnumRoadEvents',0,'ACC','Traffic Accident','Traffic Accident',now(),'initial data'),
('EnumRoadEvents',1,'FIR','Fire','Fire',now(),'initial data'),
('EnumRoadEvents',2,'ROB','Robberie','Robberie',now(),'initial data'),

('EnumDObjectTypes',0,'CAR','Car','Regular Car',now(),'initial data'),
('EnumDObjectTypes',1,'VAN','Van','Van',now(),'initial data'),
('EnumDObjectTypes',2,'TRK','Truck','Truck',now(),'initial data'),
('EnumDObjectTypes',3,'TRL','Trailer','Trailer',now(),'initial data'),
('EnumDObjectTypes',4,'BUS','Bus','Bus',now(),'initial data'),
('EnumDObjectTypes',5,'MOT','Motorbike','Motorbike',now(),'initial data'),
('EnumDObjectTypes',6,'BIC','Bicycle','Bicycle',now(),'initial data'),
('EnumDObjectTypes',7,'HEQ','Heavy Equipment','Heavy Equipment',now(),'initial data'),
('EnumDObjectTypes',8,'CTR','Car Trailer','Car Trailer',now(),'initial data'),
('EnumDObjectTypes',9,'TRC','Tractor','Tractor',now(),'initial data'),
('EnumDObjectTypes',10,'PDS','Pedestrians','Pedestrians',now(),'initial data'),

('EnumRoadConditions',0,'DRY','Dry','Road is clear',now(),'initial data'),
('EnumRoadConditions',1,'MST','Moist','Road seems not to be dry nor wet and no water reflections',now(),'initial data'),
('EnumRoadConditions',2,'WET','Moist','All road is wet and visible water reflections',now(),'initial data'),
('EnumRoadConditions',3,'WAS','Wet & Salty','Road is wet and there are traces of after snowfall',now(),'initial data'),
('EnumRoadConditions',4,'FRS','Frost','Snow on road and you can find a special texture',now(),'initial data'),
('EnumRoadConditions',5,'SNW','Snow','All road area or majority of it is covered by snow',now(),'initial data'),
('EnumRoadConditions',6,'ICE','Ice','Visibile continues lines on snowy road',now(),'initial data'),
('EnumRoadConditions',7,'PMS','Probably moist/salty','Same as moist condition but with traces after snowfall',now(),'initial data'),
('EnumRoadConditions',8,'SLH','Slushy','Road is covered in mud like the Ice condition but when its brown',now(),'initial data'),

('EnumWeatherConditions',0,'CLR','Clear','Clear',now(),'initial data'),
('EnumWeatherConditions',1,'WRN','Weak rain','Weak rain',now(),'initial data'),
('EnumWeatherConditions',2,'MRN','Mediocre rain','Mediocre rain',now(),'initial data'),
('EnumWeatherConditions',3,'HRN','Heavy rain','Heavy rain',now(),'initial data'),
('EnumWeatherConditions',4,'WSN','Weak snow/sleet','Weak snow/sleet',now(),'initial data'),
('EnumWeatherConditions',5,'MSN','Mediocre snow/sleet','Mediocre snow/sleet',now(),'initial data'),
('EnumWeatherConditions',6,'HSN','Heavy snow/sleet','Heavy snow/sleet',now(),'initial data'),

('EnumVerificationResults',0,'POS','Positive','Positive',now(),'initial data'),
('EnumVerificationResults',1,'NEG','Negative','Negative',now(),'initial data'),

('EnumFileTypes',0,'IMG','Image','Image',now(),'initial data'),
('EnumFileTypes',1,'CAD','CAD Drawing','CAD Drawing',now(),'initial data'),

('EnumUserLevels',0,'ADM','Administrator','Administrator',now(),'initial data'),
('EnumUserLevels',1,'SUS','Super User','Super User',now(),'initial data'),
('EnumUserLevels',2,'USR','User','User',now(),'initial data'),

('EnumLicenseTypes',0,'REG','Regular License','Regular License',now(),'initial data'),

('EnumAlgorithmClasses',0,'NN','Neural Network','Neural Network',now(),'initial data'),
('EnumAlgorithmClasses',1,'ML','Machine Learning','Machine Learning',now(),'initial data'),


('EnumAlgorithmStatuses',0,'ITR','In Training','Training in progress',now(),'initial data'),
('EnumAlgorithmStatuses',1,'ERR','Error','Error',now(),'initial data'),
('EnumAlgorithmStatuses',2,'CMP','Training Completed','Training Completed',now(),'initial data'),
('EnumAlgorithmStatuses',3,'DPL','Deployed','Deployed',now(),'initial data'),

('EnumDeviceTypes',0,'ECU','ECU','ECU',now(),'initial data'),
('EnumDeviceTypes',1,'IDE','idev','idev',now(),'initial data'),
('EnumDeviceTypes',2,'MDE','mdev','mdev',now(),'initial data')
