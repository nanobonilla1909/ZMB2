@AbapCatalog.sqlViewName: 'ZVBOOK_MB'
@AbapCatalog.compiler.compareFilter: true
// @AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Intrface - Booking'
@Metadata.ignorePropagatedAnnotations: true

define view Z_I_BOOKING_MB as select from ztb_booking_mb

composition [0..*] of Z_I_BOOKSUPPL_MB as _BookingSupplement 

association to parent Z_I_TRAVEL_MB as _Travel on $projection.travel_id = _Travel.TravelId
association [1..1] to /DMO/I_Customer as _Customer on $projection.customer_id = _Customer.CustomerID
association [1..1] to /DMO/I_Carrier as _Carrier on $projection.carrier_id = _Carrier.AirlineID
association [1..*] to /DMO/I_Connection as _Connection on $projection.connection_id = _Connection.ConnectionID

{
    key travel_id,
    key booking_id as BookingId,
    booking_date,
    customer_id,
    carrier_id,
    connection_id,
    flight_date,
    flight_price,
    currency_code,
    booking_status,
    last_change_at,
    
    _Travel, 
    _Customer, 
    _Carrier, 
    _Connection,
    _BookingSupplement
}
