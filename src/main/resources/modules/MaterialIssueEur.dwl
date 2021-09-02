%dw 2.0
import * from dw::core::Strings
output application/xml encoding="UTF-8"

---
{
    ZXX_SAPERP_MF22A_PO_GI_IN_MU: {
        "import": {
             I_MESKEY: payload['MaterialActualsGI']['MaterialActualGI']['MESKey'],
             I_PR_OR_NUMBER: payload['MaterialActualsGI']['MaterialActualGI']['PrOr'] as Number as String {format: "000000000000"},
             I_PLANT: payload['MaterialActualsGI']['MaterialActualGI']['Plant'],
             I_MATERIAL: payload['MaterialActualsGI']['MaterialActualGI']['Material'] as Number as String {format: "000000000000000000"},
             I_UO_M: payload['MaterialActualsGI']['MaterialActualGI']['UoM'],
             I_QUANTITY: payload['MaterialActualsGI']['MaterialActualGI']['Quantity'],
             I_EVENT_DATE: payload['MaterialActualsGI']['MaterialActualGI']['EventDate'],
             I_EVENT_TIME: payload['MaterialActualsGI']['MaterialActualGI']['EventTime'],
             I_BATCH_NUMBER: payload['MaterialActualsGI']['MaterialActualGI']['BatchNr'],
             I_STORAGE_LOCATION: payload['MaterialActualsGI']['MaterialActualGI']['StorageLocation'],
             I_SENDER_NAME: 'MULESOFT_TRAKSYS'
        }
    }
}