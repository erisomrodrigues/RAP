@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Visualização da booking supplements'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType: {
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_BOOKINGSUPP_M_ERI
  as select from ztbl_booksuppl_m
  association        to parent ZI_BOOKING_M_ERI as _booking        on  $projection.BookingId = _booking.BookingId
                                                                   and $projection.TravelId  = _booking.TravelId
  association [1..1] to ZI_TRAVEL_M_ERI         as _travel         on  $projection.TravelId = _travel.TravelId
  association [1..1] to /DMO/I_Supplement       as _Product        on  $projection.SupplementId = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText   as _SupplementText on  $projection.SupplementId = _SupplementText.SupplementID
{
  key travel_id             as TravelId,
  key booking_id            as BookingId,
  key booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at       as LastChangedAt,

      //Association
      _travel,
      _booking,
      _Product,
      _SupplementText

}
