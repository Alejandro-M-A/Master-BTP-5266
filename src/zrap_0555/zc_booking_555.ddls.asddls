@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption - Booking'
@Metadata.allowExtensions: true
define view entity ZC_Booking_555
  as projection on ZI_BOOKING_555
{

  key travel_id       as TravelID,
  key booking_id      as BookingID,
      booking_date    as BookingDate,
      customer_id     as CustomerID,
      carrier_id      as CarrierID,
      _Carrier.Name   as CarrierName,
      connection_id   as ConnectionID,
      flight_date     as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price    as FligthPrice,
      @Semantics.currencyCode: true
      currency_code   as CurrencyCode,
      booking_status  as BookingStatus,
      last_changed_at as LastChangedAt,
      
      /* Associations */
      _Travel : redirected to parent ZC_travel_555,
      _BookSupplement : redirected to composition child ZC_BookSuppl_5266,
      _Customer,
      _Carrier,
      _Connection
}
