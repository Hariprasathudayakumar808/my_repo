%dw 2.0
output application/xml

var zMesO =  (vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFT.*row filter(value, index) -> (value.COSTR == 'Z_MES_O'  and value.CRID == payload)).FTNO
var zMesC =  (vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFT.*row filter(value, index) -> (value.COSTR == 'Z_MES_C'  and value.CRID == payload)).FTNO

---
{
     ProductionOrderResponses: 
        ProductionOrderResponse:
        {
            PrOrHeader:{
                ControlRecipeNumber: payload,
                PrOrNumber: (vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRHE.*row filter(value) -> value.CRID == payload).BID,
                PrOrType:  (vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'ZPPPI_PROC_ORDER_TYPE' and value.FTNO == '00000010' and value.CRID == payload))[0].ATWRT,
                Plant: (vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRHE.*row filter(value) -> value.CRID == payload).WERK,
                Material: (vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRHE.*row filter(value) -> value.CRID == payload).MATNR,
                PlannedQty: trim((vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'PPPI_ORDER_QUANTITY' and value.FTNO == '00000010' and value.CRID == payload))[0].ATWRT),
                UoM: (vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'PPPI_UNIT_OF_MEASURE' and value.FTNO == '00000010' and value.CRID == payload))[0].ATWRT,
                PlannedStartDate:((vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'ZPPPI_SCHEDULED_START_DATE' and value.FTNO == '00000010' and value.CRID == payload))[0].ATWRT as Date {format: 'yyyyMMdd'} as String {format: 'yyyy-MM-dd'}),
                PlannedStartTime: (vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'ZPPPI_SCHEDULED_START_TIME' and value.FTNO == '00000010' and value.CRID == payload))[0].ATWRT as LocalTime {format:'HHmmss'} as String {format: 'HH:mm'},
                PlannedEndDate: ((vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'ZPPPI_SCHEDULED_END_DATE' and value.FTNO == '00000010' and value.CRID == payload))[0].ATWRT as Date {format: 'yyyyMMdd'} as String {format: 'yyyy-MM-dd'}),
                PlannedEndTime: (vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'ZPPPI_SCHEDULED_END_TIME' and value.FTNO == '00000010' and value.CRID == payload))[0].ATWRT as LocalTime {format:'HHmmss'} as String {format: 'HH:mm'},
                ProductionVersion: (vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'ZPPPI_PROD_VERSION' and value.FTNO == '00000010' and value.CRID == payload))[0].ATWRT,
                BatchNumber: (vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRHE.*row filter(value) -> value.CRID == payload).BATCH,
                ReservationNumber: (vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'PPPI_RESERVATION' and value.FTNO == '00000010' and value.CRID == payload))[0].ATWRT,
            },
            PrOrBody: {
                Operations: 
                     Operation: (zMesO map(valor, index) ->  
                                (
                                       {
                                            OperationNumber:(vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'PPPI_OPERATION' and value.FTNO == valor and value.CRID == payload))[0].ATWRT,
                                            PhaseNumber:(vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'PPPI_PHASE' and value.FTNO == valor and value.CRID == payload))[0].ATWRT,
                                            PhaseText:(vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'PPPI_PHASE_SHORT_TEXT' and value.FTNO == valor and value.CRID == payload))[0].ATWRT,
                                            ResourceName:(vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'PPPI_PHASE_RESOURCE' and value.FTNO == valor and value.CRID == payload))[0].ATWRT
                                        }                                                
                                ) 
                        
                ),
                Components:  
                    Component:(zMesC map(valor, index) -> 
                                (
                                        {
                                            OperationItem:(vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'PPPI_OPERATION' and value.FTNO == valor and value.CRID == payload))[0].ATWRT,
                                            PhaseNumber:(vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'PPPI_PHASE' and value.FTNO == valor and value.CRID == payload))[0].ATWRT,
                                            ItemNumber:(vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'PPPI_MATERIAL_ITEM' and value.FTNO == valor and value.CRID == payload))[0].ATWRT,
                                            ComponentMaterialNumber:(vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'PPPI_MATERIAL' and value.FTNO == valor and value.CRID == payload))[0].ATWRT,
                                            ComponentQty: trim((vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'PPPI_MATERIAL_QUANTITY' and value.FTNO == valor and value.CRID == payload))[0].ATWRT),
                                            ComponentUoM:(vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'PPPI_UNIT_OF_MEASURE' and value.FTNO == valor and value.CRID == payload))[0].ATWRT,
                                            ComponentDescription:(vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'PPPI_MATERIAL_SHORT_TEXT' and value.FTNO == valor and value.CRID == payload))[0].ATWRT,
                                            CoProductIndicator:(vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'PPPI_MATERIAL_CO_PRODUCT' and value.FTNO == valor and value.CRID == payload))[0].ATWRT,
                                            ComponentScrap:trim((vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'ZPPPI_COMPONENT_SCRAP' and value.FTNO == valor and value.CRID == payload))[0].ATWRT),
                                            GoodsIssueStorageLocation:(vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'PPPI_STORAGE_LOCATION' and value.FTNO == valor and value.CRID == payload))[0].ATWRT,
                                            ItemReservationNumber:(vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'PPPI_RESERVATION_ITEM' and value.FTNO == valor and value.CRID == payload))[0].ATWRT,
                                        }
                                                
                                ) 
                )
            }
           
      }
   
}