%dw 2.0
output application/xml encoding = "UTF-8"
var base =  payload['row']
---
{
	ProductionOrderResponses: ProductionsOrderResponse: {
		PrOrHeader: {
			MESKEY: base['MESKEY'],
			ControlRecipeNumber: base['CONTROL_RECIPE_NUMBER'],
			PrOrNumber: base['PR_OR_NUMBER'],
			PrOrType: base['PR_OR_TYPE'],
			Plant: base['PLANT'],
			Material: base['MATERIAL'],
			PlannedQty: base['PLANNED_QTY'],
			UoM: base['UOM'],
			PlannedStartDate: base['PLANNED_START_DATE'] as LocalDateTime{format:'eee MMM dd HH:mm:ss zzz yyyy'} as String {format:'yyyy-MM-dd'},
			PlannedStartTime: base['PLANNED_START_TIME'] as LocalDateTime{format:'eee MMM dd HH:mm:ss zzz yyyy'} as String {format:'HH:mm'},
			PlannedEndDate: base['PLANNED_END_DATE'] as LocalDateTime{format:'eee MMM dd HH:mm:ss zzz yyyy'} as String {format:'yyyy-MM-dd'},
			PlannedEndTime: base['PLANNED_END_TIME'] as LocalDateTime{format:'eee MMM dd HH:mm:ss zzz yyyy'} as String {format:'HH:mm'},
			ProductionVersion: base['PRODUCTION_VERSION'],
			BatchNumber: base['BATCH_NUMBER'],
			ReservationNumber: base['RESERVATION_NUMBER']
		},
		PrOrBody: {
			Operations: Operation: base['OPERATIONS'][*'row'] map  
				{
				OperationNumber: $['OPERATION_NUMBER'],
				PhaseNumber: $['PHASE_NUMBER'],
				PhaseText: $['PHASE_TEXT'],
				ResourceName: $['RESOURCE_NAME']
			},
			Components: Component: base['COMPONENTS'][*'row'] map 
			{
				OperationItem: $['OPERATION_ITEM'],
				PhaseNumbervalor: $['PHASE_NUMBER'],
				ItemNumber: $['ITEM_NUMBER'],
				ComponentMaterialNumber: $['COMPONENT_MATERIAL_NUMBER'],
				ComponentQty: $['COMPONENT_QTY'],
				ComponentUoM: $['COMPONENT_UOM'],
				ComponentDescription: $['COMPONENT_DESCRIPTION'],
				CoProductIndicator: $['CO_PRODUCT_INDICATOR'],
				ComponentScrap: $['COMPONENT_SCRAP'],
				GoodsIssueStorageLocation: $['GOOGS_ISSUE_STORAGE_LOCATION'],
				ItemReservationNumber: $['ITEM_RESERVATION_NUMBER']
			}
		}
	}
}