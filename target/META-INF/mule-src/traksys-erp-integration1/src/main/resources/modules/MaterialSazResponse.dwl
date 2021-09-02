%dw 2.0
output application/xml
var responseMaterial = payload['ZBR_RFC_TRAKSYS_MATERIAL']['export']['MAT_DADOS']
---
{
	MDS_BOM: {
		ReturnMessage: payload['ZBR_RFC_TRAKSYS_MATERIAL']['export']['RETURN_MESSAGE'],
		MaterialList: responseMaterial mapObject ((material, key, index) -> {
			MatItem: {
				Site: material['WERKS'],
				Code: material['MATNR'],
				Name: material['MAKTX'],
				Status: "",
				AltName: "",
				Desc: "",
				Uom: material['MEINS'],
				MatGroupCode: "",
				MatGroupName: material['MTBEZ'],
				MatTypeCode: material['MTART'],
				MatTypeName: material['WGBEZ'],
				ValidFrom: material['ERSDA'] as LocalDateTime{format:'eee MMM dd HH:mm:ss zzz yyyy'} as String {format:'yyyy-MM-dd'},
				ValidTo: material['LAEDA'] as LocalDateTime{format:'eee MMM dd HH:mm:ss zzz yyyy'} as String {format:'yyyy-MM-dd'}
			}
		}),
	}
}		