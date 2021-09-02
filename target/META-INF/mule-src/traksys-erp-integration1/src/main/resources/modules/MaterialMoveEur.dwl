%dw 2.0
output application/xml encoding = "UTF-8"
var source = payload['MaterialMovements']['MaterialMovement']
---
ZXX_TRKSAP_GM_SLOC_TO_SLOC: {
	"import": {
		I_MESKEY: source['MESKey'],
		I_PLANT: source['Plant'],
		I_EVENTDATE: source['EventDate'],
		I_EVENTTIME: source['EventTime'],
		I_MOVEMENTTYPE: source['MovementType'],
		I_COMMENT: source['Comment'],
		I_QUANTITY: source['Quantity'],
		I_UOM: source['UoM'],
		I_SRC_MATERIAL: source['SrcMaterial'],
		I_SRC_BATCHNR: source['SrcBatchNr'],
		I_SRC_SLOC: source['SrcStorageLocation'],
		I_TRG_SLOC: source['TrgStorageLocation'],
	}
}
