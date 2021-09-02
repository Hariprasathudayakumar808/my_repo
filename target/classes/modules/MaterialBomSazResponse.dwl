output application/xml encoding="UTF-8"
var responseMaterial = payload['ZBR_RFC_TRAKSYS_BOM']['export']['BOM_DADOS']
var responseComponents = payload['ZBR_RFC_TRAKSYS_BOM']['export']['BOM_DADOS']
---
{
	MDS_BOM: {
		ReturnMessage: payload['ZBR_RFC_TRAKSYS_BOM']['export']['RETURN_MESSAGE'],
		BillOfMaterialList: (responseMaterial distinctBy ((item, index) -> (item['MATNR']))) mapObject ((material, key, index) -> {
			BOMItem: {
				Site: material['WERKS'],
				Code: material['BOM_NO'],
				Name: "",
				Status: material['BOM_STATUS'],
				AltName: material['ALT_TEXT'],
				Desc: material['BOM_TEXT'],
				StdQty: (trim(material['BASE_QUAN'])  replace "." with "" ) replace "," with ".",
				Uom: material['BASE_UNIT'],
				MatCode: material['MATNR'],
				MatName: material['MAKTX'],
				LineCode: "",
				LineName: "",
				ValidFrom: material['VALID_FROM'] as LocalDateTime{format:'eee MMM dd HH:mm:ss zzz yyyy'} as String {format:'yyyy-MM-dd'},
				ValidTo: material['VALID_TO'] as LocalDateTime{format:'eee MMM dd HH:mm:ss zzz yyyy'} as String {format:'yyyy-MM-dd'},
			}
		}),
		BillOfMaterialComponentList: responseComponents mapObject ((component, key, index) -> {
			BOMCompItem: {
				Site: component['WERKS'],
				Code: component['BOM_NO'] as String ++ component['ITEM_NO'] as String ++ component['STLAL'] as String,
				BOMCode: component['BOM_NO'],
				Name: "",
				Status: component['BOM_STATUS'],
				MatLossFactor: (trim(component['COMP_SCRAP'])  replace "." with "" ) replace "," with ".",
				Qty: (trim(component['COMP_QTY'])  replace "." with "" ) replace "," with ".",
				MatCode: component['COMPONENT'],
				Uom: component['COMP_UNIT'],
				ValidFrom: component['ITEM_VALID_FROM'] as LocalDateTime{format:'eee MMM dd HH:mm:ss zzz yyyy'} as String {format:'yyyy-MM-dd'},
				ValidTo: component['ITEM_VALID_TO'] as LocalDateTime{format:'eee MMM dd HH:mm:ss zzz yyyy'} as String {format:'yyyy-MM-dd'},
				ItemNo: component['ITEM_NO'],
				AltVersion: component['STLAL'],
				VersionUse: component['STLAN'],
			}
		})
	}
}