%dw 2.0
output application/xml encoding="UTF-8"
var source = payload['ProductionOrderRequests']['ProductionOrderRequest']
---
{
	ZPAIMF_MES_CREATE_PO_CB: {
		"import": {
			MESKEY: source['MESKey'],
			MATERIAL: source['Material'],
			PROD_VERSION: source['ProductionVersion'],
			PLANT: source['Plant'],
			ORDER_TYPE: source['OrderType'],
			START_DATE: source['StartDate'],
			START_TIME: source['StartTime'],
			END_DATE: source['EndDate'],
			END_TIME: source['EndTime'],
			TOTALORDERQTY: source['TotalOrderQty'],
		}
	}
}
