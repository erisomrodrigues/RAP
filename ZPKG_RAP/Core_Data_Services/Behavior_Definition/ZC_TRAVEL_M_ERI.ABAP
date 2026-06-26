projection;
strict ( 2 );

define behavior for ZC_TRAVEL_M_ERI //alias <alias_name>
{
  use create;
  use update;
  use delete;

  use association _booking { create; }
}

define behavior for ZC_BOOKING_M_ERI //alias <alias_name>
{
  use update;
  use delete;

  use association _Travel;
  use association _bookingSuppl { create; }
}

define behavior for ZC_BOOKINGSUPP_M_ERI //alias <alias_name>
{
  use update;
  use delete;

  use association _travel;
  use association _booking;
}
