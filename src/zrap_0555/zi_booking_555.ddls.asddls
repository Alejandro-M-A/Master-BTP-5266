@AbapCatalog.sqlViewName: 'ZVW_I_BOOK_M'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface - Booking'
define view ZI_BOOKING_555
  as select from ztb_bookng_m_555 as Booking
  association        to parent ZI_travel_555 as _Travel     on  $projection.travel_id = _Travel.travel_id
  composition [0..*] of ZI_Booksuppl_M_555   as _BookSupplement
  association [1..1] to /DMO/I_Customer      as _Customer   on  $projection.customer_id = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier       as _Carrier    on  $projection.carrier_id = _Carrier.AirlineID
  association [1..1] to /DMO/I_Connection    as _Connection on  $projection.carrier_id    = _Connection.AirlineID
                                                            and $projection.connection_id = _Connection.ConnectionID
{
      //Booking
  key travel_id,
  key booking_id,
      booking_date,
      customer_id,
      carrier_id,
      connection_id,
      flight_date,
      flight_price,
      currency_code,
      booking_status,
      last_changed_at,

      _Travel,
      _BookSupplement,
      _Customer,
      _Carrier,
      _Connection
}
