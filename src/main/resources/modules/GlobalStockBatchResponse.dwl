%dw 2.0
output application/xml encoding = "UTF-8"

var listMaterial = payload['ZBR_RFC_TRAKSYS_STOCKBATCHMAT']['export']['RETURN']
---
{
	InterfaceLog: {
		InterfaceLog: {
			StockDownload: {
				MaterialList: {
					MaterialItem: listMaterial[*'row'] map {
						MaterialNr: $['MATNNR'],
						Site: $['WERKS'],
						Erp_Storagelocation: $['LGORT'],
						Erp_BatchNr: $['CHARG'],
						Erp_FreeToUse: $['CLABS'],
						Erp_QualityControl: $['CINSM'],
						Erp_Uom: $['MEINS'],
						Erp_PoNumber: $['EBELN'],
						Erp_SupplierBatch: $['LICHA']
					},
				}
			}
		}
	}
}