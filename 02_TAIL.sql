
insert into TypeCode
(typeName,order,value,shortDescription,longDescription,created_dt,created_by)
VALUES
('EnumRoadEvents',0,'ACC','Traffic Accident','Traffic Accident',getdate(),'initial data'),
('EnumRoadEvents',1,'FIR','Fire','Fire',getdate(),'initial data'),
('EnumRoadEvents',2,'ROB','Robberie','Robberie',getdate(),'initial data'),

('EnumDObjectTypes',0,'CAR','Car','Regular Car',getdate(),'initial data'),
('EnumDObjectTypes',1,'VAN','Van','Van',getdate(),'initial data'),
('EnumDObjectTypes',2,'TRK','Truck','Truck',getdate(),'initial data'),
('EnumDObjectTypes',3,'TRL','Trailer','Trailer',getdate(),'initial data'),
('EnumDObjectTypes',4,'BUS','Bus','Bus',getdate(),'initial data'),
('EnumDObjectTypes',5,'MOT','Motorbike','Motorbike',getdate(),'initial data'),
('EnumDObjectTypes',6,'BIC','Bicycle','Bicycle',getdate(),'initial data'),
('EnumDObjectTypes',7,'HEQ','Heavy Equipment','Heavy Equipment',getdate(),'initial data'),
('EnumDObjectTypes',8,'CTR','Car Trailer','Car Trailer',getdate(),'initial data'),
('EnumDObjectTypes',9,'TRC','Tractor','Tractor',getdate(),'initial data'),
('EnumDObjectTypes',10,'PDS','Pedestrians','Pedestrians',getdate(),'initial data'),

('EnumRoadConditions',0,'DRY','Dry','Road is clear',getdate(),'initial data'),
('EnumRoadConditions',1,'MST','Moist','Road seems not to be dry nor wet and no water reflections',getdate(),'initial data'),
('EnumRoadConditions',2,'WET','Moist','All road is wet and visible water reflections',getdate(),'initial data'),
('EnumRoadConditions',3,'WAS','Wet & Salty','Road is wet and there are traces of after snowfall',getdate(),'initial data'),
('EnumRoadConditions',4,'FRS','Frost','Snow on road and you can find a special texture',getdate(),'initial data'),
('EnumRoadConditions',5,'SNW','Snow','All road area or majority of it is covered by snow',getdate(),'initial data'),
('EnumRoadConditions',6,'ICE','Ice','Visibile continues lines on snowy road',getdate(),'initial data'),
('EnumRoadConditions',7,'PMS','Probably moist/salty','Same as moist condition but with traces after snowfall',getdate(),'initial data'),
('EnumRoadConditions',8,'SLH','Slushy','Road is covered in mud like the Ice condition but when its brown',getdate(),'initial data'),

('EnumWeatherConditions',0,'CLR','Clear','Clear',getdate(),'initial data'),
('EnumWeatherConditions',1,'WRN','Weak rain','Weak rain',getdate(),'initial data'),
('EnumWeatherConditions',2,'MRN','Mediocre rain','Mediocre rain',getdate(),'initial data'),
('EnumWeatherConditions',3,'HRN','Heavy rain','Heavy rain',getdate(),'initial data'),
('EnumWeatherConditions',4,'WSN','Weak snow/sleet','Weak snow/sleet',getdate(),'initial data'),
('EnumWeatherConditions',5,'MSN','Mediocre snow/sleet','Mediocre snow/sleet',getdate(),'initial data'),
('EnumWeatherConditions',6,'HSN','Heavy snow/sleet','Heavy snow/sleet',getdate(),'initial data'),

('EnumVerificationResults',0,'POS','Positive','Positive',getdate(),'initial data'),
('EnumVerificationResults',1,'NEG','Negative','Negative',getdate(),'initial data'),

('EnumFileTypes',0,'IMG','Image','Image',getdate(),'initial data'),
('EnumFileTypes',1,'CAD','CAD Drawing','CAD Drawing',getdate(),'initial data'),

('EnumUserLevels',0,'ADM','Administrator','Administrator',getdate(),'initial data'),
('EnumUserLevels',1,'SUS','Super User','Super User',getdate(),'initial data'),
('EnumUserLevels',2,'USR','User','User',getdate(),'initial data'),

('EnumLicenseTypes',0,'REG','Regular License','Regular License',getdate(),'initial data'),

('EnumAlgorithmClasses',0,'NN','Neural Network','Neural Network',getdate(),'initial data'),
('EnumAlgorithmClasses',1,'ML','Machine Learning','Machine Learning',getdate(),'initial data'),


('EnumAlgorithmStatuses',0,'ITR','In Training','Training in progress',getdate(),'initial data'),
('EnumAlgorithmStatuses',1,'ERR','Error','Error',getdate(),'initial data'),
('EnumAlgorithmStatuses',2,'CMP','Training Completed','Training Completed',getdate(),'initial data'),
('EnumAlgorithmStatuses',3,'DPL','Deployed','Deployed',getdate(),'initial data'),

('EnumDeviceTypes',0,'ECU','ECU','ECU',getdate(),'initial data'),
('EnumDeviceTypes',1,'IDE','idev','idev',getdate(),'initial data'),
('EnumDeviceTypes',2,'MDE','mdev','mdev',getdate(),'initial data')
