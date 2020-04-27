BEGIN TRAN
BEGIN TRY
--COMIENZAN LOS INSERTS

insert into Country(iata_country_code,name) values('DO','Rep. Domincana')
insert into Country(iata_country_code,name) values('CO','Colombia')
insert into Country(iata_country_code,name) values('CU','Cuba')
insert into Country(iata_country_code,name) values('MX','Mexico')
insert into Country(iata_country_code,name) values('CR','Costa Rica')
insert into Country(iata_country_code,name) values('JM','Jamaica')
insert into Country(iata_country_code,name) values('EC','Ecuador')
insert into Country(iata_country_code,name) values('PR','Puerto Rico')
insert into Country(iata_country_code,name) values('IT','Italia')
insert into Country(iata_country_code,name) values('GT','Guatemala')


insert into Airport(iata_airport_code,Name,City,iata_country_code) values('SDQ','Aeropuerto Internacional de Las América','Santo Domingo','DO')
insert into Airport(iata_airport_code,Name,City,iata_country_code) values('AXM','Aeropuerto Internacional El Edén','Armenia','CO')
insert into Airport(iata_airport_code,Name,City,iata_country_code) values('HAV','Aeropuerto Internacional José Martí','La Habana','CU')
insert into Airport(iata_airport_code,Name,City,iata_country_code) values('SJO','Aeropuerto Internacional Juan Santamaría','Alajuela','CR')
insert into Airport(iata_airport_code,Name,City,iata_country_code) values('UIO','Aeropuerto Internacional Mariscal Sucre','Quito','EC')
insert into Airport(iata_airport_code,Name,City,iata_country_code) values('KIN','Aeropuerto Internacional Norman Manley','Kingston','JM')
insert into Airport(iata_airport_code,Name,City,iata_country_code) values('SJU','Aeropuerto Internacional Luis Muñoz Marín','Carolia','PR')
insert into Airport(iata_airport_code,Name,City,iata_country_code) values('AZS','Aeropuerto Internacional Pdte. Juan Bosch','Samana','DO')
insert into Airport(iata_airport_code,Name,City,iata_country_code) values('LIN','Aeropuerto de Milán-Linate','Lombardia','IT')
insert into Airport(iata_airport_code,Name,City,iata_country_code) values('MEX','Aeropuerto Internacional de la Cd. de México','Ciudad de Mexico','MX')



insert into Client(First_Name,Middle_Name,Last_Name,Phone,Email,PassPort,iata_country_code) values('Scarlet','Petra','Johansom','8098182261','ScarletJ@gmail.com','S123456789','DO')
insert into Client(First_Name,Middle_Name,Last_Name,Phone,Email,PassPort,iata_country_code) values('Alison','Escarla','Hargreeves','8092526864','AlisonH@gmail.com','A123456789','CO')
insert into Client(First_Name,Middle_Name,Last_Name,Phone,Email,PassPort,iata_country_code) values('Antonio','Rafael','Portes','8291476532','RafaelC@gmail.com','R987654321','CU')
insert into Client(First_Name,Middle_Name,Last_Name,Phone,Email,PassPort,iata_country_code) values('Angels','Tomas','Marte','05145698741','AngelsM@gmail.com','A987654321','CR')
insert into Client(First_Name,Middle_Name,Last_Name,Phone,Email,PassPort,iata_country_code) values('Crystal','Micaela','Ortiz','0478251466','CrystalO@gmail.com','C678954321','EC')
insert into Client(First_Name,Middle_Name,Last_Name,Phone,Email,PassPort,iata_country_code) values('Yeimelin','Escarlet','Encarnación','8295596514','YeimelinE@hotmail.com','Y432156789','JM')
insert into Client(First_Name,Middle_Name,Last_Name,Phone,Email,PassPort,iata_country_code) values('Genesis','Valet','Santos','0857415698','GenesisS@hotmail.com','G543216789','PR')
insert into Client(First_Name,Middle_Name,Last_Name,Phone,Email,PassPort,iata_country_code) values('Ethan','Sebastian','Curet','8492586354','EthanC@gmail.com','E89765123','IT')
insert into Client(First_Name,Middle_Name,Last_Name,Phone,Email,PassPort,iata_country_code) values('Crisanyelis','Alba','Charles','8095471236','CrisanyelisC@hotmail.com','C432176589','DO')
insert into Client(First_Name,Middle_Name,Last_Name,Phone,Email,PassPort,iata_country_code) values('Mariano','Sharon','Carmona','0895647893','MarianoC@gmail.com','M2347617859','MX')



