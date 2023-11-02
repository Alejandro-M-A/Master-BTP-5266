@EndUserText.label: 'Consumption - Booking Supplement'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_BookSuppl_5266
  as projection on ZI_Booksuppl_M_555
{
  key travel_id                   as travelID,
  key booking_id                  as BookingID,
  key booking_supplement_id       as BookingSupplementID,
      supplement_id               as SupplementID,
      _SupplementText.Description as SupplementDescription : localized,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                       as Price,
      @Semantics.currencyCode: true
      currency_code               as CurrencyCode,

      /* Associations */
      _Travel  : redirected to ZC_travel_555,
      _Booking : redirected to parent ZC_Booking_555,
      _Product,
      _SupplementText
}
