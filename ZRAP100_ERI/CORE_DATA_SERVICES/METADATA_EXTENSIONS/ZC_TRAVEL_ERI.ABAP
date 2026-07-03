//@Metadata.layer: #CORE
//@UI.headerInfo.title.type: #STANDARD
//@UI.headerInfo.title.value: 'TravelID'
//@UI.headerInfo.description.type: #STANDARD
//@UI.headerInfo.description.value: 'TravelID'
@Metadata.layer: #CUSTOMER
@UI: {
  headerInfo: {
    typeName: 'Travel',
    typeNamePlural: 'Travels',
    imageUrl: 'Attachment',
    description: { type: #STANDARD, value: 'TravelID' } } }
annotate view ZC_TRAVEL_ERI with
{
  @UI.facet: [ {
    label: 'General Information',
    id: 'GeneralInfo',
    purpose: #STANDARD,
    position: 10 ,
    type: #IDENTIFICATION_REFERENCE
  } ]
  @UI: {
        lineItem:       [ { position: 10, importance: #HIGH } ],
        identification: [ { position: 10 } ],
        selectionField: [ { position: 10 } ]
  }
  TravelID;

  @UI: {
        identification: [ { position: 20 } ],
        lineItem:       [ { position: 20, importance: #HIGH } ],
        selectionField: [ { position: 20 } ]
  }
  AgencyID;

  @UI: {
        identification: [ { position: 30 } ],
        lineItem:       [ { position: 30, importance: #HIGH } ],
        selectionField: [ { position: 30 } ]
  }
  CustomerID;

  @UI: {
        identification: [ { position: 40 } ],
        lineItem:       [ { position: 40, importance: #MEDIUM } ],
        selectionField: [ { position: 40 } ]
  }
  BeginDate;

  @UI:{
        identification: [ { position: 50 } ],
        lineItem:       [ { position: 50, importance: #MEDIUM } ],
        selectionField: [ { position: 50 } ]
  }
  EndDate;

  @UI: {
        identification: [ { position: 60 } ],
        lineItem:       [ { position: 60, importance: #MEDIUM } ],
        selectionField: [ { position: 60 } ]
  }
  BookingFee;

  @UI.identification: [ {
    position: 70
  } ]
  @UI.lineItem: [ {
    position: 70
  } ]
  @UI.selectionField: [ {
    position: 70
  } ]
  TotalPrice;

  @UI.identification: [ {
    position: 80
  } ]
  @UI.lineItem: [ {
    position: 80
  } ]
  @UI.selectionField: [ {
    position: 80
  } ]
  Description;

  @UI.identification: [ {
    position: 90
  } ]
  @UI.lineItem: [ {
    position: 90
  } ]
  @UI.selectionField: [ {
    position: 90
  } ]
  OverallStatus;

  @UI.identification: [ {
    position: 100
  } ]
  @UI.lineItem: [ {
    position: 100
  } ]
  Attachment;

  @UI.identification: [ {
    position: 110
  } ]
  @UI.lineItem: [ {
    position: 110
  } ]
  @UI.selectionField: [ {
    position: 110
  } ]
  MimeType;

  @UI.identification: [ {
    position: 120
  } ]
  @UI.lineItem: [ {
    position: 120
  } ]
  @UI.selectionField: [ {
    position: 120
  } ]
  FileName;

  @UI.identification: [ {
    position: 130
  } ]
  @UI.lineItem: [ {
    position: 130
  } ]
  @UI.selectionField: [ {
    position: 130
  } ]
  CreatedBy;

  @UI.identification: [ {
    position: 140
  } ]
  @UI.lineItem: [ {
    position: 140
  } ]
  @UI.selectionField: [ {
    position: 140
  } ]
  CreatedAt;

  @UI.identification: [ {
    position: 150
  } ]
  @UI.lineItem: [ {
    position: 150
  } ]
  @UI.selectionField: [ {
    position: 150
  } ]
  LocalLastChangedBy;

  @UI.identification: [ {
    position: 160
  } ]
  @UI.lineItem: [ {
    position: 160
  } ]
  @UI.selectionField: [ {
    position: 160
  } ]
  LocalLastChangedAt;

  @UI.identification: [ {
    position: 170
  } ]
  @UI.lineItem: [ {
    position: 170
  } ]
  @UI.selectionField: [ {
    position: 170
  } ]
  LastChangedAt;
}
