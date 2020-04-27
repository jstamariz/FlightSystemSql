create trigger TR_ValidarPrecioAsiento_Update_FOR
on dbo.FlightSeatPrice for update
AS

begin
	if update(price_usd)
	begin
	declare @FlightC INT, @AircraftID INT, @SeatID INT, @PrecioAnterior money

		--se selecciona el precio anterior
		select @PrecioAnterior = price_usd
		from DELETED 

		--se selecciona la clave primaria del registro a validar
		select @FlightC = Flight_call, @AircraftID = air_craft_ID, @SeatID = seat_ID
		from INSERTED 

		--Se actualizara al precio anterior
		update FlightSeatPrice set PRICE_USD = @PrecioAnterior
		where Flight_call = @FlightC AND air_craft_ID = @AircraftID AND  @SeatID = seat_ID

		print('Es inaceptable cambiar los precios a los asientos, por regla estos no pueden ser cambiados')
	end
end