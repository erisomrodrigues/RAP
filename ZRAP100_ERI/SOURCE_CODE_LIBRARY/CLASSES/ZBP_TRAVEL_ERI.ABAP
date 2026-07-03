class ZBP_TRAVEL_ERI definition
  public
  abstract
  final
  for behavior of ZR_TRAVEL_ERI .

public section.
protected section.
private section.
ENDCLASS.



CLASS ZBP_TRAVEL_ERI IMPLEMENTATION.
ENDCLASS.


class ZBP_TRAVEL_ERI definition
  public
  abstract
  final
  for behavior of ZR_TRAVEL_ERI .

public section.
protected section.
private section.
ENDCLASS.



CLASS ZBP_TRAVEL_ERI IMPLEMENTATION.
ENDCLASS.

CLASS LHC_ZR_TRAVEL_ERI DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR Travel
        RESULT result.
ENDCLASS.

CLASS LHC_ZR_TRAVEL_ERI IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
ENDCLASS.
