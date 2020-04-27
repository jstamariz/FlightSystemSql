CREATE PROCEDURE BookFlight @clientId INT, @flightID INT, @seatid INT
AS
SET NOCOUNT ON
BEGIN
	
	--Buscando el ID del avion
	DECLARE @AircraftID INT
	SELECT TOP 1 @AircraftID = aircraft_ID FROM AircraftSeat WHERE seat_ID = @seatid
	
	-- Insertando en la Tabla de Booking
	INSERT INTO Booking(Client_ID,Flight_Call,aircraft_ID,Seat_ID)
	VALUES(@clientId,@flightID,@AircraftID,@seatid)
END