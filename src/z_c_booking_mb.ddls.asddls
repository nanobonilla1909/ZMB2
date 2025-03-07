@EndUserText.label: 'Consumption - Booking'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true

define view entity Z_C_BOOKING_MB as projection on Z_I_BOOKING_MB
{
    key travel_id as TravelId,
    key BookingId,
    booking_date as BookingDate,
    customer_id as CustomerId,
    carrier_id as CarrierId,
    _Carrier.Name as CarrierName,
    connection_id as ConnectionId,
    flight_date as FlightDate,
    @Semantics.amount.currencyCode : 'CurrencyCode'
    flight_price as FlightPrice,
    @Semantics.currencyCode: true
    currency_code as CurrencyCode,
    booking_status as BookingStatus,
    last_change_at as LastChangeAt,
    
    /* Associations */
    _Travel : redirected to parent Z_C_TRAVEL_MB,
    _BookingSupplement : redirected to composition child Z_C_BOOKSUPPL_MB,
    _Carrier,
    _Connection,
    _Customer
    
}
