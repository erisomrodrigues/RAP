CLASS zcl_carga_eri DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_carga_eri IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.


*    INSERT ztb_travel_M_eri FROM (
*    SELECT * FROM /dmo/travel_m ).

*    INSERT ztbl_travel_eri FROM (
*    SELECT * FROM /dmo/travel ).

*    IF sy-subrc = 0.
*      COMMIT WORK.
*    ELSE.
*      ROLLBACK WORK.
*      DATA(lv_erro) = abap_true.
*    ENDIF.

*    INSERT ztbl_booking_eri FROM (
*    SELECT * FROM /dmo/booking ).

    INSERT ztb_bking_m_eri FROM (
    SELECT * FROM /dmo/booking_m ).
    IF sy-subrc = 0.
      COMMIT WORK.
    ELSE.
      ROLLBACK WORK.
      data(lv_erro) = abap_true.
    ENDIF.
*
*    INSERT ztbl_book_sp_eri FROM (
*    SELECT * FROM /dmo/book_suppl ).

    INSERT ztb_book_s_m_eri FROM (
    SELECT * FROM /dmo/booksuppl_m ).
    IF sy-subrc = 0.
      COMMIT WORK.
    ELSE.
      ROLLBACK WORK.
      lv_erro = abap_true.
    ENDIF.

    out->write( COND string( WHEN lv_erro = abap_true THEN 'ERRO' ELSE 'SUCESS' )  ).

  ENDMETHOD.
ENDCLASS.
