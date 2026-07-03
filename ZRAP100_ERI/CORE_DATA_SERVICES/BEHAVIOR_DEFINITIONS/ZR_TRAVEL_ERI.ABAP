managed implementation in class ZBP_TRAVEL_ERI unique;
strict ( 2 );
with draft;
extensible;
define behavior for ZR_TRAVEL_ERI alias Travel
persistent table ZTBL_TRAVEL_ERI
extensible
draft table ZTBL_TRAVELR_ERI
etag master LocalLastChangedAt
lock master total etag LastChangedAt
authorization master( global )
{
  field ( mandatory : create )
   TravelID;

  field ( readonly )
   CreatedBy,
   CreatedAt,
   LocalLastChangedBy,
   LocalLastChangedAt,
   LastChangedAt;

  field ( readonly : update )
   TravelID;


  create;
  update;
  delete;

  draft action Activate optimized;
  draft action Discard;
  draft action Edit;
  draft action Resume;
  draft determine action Prepare;

  mapping for ZTBL_TRAVEL_ERI corresponding extensible
  {
    TravelID = TRAVEL_ID;
    AgencyID = AGENCY_ID;
    CustomerID = CUSTOMER_ID;
    BeginDate = BEGIN_DATE;
    EndDate = END_DATE;
    BookingFee = BOOKING_FEE;
    TotalPrice = TOTAL_PRICE;
    CurrencyCode = CURRENCY_CODE;
    Description = DESCRIPTION;
    OverallStatus = OVERALL_STATUS;
    Attachment = ATTACHMENT;
    MimeType = MIME_TYPE;
    FileName = FILE_NAME;
    CreatedBy = CREATED_BY;
    CreatedAt = CREATED_AT;
    LocalLastChangedBy = LOCAL_LAST_CHANGED_BY;
    LocalLastChangedAt = LOCAL_LAST_CHANGED_AT;
    LastChangedAt = LAST_CHANGED_AT;
  }

}
