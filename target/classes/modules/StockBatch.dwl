%dw 2.0
output application/xml encoding = "UTF-8"
---
{
	ZBR_RFC_TRAKSYS_STOCKBATCHMAT: {
		"import": {
			MATERIAL: {
				row: {
					SIGN: 'I',
					OPTION: 'EQ',
					LOW: vars.singleMaterial,
					HIGH: ''
				}
			},
			PLANT: {
				row: {
					SIGN: 'I',
					OPTION: 'EQ',
					LOW: upper(vars.plantCode),
					HIGH: ''
				}
			}
		}
	}
}