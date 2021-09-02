%dw 2.0
output application/xml encoding="UTF-8"

---
{
    ZXX_SAPERP_MF12_PO_CONF_IN_MU: {
        "import": {
             I_MESS_KEY: payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['MESKey'],
             I_PROCESS_ORD: payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['PrOrNumber'] as Number as String {format: '000000000000'},
             I_PLANT: payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['Plant'],
             I_EVENT_DATE: payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['ConfirmationDate'],
             I_EVENT_TIME: payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['ConfirmationTime'],
             I_STATUS: payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['Status'],
             I_YIELD_QTY: payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['Yield'],
             I_RESERVATIONS: payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['ClearReservations'],
             I_UOM: payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['UoM'],
             I_PHASE: payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['Phase'],
             I_SENDER_NAME: 'MULESOFT_TRAKSYS'
        }
    }
}