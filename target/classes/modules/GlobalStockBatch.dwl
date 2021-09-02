%dw 2.0
output application/xml 
var listMaterial = payload['StockDownload']['MaterialList']
var plant = payload['StockDownload']['Site']
---
{
	ZBR_RFC_TRAKSYS_STOCKBATCHMAT: {
		"import": {
			MATERIAL: listMaterial mapObject ((value, key, index) -> {
				row: {
					SIGN: 'I',
					OPTION: 'EQ',
					LOW: value['MaterialCode'],
					HIGH: ''
				}
			}),
			
			PLANT: {
				row: {
					SIGN: 'I',
					OPTION: 'EQ',
					LOW: plant,
					HIGH: ''
				}
			}
		}
	}
}
