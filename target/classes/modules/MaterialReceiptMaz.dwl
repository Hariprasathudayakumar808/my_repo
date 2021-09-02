%dw 2.0
import * from dw::core::Strings
output application/xml encoding="UTF-8"
var source = payload['MaterialActualsGR']['MaterialActualGR']
---
{
	ZPAIMF_GOOD_RECEIPT_PRO: {
		"import": {
			ES_MATERIAL_ACTUAL_GR: {
				MESKEY: source['MESKey'],
				PROR: source['PrOr'] as Number as String{format: "000000000000"},
				MATERIAL: source['Material'] as Number as String{format: "000000000000000000"},
				UOM: source['UoM'],
				QUANTITY: source['Quantity'],
				EVENTDATE: source['EventDate'],
				EVENTTIME: source['EventTime'],
				BATCHNR: source['BatchNr'],
				STORAGELOCATION: source['StorageLocation'],
				STATUS: source['ConfirmationStatus']
			}
		}
	}
}

