%dw 2.0
output application/xml encoding="UTF-8"

---
{
    ZCA_CREATE_PO_CHG_RES_MES_SAP: {
        "import": {
            MESKEY: payload['ProductionOrderRequests']['ProductionOrderRequest']['MESKey'],
            ENDDATE: payload['ProductionOrderRequests']['ProductionOrderRequest']['EndDate'],
            ENDTIME: payload['ProductionOrderRequests']['ProductionOrderRequest']['EndTime'],
            STARTDATE: payload['ProductionOrderRequests']['ProductionOrderRequest']['StartDate'],
            STARTTIME: payload['ProductionOrderRequests']['ProductionOrderRequest']['StartTime'],
            MATERIAL: payload['ProductionOrderRequests']['ProductionOrderRequest']['Material'],
            ORDERTYPE: payload['ProductionOrderRequests']['ProductionOrderRequest']['OrderType'],
            PLANT: payload['ProductionOrderRequests']['ProductionOrderRequest']['Plant'],
            PRODUCTIONVERSION: payload['ProductionOrderRequests']['ProductionOrderRequest']['ProductionVersion'],
            TOTALORDERQTY: payload['ProductionOrderRequests']['ProductionOrderRequest']['TotalOrderQty'],
            RESOURCE: payload['ProductionOrderRequests']['ProductionOrderRequest']['Resource']
        }
    }
}