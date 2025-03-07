@EndUserText.label: 'Consumption - Booking Supplement'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity Z_C_BOOKSUPPL_MB
  as projection on Z_I_BOOKSUPPL_MB

{
  key travel_id                   as TravelId,
  key booking_id                  as BookingID,
  key booking_supplement_id       as BookingSupplementID,
      supplement_id               as SupplementID,
      _SupplementText.Description as SupplementDescription : localized,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      price                       as Price,
      currency                    as CurrencyCode,
      last_changed_at,
      /* Associations */
      _Booking : redirected to parent Z_C_BOOKING_MB,
      _Product,
      _SupplementText,
      _Travel  : redirected to Z_C_TRAVEL_MB
}
