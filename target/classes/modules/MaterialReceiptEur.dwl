%dw 2.0
import * from dw::core::Strings
output application/xml encoding="UTF-8"

---
{
    ZXX_SAPERP_MF22B_PO_GR_IN_MU: {
        "import": {
             I_MESKEY: payload['MaterialActualsGR']['MaterialActualGR']['MESKey'],
             I_PR_OR_NUMBER: payload['MaterialActualsGR']['MaterialActualGR']['PrOr'] as Number as String {format: "000000000000"},
             I_PLANT: payload['MaterialActualsGR']['MaterialActualGR']['Plant'],
             I_MATERIAL: payload['MaterialActualsGR']['MaterialActualGR']['Material'] as Number as String {format: "000000000000000000"},
             I_UO_M: payload['MaterialActualsGR']['MaterialActualGR']['UoM'],
             I_PROD_QTY: payload['MaterialActualsGR']['MaterialActualGR']['Quantity'],
             I_EVENT_DATE: payload['MaterialActualsGR']['MaterialActualGR']['EventDate'],
             I_EVENT_TIME: payload['MaterialActualsGR']['MaterialActualGR']['EventTime'],
             I_BATCH_NUMBER: payload['MaterialActualsGR']['MaterialActualGR']['BatchNr'],
             I_SENDER_NAME: 'MULESOFT_TRAKSYS'
        }
    }
}