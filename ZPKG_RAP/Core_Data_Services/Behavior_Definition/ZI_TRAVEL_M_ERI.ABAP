managed;
strict ( 2 );

define behavior for ZI_TRAVEL_M_ERI implementation in class zbp_i_travel_m_eri unique//alias <alias_name>
persistent table ztbl_travel_m
lock master
authorization master ( instance )
early numbering
//etag master <field_name>
{
  //  create ( authorization : global );
  field ( readonly ) TravelId;
  create;
  update;
  delete;
  association _booking { create; }

  mapping for ztbl_travel_m
    {
      TravelId      = travel_id;
      AgencyId      = agency_id;
      CustomerId    = customer_id;
      BeginDate     = begin_date;
      EndDate       = end_date;
      BookingFee    = booking_fee;
      TotalPrice    = total_price;
      CurrencyCode  = currency_code;
      Description   = description;
      OverallStatus = overall_status;
      CreatedBy     = created_by;
      CreatedAt     = created_at;
      LastChangedBy = last_changed_by;
      LastChangedAt = last_changed_at;
    }
}

define behavior for ZI_BOOKING_M_ERI implementation in class zbp_i_booking_m_eri unique //alias <alias_name>
persistent table ztbl_booking_m
lock dependent by _Travel
authorization dependent by _Travel
//etag master <field_name>
{
  update;
  delete;
  field ( readonly ) TravelId, BookingId;
  association _Travel;
  association _bookingSuppl { create; }
}

define behavior for ZI_BOOKINGSUPP_M_ERI implementation in class zbp_i_bookingsupp_m_eri unique//alias <alias_name>
persistent table ztbl_booksuppl_m
lock dependent by _travel
authorization dependent by _travel
//etag master <field_name>
{
  update;
  delete;
  field ( readonly ) TravelId, BookingId, BookingSupplementId;
  association _travel;
  association _booking;
}
