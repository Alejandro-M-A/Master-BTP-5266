@AbapCatalog.sqlViewName: 'ZVW_BOOKSUPPL_M'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface - Booking Supplement'
define view ZI_Booksuppl_M_555
  as select from ztb_booksp_m_555 as BookingSupplement
  association        to parent ZI_BOOKING_555 as _Booking        on  $projection.travel_id  = _Booking.travel_id
                                                                 and $projection.booking_id = _Booking.booking_id
  association [1..1] to ZI_travel_555         as _Travel         on  $projection.travel_id = _Travel.travel_id
  association [1..1] to /DMO/I_Supplement     as _Product        on  $projection.supplement_id = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText as _SupplementText on  $projection.supplement_id = _SupplementText.SupplementID
{
      //BookingSupplement
  key travel_id,
  key booking_id,
  key booking_supplement_id,
      supplement_id,
      @Semantics.amount.currencyCode: 'currency_code'
      price,
      @Semantics.currencyCode: true
      currency_code,
      last_changed_at,

      /* Associations */
      _Travel,
      _Booking,
      _Product,
      _SupplementText
}
