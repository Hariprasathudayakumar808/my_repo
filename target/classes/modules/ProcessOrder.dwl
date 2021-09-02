%dw 2.0
output application/xml encoding="UTF-8"

---
{
    ZXX_CREATE_PO_CHG_RES_MES_SAP: {
        "import": {
            BASIC_FINISH_DATE: payload['ProductionOrderRequests']['ProductionOrderRequest']['EndDate'],
            BASIC_FINISH_TIME: payload['ProductionOrderRequests']['ProductionOrderRequest']['EndTime'],
            BASIC_START_DATE: payload['ProductionOrderRequests']['ProductionOrderRequest']['StartDate'],
            BASIC_START_TIME: payload['ProductionOrderRequests']['ProductionOrderRequest']['StartTime'],
            MATERIAL: payload['ProductionOrderRequests']['ProductionOrderRequest']['Material'],
            ORDER_TYPE: payload['ProductionOrderRequests']['ProductionOrderRequest']['OrderType'],
            PLANT: payload['ProductionOrderRequests']['ProductionOrderRequest']['Plant'],
            PROD_VERSION: payload['ProductionOrderRequests']['ProductionOrderRequest']['ProductionVersion'],
            QUANTITY: payload['ProductionOrderRequests']['ProductionOrderRequest']['TotalOrderQty'],
            RESOURCE: payload['ProductionOrderRequests']['ProductionOrderRequest']['Resource']
        }
    }
}