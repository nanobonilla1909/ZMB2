@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface - Travel Approval'
@Metadata.allowExtensions: true

define root view entity Z_C_ATRAVEL_MB as projection on Z_I_TRAVEL_MB
{
    key TravelId,
    agency_id as AgencyID,
    customer_id as CustomerID,
    begin_date as BeginDate,
    EndDate,
    @Semantics.amount.currencyCode : 'CurrencyCode'
    booking_fee as BookingFee,
    total_price as TotalPrice,
    @Semantics.currencyCode: true
    currency_code as CurrencyCode,
    description as Description,
    overall_status as TravelStatus,
    last_changed_at as LastChangedAt,
    /* Associations */
    _Booking : redirected to composition child Z_C_ABOOKING_MB,
    _Customer
    
}
