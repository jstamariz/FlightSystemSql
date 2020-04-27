CREATE PROCEDURE CreateAircraft

@AircraftManufacturer int, 
@AircraftModel varchar(45), 
@Seats int

AS

SET NOCOUNT ON

BEGIN
	-- Creando el nuevo avion en la tabla Aircraft
	INSERT INTO Aircraft(Model,aircraft_manufacturer_ID)
	VALUES(@AircraftModel,@AircraftManufacturer)

	-- Creando asientos
	DECLARE @asientosEconomicos INT
	DECLARE @asientosNegocios INT
	DECLARE @asientosPC INT

	SET @asientosEconomicos = (ROUND((@seats * 0.6), 1))
	SET @asientosNegocios = (ROUND((@seats * 0.2), 0))
	SET @asientosPC = (ROUND((@seats * 0.2), 0))

	DECLARE @COUNT INT
	SET @COUNT = 1

	DECLARE @CurrentAircraftID INT

	SELECT TOP 1 @CurrentAircraftID = Aircraft_ID FROM Aircraft WHERE @AircraftModel = Model ORDER BY Aircraft_ID DESC

	WHILE (@COUNT <= @asientosEconomicos)
	BEGIN
		INSERT INTO AircraftSeat(aircraft_ID,travel_class_ID)
		VALUES(@CurrentAircraftID,1)
		SET @COUNT = @COUNT + 1
	END

	SET @COUNT = 1

		WHILE (@COUNT <= @asientosNegocios)
	BEGIN
		INSERT INTO AircraftSeat(aircraft_ID,travel_class_ID)
		VALUES(@CurrentAircraftID,2)
		SET @COUNT = @COUNT + 1
	END

	SET @COUNT = 1

		WHILE (@COUNT <= @asientosPC)
	BEGIN
		INSERT INTO AircraftSeat(aircraft_ID,travel_class_ID)
		VALUES(@CurrentAircraftID,3)
		SET @COUNT = @COUNT + 1
	END
END