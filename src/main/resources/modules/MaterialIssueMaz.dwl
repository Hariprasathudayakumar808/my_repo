output application/xml encoding="UTF-8"
var source = payload['MaterialActualsGI']['MaterialActualGI']
---
{
	ZPAIMF_GOOD_ISSUE_PRO: {
		"import": {
			IT_MATERIAL_ACTUAL_IG: row: {
				MESKEY: source['MESKey'],
				PROR: source['PrOr'] as Number as String{format: "000000000000"},
				MATERIAL: source['Material'] as Number as String{format: "000000000000000000"},
				UOM: source['UoM'],
				QUANTITY: source['Quantity'],
				EVENTDATE: source['EventDate'],
				EVENTTIME: source['EventTime'],
				BATCHNR: source['BatchNr'],
				STORAGELOCATION: source['StorageLocation']
			}
		}
	}
}
