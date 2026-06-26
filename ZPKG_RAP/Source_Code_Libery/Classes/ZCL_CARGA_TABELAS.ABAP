CLASS zcl_carga_tabelas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_carga_tabelas IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    INSERT ztbl_booking_m FROM ( SELECT * FROM /dmo/booking_m ).
    IF sy-subrc IS INITIAL.
      COMMIT WORK AND WAIT.
    ELSE.
      ROLLBACK WORK.
      DATA(lv_erro) = abap_true.
    ENDIF.

    INSERT ztbl_booksuppl_m FROM ( SELECT * FROM /dmo/booksuppl_m ).
    IF sy-subrc IS INITIAL.
      COMMIT WORK AND WAIT.

    ELSE.
      ROLLBACK WORK.
      lv_erro = abap_true.
    ENDIF.

    INSERT ztbl_travel_m FROM ( SELECT * FROM /dmo/travel_m ).

    IF sy-subrc IS INITIAL.
      COMMIT WORK AND WAIT.
    ELSE.
      ROLLBACK WORK.
      lv_erro = abap_true.
    ENDIF.

    out->write( lv_erro ).

  ENDMETHOD.

ENDCLASS.
