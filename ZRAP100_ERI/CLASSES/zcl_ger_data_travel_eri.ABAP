CLASS zcl_ger_data_travel_eri DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ger_data_travel_eri IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA:
      group_id   TYPE string VALUE '',
      attachment TYPE /dmo/attachment,
      file_name  TYPE /dmo/filename,
      mime_type  TYPE /dmo/mime_type.

    DELETE FROM ztbl_travel_eri.
    DELETE FROM ztbl_travelr_eri.

    INSERT ztbl_travel_eri FROM (
    SELECT
      FROM /dmo/travel AS travel
      FIELDS
        travel~travel_id     AS Travel_id,
        travel~agency_id     AS agency_id,
        travel~customer_id   AS customer_id,
        travel~begin_date    AS begin_date,
        travel~end_date      AS end_date,
        travel~booking_fee   AS Booking_free,
        travel~total_price   AS total_price,
        travel~currency_code AS currency_code,
        travel~description   AS description,
        CASE travel~status
          WHEN 'N' THEN 'O' "New
          WHEN 'P' THEN 'O' "Planed
          WHEN 'B' THEN 'A' "Booked
          ELSE 'X'          "Cancelado
          END AS overall_status,
          @attachment AS attachment,
          @mime_type AS mime_type,
          @file_name AS file_name,
          travel~createdby     AS create_by,
          travel~createdat     AS create_at,
          travel~lastchangedby AS last_changed_by,
          travel~lastchangedat AS last_changed_at,
          travel~lastchangedat AS local_last_changed_at
          ORDER BY travel_id UP TO 100 ROWS ).

    COMMIT WORK.
    out->write( |Data genereted for table ZTBl_TRAVEL_ERI{ group_id }. | ).
  ENDMETHOD.
ENDCLASS.
