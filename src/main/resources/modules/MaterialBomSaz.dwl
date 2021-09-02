%dw 2.0
output application/xml encoding="UTF-8"
var matItem = payload['MDS_BOM']['BillOfMaterialList']['BOMItem']
---
{
	ZBR_RFC_TRAKSYS_BOM: {
		"import": {
			DATA:{
				row:{
					SIGN:'I',
                    OPTION:'EQ',
                    LOW: matItem['Low'],
					HIGH: matItem['High'],
					INITIAL_CHARGE: matItem['InitialCharge'],
//					BOM_NO: '',
				}
			},
			PLANTA: {
				row: {
					SIGN:'I',
                    OPTION:'EQ',
                    LOW: matItem['Site'],
				}
			}
		}
	}
} 