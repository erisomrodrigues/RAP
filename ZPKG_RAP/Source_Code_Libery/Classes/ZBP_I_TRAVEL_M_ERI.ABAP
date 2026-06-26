CLASS lhc_ZI_TRAVEL_M_ERI DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_travel_m_eri RESULT result.

    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE zi_travel_m_eri.

ENDCLASS.

CLASS lhc_ZI_TRAVEL_M_ERI IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.


  METHOD earlynumbering_create.

    TRY.
        cl_numberrange_runtime=>number_get(
          EXPORTING
          nr_range_nr       = '01'
          object            = '/DMO/TRV_M'
          quantity          = 1
          IMPORTING
          number            = DATA(lv_last_number)
          returned_quantity = DATA(lv_quantity)
        ).

      CATCH cx_nr_object_not_found INTO DATA(lo_erro_not_found).

        LOOP AT entities ASSIGNING FIELD-SYMBOL(<fs_entities>).

          APPEND VALUE #( %cid = <fs_entities>-%cid
                          %key = <fs_entities>-%key ) TO failed-zi_travel_m_eri.

          APPEND VALUE #( %cid = <fs_entities>-%cid
                          %key = <fs_entities>-%key
                          %msg = lo_erro_not_found ) TO reported-zi_travel_m_eri.
        ENDLOOP.

      CATCH cx_number_ranges INTO DATA(lo_error).
        LOOP AT entities ASSIGNING <fs_entities>.

          APPEND VALUE #( %cid = <fs_entities>-%cid
                          %key = <fs_entities>-%key ) TO failed-zi_travel_m_eri.

          APPEND VALUE #( %cid = <fs_entities>-%cid
                          %key = <fs_entities>-%key
                          %msg = lo_error ) TO reported-zi_travel_m_eri.
        ENDLOOP.
    ENDTRY.

    ASSERT lv_quantity = lv_quantity.

    LOOP AT entities ASSIGNING <fs_entities>.
      APPEND VALUE #( %cid     = <fs_entities>-%cid
                      travelid = <fs_entities>-TravelId ) TO mapped-zi_travel_m_eri.
    ENDLOOP.

  ENDMETHOD.



ENDCLASS.