insert into Direction(origin_iata_airport_code,dest_iata_airport_code) values('SDQ','AXM')
insert into Direction(origin_iata_airport_code,dest_iata_airport_code) values('HAV','SJO')
insert into Direction(origin_iata_airport_code,dest_iata_airport_code) values('UIO','KIN')
insert into Direction(origin_iata_airport_code,dest_iata_airport_code) values('SJU','AZS')
insert into Direction(origin_iata_airport_code,dest_iata_airport_code) values('LIN','MEX')
insert into Direction(origin_iata_airport_code,dest_iata_airport_code) values('SJO','SDQ')
insert into Direction(origin_iata_airport_code,dest_iata_airport_code) values('AXM','UIO')
insert into Direction(origin_iata_airport_code,dest_iata_airport_code) values('AZS','LIN')
insert into Direction(origin_iata_airport_code,dest_iata_airport_code) values('AZS','KIN')
insert into Direction(origin_iata_airport_code,dest_iata_airport_code) values('AZS','UIO')
insert into Direction(origin_iata_airport_code,dest_iata_airport_code) values('KIN','UIO')
insert into Direction(origin_iata_airport_code,dest_iata_airport_code) values('MEX','AZS')


insert into AircraftManufacturer(Name) values('Airbus')
insert into AircraftManufacturer(Name) values('Boeing')
insert into AircraftManufacturer(Name) values('Embraer')
insert into AircraftManufacturer(Name) values('Bombardier')
insert into AircraftManufacturer(Name) values('Irkutsk')
insert into AircraftManufacturer(Name) values('Beechcraft')
insert into AircraftManufacturer(Name) values('Dassault')
insert into AircraftManufacturer(Name) values('Cessna')
insert into AircraftManufacturer(Name) values('Pilatus')
insert into AircraftManufacturer(Name) values('Piper')


INSERT INTO [dbo].[FlightStatus]
           ([Name])
     VALUES
           ('Activo'),('Abordando'),('Despegando'),('En el aire'),('Cancelado'),('Atrasado'),('Completado')


insert into TravelClass(Name, Description) 
values ('Economic','Base Class'),('Bussiness','20% more than economic'),('First Class','40% more than economic')

--MEDIANTE PROCEDIMIENTOS

exec CreateAircraft 1,'SuperDub',100
exec CreateAircraft 2,'GrowDep',150
exec CreateAircraft 4,'StompComb',150
exec CreateAircraft 5,'Adhoper',200
exec CreateAircraft 7,'BombScoup',125
exec CreateAircraft 9,'BOTW',250
exec CreateAircraft 3,'Arcano',50
exec CreateAircraft 10,'SpaceWolf',300
exec CreateAircraft 2,'AMCO',400
exec CreateAircraft 1,'Flash',100


exec CreateFlights 'SDQ','AXM','2020/01/01 11:00:00 AM','2020/01/02 01:00:00 PM',1,1,120
exec CreateFlights 'HAV','SJO','2020/03/29 12:00:00 PM','2020/01/30 02:00:00 AM',3,2,250
exec CreateFlights 'UIO','KIN','2020/04/20 01:00:00 PM','2020/01/21 03:00:00 AM',6,3,300
exec CreateFlights 'SJU','AZS','2020/02/16 02:00:00 AM','2020/01/17 04:00:00 PM',2,4,145
exec CreateFlights 'LIN','MEX','2020/06/14 10:00:00 PM','2020/01/15 05:00:00 AM',1,5,100
exec CreateFlights 'SJO','SDQ','2020/07/13 11:00:00 AM','2020/01/14 06:00:00 PM',4,5,50
exec CreateFlights 'AXM','UIO','2020/08/05 06:00:00 AM','2020/01/06 07:00:00 PM',6,7,350
exec CreateFlights 'AZS','LIN','2020/10/06 06:00:00 PM','2020/01/07 08:00:00 AM',7,8,175
exec CreateFlights 'KIN','UIO','2020/12/07 07:00:00 AM','2020/01/08 09:00:00 AM',3,9,210
exec CreateFlights 'MEX','AZS','2020/05/30 09:00:00 AM','2020/01/31 10:00:00 PM',1,9,159

exec BookFlight 1,1,2
exec BookFlight 2,2,113
exec BookFlight 3,3,268
exec BookFlight 4,4,420
exec BookFlight 5,5,644
exec BookFlight 6,6,720
exec BookFlight 7,7,1022
exec BookFlight 8,8,1065
exec BookFlight 9,8,1133
exec BookFlight 10,1,3

--FINALIZAN LOS INSERTS
COMMIT TRAN
END TRY
BEGIN CATCH
	ROLLBACK TRAN	
END CATCH