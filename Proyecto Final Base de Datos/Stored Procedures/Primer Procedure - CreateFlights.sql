CREATE PROCEDURE CreateFlights 
@originAirport NVARCHAR(3),
@destAirport NVARCHAR(3),
@departureTime DATETIME,
@arrivalTime DATETIME,
@flightStatus INT,
@aircraftID INT,
@economicSeatsprice MONEY

AS
SET NOCOUNT ON

BEGIN
	-- Creando Variables Necesarias
	DECLARE @CurrentScheduleID INT
	DECLARE @CurrentFlightID INT
	DECLARE @CurrentAIID INT
	DECLARE @CurrentAircraftSeats INT
	DECLARE @EconomicSeats INT
	DECLARE @BussinessSeats INT
	DECLARE @FSSeats INT
	DECLARE @COUNTER INT
	DECLARE @EconomicSeatsRangeID INT
	DECLARE @BussinessSeatsRangeID INT
	DECLARE @FCSeatsRangeID INT

	
	--Creando Calendario
	INSERT INTO Schedule(origin_iata_airport_code,dest_iata_airport_code,departure_time_gmt,arrival_time_gmt)
	VALUES(@originAirport,@destAirport,@departureTime,@arrivalTime)
	
	-- Seleccionando ID del calendario
	SELECT TOP 1 @CurrentScheduleID = Schedule_ID FROM Schedule 
	WHERE origin_iata_airport_code = @originAirport AND dest_iata_airport_code = @destAirport 
	AND departure_time_gmt = @departureTime AND arrival_time_gmt = @arrivalTime
	ORDER BY Schedule_ID DESC
	
	--Creando Vuelo en la tabla Flight
	INSERT INTO Flight(Schedule_ID,Flight_status_ID)
	VALUES(@CurrentScheduleID,1)

	--Creando Aircraft Instance
	INSERT INTO AircraftInstance(aircraft_ID)
	VALUES(@aircraftID)

	-- Seleccionando id Vuelo
	SELECT @CurrentFlightID = Flight_call FROM Flight
	WHERE Flight_status_ID = 1 AND Schedule_ID = @CurrentScheduleID
	ORDER BY Flight_call DESC

	-- Seleccionando ID Aircraft Instance
	SELECT @CurrentAIID = aircraft_instace_ID FROM AircraftInstance
	WHERE aircraft_ID = @aircraftID
	ORDER BY aircraft_instace_ID DESC
	
	--Creando Flight Aircraft Instance
	INSERT INTO FlightAircraftInstance(Flight_call,aircraft_instace_id)
	VALUES(@CurrentFlightID,@CurrentAIID)

	-- Seleccionando cantidad de asientos del Avion
	SELECT @CurrentAircraftSeats = COUNT(seat_ID) FROM AircraftSeat WHERE aircraft_ID = @aircraftID

	-- Seleccionando asientos economicos
	SELECT @EconomicSeats = COUNT(seat_ID) FROM AircraftSeat WHERE aircraft_ID = @aircraftID AND travel_class_ID = 1

	-- Seleccionando asientos de negocios
	SELECT @BussinessSeats = COUNT(seat_ID) FROM AircraftSeat WHERE aircraft_ID = @aircraftID AND travel_class_ID = 2
	
	-- Seleccionando asientos Primera Clase
	SELECT @FSSeats = COUNT(seat_ID) FROM AircraftSeat WHERE aircraft_ID = @aircraftID AND travel_class_ID = 3
	
	SET @COUNTER = 1

	--Creando Asientos y sus precios
		
		-- Asientos Economicos

		SELECT TOP 1 @EconomicSeatsRangeID = seat_ID FROM AircraftSeat 
		WHERE travel_class_ID = 1
		AND aircraft_ID = @aircraftID ORDER BY seat_ID ASC

		INSERT INTO FlightSeatPrice(Flight_call,air_craft_ID,seat_ID,price_usd)
		VALUES(@CurrentFlightID,@aircraftID, (@EconomicSeatsRangeID), @economicSeatsprice)

		WHILE(@COUNTER <= (@EconomicSeats - 1))
		BEGIN
			INSERT INTO FlightSeatPrice(Flight_call,air_craft_ID,seat_ID,price_usd)
			VALUES(@CurrentFlightID,@aircraftID, (@EconomicSeatsRangeID + @COUNTER), @economicSeatsprice)
			SET @COUNTER = @COUNTER + 1
		END

		-- Asientos De Negocios

		SET @COUNTER = 1

		SELECT TOP 1 @BussinessSeatsRangeID = seat_ID FROM AircraftSeat 
		WHERE travel_class_ID = 2
		AND aircraft_ID = @aircraftID ORDER BY seat_ID ASC

		INSERT INTO FlightSeatPrice(Flight_call,air_craft_ID,seat_ID,price_usd)
		VALUES(@CurrentFlightID,@aircraftID, (@BussinessSeatsRangeID), (@economicSeatsprice * 1.20))

		WHILE(@COUNTER <= (@BussinessSeats - 1))
		BEGIN
			INSERT INTO FlightSeatPrice(Flight_call,air_craft_ID,seat_ID,price_usd)
			VALUES(@CurrentFlightID,@aircraftID, (@BussinessSeatsRangeID + @COUNTER), (@economicSeatsprice * 1.20))
			SET @COUNTER = @COUNTER + 1
		END

		-- Asientos De Primera Clase

		SET @COUNTER = 1

		SELECT TOP 1 @FCSeatsRangeID = seat_ID FROM AircraftSeat 
		WHERE travel_class_ID = 3
		AND aircraft_ID = @aircraftID ORDER BY seat_ID ASC

		INSERT INTO FlightSeatPrice(Flight_call,air_craft_ID,seat_ID,price_usd)
		VALUES(@CurrentFlightID,@aircraftID, (@FCSeatsRangeID), (@economicSeatsprice * 1.40))

		WHILE(@COUNTER <= (@FSSeats - 1))
		BEGIN
			INSERT INTO FlightSeatPrice(Flight_call,air_craft_ID,seat_ID,price_usd)
			VALUES(@CurrentFlightID,@aircraftID, (@FCSeatsRangeID + @COUNTER), (@economicSeatsprice * 1.40))
			SET @COUNTER = @COUNTER + 1
		END

		-- Creando Ruta (Si no esta definida)
		IF NOT EXISTS (SELECT * FROM Direction 
		WHERE origin_iata_airport_code = @originAirport AND dest_iata_airport_code = @destAirport)
		BEGIN
			INSERT INTO Direction(origin_iata_airport_code,dest_iata_airport_code)
			VALUES(@originAirport,@destAirport)
		END
END