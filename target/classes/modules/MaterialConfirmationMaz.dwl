%dw 2.0
output application/xml encoding="UTF-8"
var source = payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']
---
{
	ZPAIMF_CONFIRMATION_PRO: {
		"import": IS_PRODUCTIONORDERCONFIRMATION: {
			MESKEY: source['MESKey'],
			PRORNUMBER: source['PrOrNumber'] as Number as String {format: '000000000000'},
			PLANT: source['Plant'],
			CONFIRMATIONDATE: source['ConfirmationDate'],
			CONFIRMATIONTIME: source['ConfirmationTime'],
			PHASE: source['Phase'],
			STATUS: source['Status'],
			YIELD: source['Yield'],
			CLEARRESERVATIONS: source['ClearReservations'],
			UOM: source['UoM']
		}
	}
}