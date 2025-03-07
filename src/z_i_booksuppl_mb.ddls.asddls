@AbapCatalog.sqlViewName: 'ZV_BOOK_MB'
@AbapCatalog.compiler.compareFilter: true
// @AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interfaca - Booking Supplement'
@Metadata.ignorePropagatedAnnotations: true
define view Z_I_BOOKSUPPL_MB as select from ztb_booksuppl_mb as BookingSupplement

association to parent Z_I_BOOKING_MB as _Booking on $projection.travel_id = _Booking.travel_id 
                                                     and $projection.booking_id = _Booking.BookingId
                                                    
association [1..1] to Z_I_TRAVEL_MB as _Travel on $projection.travel_id = _Travel.TravelId
association [1..1] to /DMO/I_Supplement as _Product on $projection.supplement_id = _Product.SupplementID
association [1..*] to /DMO/I_SupplementText as _SupplementText on $projection.supplement_id = _SupplementText.SupplementID

{
    key travel_id,
    key booking_id,
    key booking_supplement_id,
    supplement_id,
    @Semantics.amount.currencyCode : 'currency'
    price,
    @Semantics.currencyCode: true
    currency,
    _Travel.last_changed_at,
    _Booking,
    _Travel,
    _Product,
    _SupplementText
}
