%dw 2.0
output application/xml encoding="UTF-8"
---
{

     ProductionOrderResponses: 
        ProductionOrderResponse:
        {
            PrOrHeader:{
                ControlRecipeNumber: payload['ZBR_RFC_TRAKSYS_CONTROLRECIPE']['export']['PRODUCTION_ORDER_RESPONSE']['PR_OR_HEADER']['CONTROL_RECIPE_NUMBER'],
                PrOrNumber: payload['ZBR_RFC_TRAKSYS_CONTROLRECIPE']['export']['PRODUCTION_ORDER_RESPONSE']['PR_OR_HEADER']['PR_OR_NUMBER'],
                PrOrType:  payload['ZBR_RFC_TRAKSYS_CONTROLRECIPE']['export']['PRODUCTION_ORDER_RESPONSE']['PR_OR_HEADER']['PR_OR_TYPE'],
                Plant: payload['ZBR_RFC_TRAKSYS_CONTROLRECIPE']['export']['PRODUCTION_ORDER_RESPONSE']['PR_OR_HEADER']['PLANT'],
                Material: payload['ZBR_RFC_TRAKSYS_CONTROLRECIPE']['export']['PRODUCTION_ORDER_RESPONSE']['PR_OR_HEADER']['MATERIAL'],
                PlannedQty: payload['ZBR_RFC_TRAKSYS_CONTROLRECIPE']['export']['PRODUCTION_ORDER_RESPONSE']['PR_OR_HEADER']['PLANNED_QTY'],
                UoM: payload['ZBR_RFC_TRAKSYS_CONTROLRECIPE']['export']['PRODUCTION_ORDER_RESPONSE']['PR_OR_HEADER']['UOM'],
                PlannedStartDate: (payload['ZBR_RFC_TRAKSYS_CONTROLRECIPE']['export']['PRODUCTION_ORDER_RESPONSE']['PR_OR_HEADER']['PLANNED_START_DATE'] as LocalDateTime{format:'eee MMM dd HH:mm:ss zzz yyyy'}) as String {format:'yyyy-MM-dd'},
                PlannedStartTime: (payload['ZBR_RFC_TRAKSYS_CONTROLRECIPE']['export']['PRODUCTION_ORDER_RESPONSE']['PR_OR_HEADER']['PLANNED_START_TIME']  as LocalDateTime{format:'eee MMM dd HH:mm:ss zzz yyyy'}) as String {format:'HH:mm'},
                PlannedEndDate: (payload['ZBR_RFC_TRAKSYS_CONTROLRECIPE']['export']['PRODUCTION_ORDER_RESPONSE']['PR_OR_HEADER']['PLANNED_END_DATE']  as LocalDateTime{format:'eee MMM dd HH:mm:ss zzz yyyy'}) as String {format:'yyyy-MM-dd'},
                PlannedEndTime: (payload['ZBR_RFC_TRAKSYS_CONTROLRECIPE']['export']['PRODUCTION_ORDER_RESPONSE']['PR_OR_HEADER']['PLANNED_END_TIME']  as LocalDateTime{format:'eee MMM dd HH:mm:ss zzz yyyy'}) as String {format:'HH:mm'},
                ProductionVersion: payload['ZBR_RFC_TRAKSYS_CONTROLRECIPE']['export']['PRODUCTION_ORDER_RESPONSE']['PR_OR_HEADER']['PRODUCTION_VERSION'],
                BatchNumber: payload['ZBR_RFC_TRAKSYS_CONTROLRECIPE']['export']['PRODUCTION_ORDER_RESPONSE']['PR_OR_HEADER']['BATCH_NUMBER'],
                ReservationNumber: payload['ZBR_RFC_TRAKSYS_CONTROLRECIPE']['export']['PRODUCTION_ORDER_RESPONSE']['PR_OR_HEADER']['RESERVATION_NUMBER'],
            },
            PrOrBody: {
                Operations:  
                        Operation:(payload['ZBR_RFC_TRAKSYS_CONTROLRECIPE']['export']['PRODUCTION_ORDER_RESPONSE']['OPERATIONS'].*row map(valor, index) -> 
                                (
                                       {
                                            OperationNumber:valor['OPERATION_NUMBER'],
                                            PhaseNumber:valor['PHASE_NUMBER'],
                                            PhaseText:valor['PHASE_TEXT'],
                                            ResourceName:valor['RESOURCE_NAME']
                                        }
                                                
                                ) 
                ),
                Components:  
                        Component:(payload['ZBR_RFC_TRAKSYS_CONTROLRECIPE']['export']['PRODUCTION_ORDER_RESPONSE']['COMPONENTS'].*row map(valor, index) -> 
                                (
                                        {
                                            OperationItem:valor['OPERATION_ITEM'],
                                            PhaseNumbervalor: ['PHASE_NUMBER'],
                                            ItemNumber:valor['ITEM_NUMBER'],
                                            ComponentMaterialNumber:valor['COMPONENT_MATERIAL_NUMBER'],
                                            ComponentQty: valor['COMPONENT_QTY'],
                                            ComponentUoM:valor['COMPONENT_UOM'],
                                            ComponentDescription:valor['COMPONENT_DESCRIPTION'],
                                            CoProductIndicator:valor['CO_PRODUCT_INDICATOR'],
                                            ComponentScrap:valor['COMPONENT_SCRAP'],
                                            GoodsIssueStorageLocation:valor['GOODS_ISSUE_STORAGE_LOCATION'],
                                            ItemReservationNumber:valor['ITEM_RESERVCATION_NUMBER'],
                                        }
                                                
                                )
                )
            }
                
        }
        
}

