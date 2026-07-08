CLASS zcl_operations001_eri DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_operations001_eri IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    MODIFY ENTITY zi_travel_m_eri
    CREATE FROM VALUE #( ( %cid = 'CID'
                           %data-BeginDate = '20260706'
                           %control-BeginDate = if_abap_behv=>mk-on ) )
        FAILED DATA(lt_fail)
        REPORTED DATA(lt_report)
        MAPPED DATA(lt_mapp).

    IF lt_fail IS INITIAL AND lt_report IS INITIAL.
      out->write( data = lt_fail ).
      out->write( data = lt_report ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
