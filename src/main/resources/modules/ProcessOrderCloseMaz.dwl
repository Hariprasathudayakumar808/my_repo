%dw 2.0
output application/xml encoding = "UTF-8"
var source = payload['ControlRecipeStatusChanges']['ControlRecipeStatusChange']
---
{
	ZPAIMF_CLOSE_PRO: {
		"import": {
			IT_ORDERS: {
				row: {
					MESKEY: source['MESKey'],
					ORDER_NUMBER: source['PrOrNumber'],
					PLANT: source['Plant'],
					CHANGEDATE: source['ChangeDate'],
					CHANGETIME: source['ChangeTime'],
					CONTROLRECIPENR: source['ControlRecipeNr'],
					CONTROLRECIPESTATUS: source['ControlRecipeStatus']
				}
			}
		}
	}
}
