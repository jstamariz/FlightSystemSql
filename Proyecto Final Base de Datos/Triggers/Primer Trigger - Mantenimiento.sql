CREATE TRIGGER trg_Maintenance
ON dbo.FlightAircraftInstance
AFTER INSERT
AS
SET NOCOUNT ON
BEGIN
	-- Declarando Variables
	DECLARE @Aircraftid INT
	DECLARE @OriginAirport nvarchar(3)
	DECLARE @DestinyAirport nvarchar(3)
	
	--Obtieniendo Id Aircraft
	SELECT @Aircraftid = aircraft_ID FROM AircraftInstance A, inserted I 
	WHERE I.aircraft_instace_id = A.aircraft_instace_ID
	
	-- Obteniendo Aeropuerto de origen
	SELECT @OriginAirport = S.origin_iata_airport_code FROM Schedule S, Flight F, inserted I 
	WHERE I.Flight_call = F.Flight_call AND f.Schedule_ID = s.Schedule_ID

	--Obteniendo Aeropuerto de destino
	SELECT @DestinyAirport = S.dest_iata_airport_code FROM Schedule S, Flight F, inserted I 
	WHERE I.Flight_call = F.Flight_call AND f.Schedule_ID = s.Schedule_ID
	
	-- Haciendo Inserts en tabla de mantenimiento
	INSERT INTO Maintenance(AircraftID,FlightCall,OriginAirport,DestinyAirport)
	SELECT @Aircraftid, i.Flight_call, @OriginAirport,@DestinyAirport
	FROM inserted i
END