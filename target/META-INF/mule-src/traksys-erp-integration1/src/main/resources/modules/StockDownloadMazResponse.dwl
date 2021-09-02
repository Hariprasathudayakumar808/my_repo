%dw 2.0
output application/xml encoding = "UTF-8"

var listMaterial = payload['ZPAIFM_MES_STOCK']['export']['RETURN']
---
{
	InterfaceLog: {
		InterfaceLog: {
			StockDownload: {
				MaterialList: {
					MaterialItem: listMaterial[*'row'] map {
						MaterialNr: $['MATNR'],
						Site: $['WERKS'],
						Erp_Storagelocation: $['LGORT'],
						Erp_BatchNr: $['CHARG'],
						Erp_FreeToUse: $['CLABS'],
						Erp_QualityControl: $['CINSM'],
						Erp_Uom: $['MEINS'],
						Erp_PoNumber: $['EBELN'],
						Erp_SupplierBatch: $['LICHA'],
						ERP_CreationDate: $['ERSDA']
					},
				}
			}
		}
	}
}