@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption - Travel'
@Metadata.allowExtensions: true
define root view entity ZC_travel_555
  as projection on ZI_travel_555
{
  key travel_id          as TravelID,
      agency_id          as AgencyID,
      _Agency.Name       as AgencyName,
      customer_id        as CustomerID,
      _Customer.LastName as CustomerName,
      begin_date         as BeginDate,
      end_date           as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee        as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price        as TotalPrice,
      @Semantics.currencyCode: true
      currency_code      as CurrencyCode,
      overall_status     as TravelStatus,
      description        as Description,
      last_changed_at    as LastChangedAt,
      
      _Booking : redirected to composition child ZC_Booking_555,
      _Agency,
      _Customer,
      _Currency
}
