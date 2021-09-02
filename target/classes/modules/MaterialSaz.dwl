%dw 2.0
output application/xml
var matItem = payload['MDS_BOM']['MaterialList']['MatItem']
---
{
	ZBR_RFC_TRAKSYS_MATERIAL: {
		"import": {
			DATA:{
				row:{
					SIGN:'I',
                    OPTION:'EQ',
                    LOW: matItem['Low'],
					HIGH: matItem['High'],
				}
			},
			INITIAL_CHARGE: matItem['InitialCharge'],
			PLANTA: {
				row: {
					SIGN:'I',
                    OPTION:'EQ',
                    LOW: matItem['Site'],
//                    MATNR: matItem['Code']
				}
			}
		}
	}
} 