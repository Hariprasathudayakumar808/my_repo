%dw 2.0
import * from dw::core::Strings

output application/xml

var plannedOrder = (vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'ZPPPI_PLANNED_ORDER' and value.FTNO == '00000010' and value.CRID == payload))[0].ATWRT
var prOrNumber = (vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRHE.*row filter(value) -> value.CRID == payload).BID
var batchNumber = (vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRHE.*row filter(value) -> value.CRID == payload)[0].BATCH

---
{
     ProductionOrderResponses: 
        ProductionOrderResponse:
        {
            PrOrHeader:{
                MESKey:  if (plannedOrder == 'N/A') ((vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRHE.*row filter(value) -> value.CRID == payload).BID) else substringAfter(plannedOrder,'U'),               
                ControlRecipeNumber: payload,
                PrOrNumber: prOrNumber,
                PrOrType:  (vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'PPPI_PHASE_RESOURCE' and value.FTNO == '00000010' and value.CRID == payload))[0].ATWRT,
                Plant: (vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRHE.*row filter(value) -> value.CRID == payload).WERK,
                Material: (vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRHE.*row filter(value) -> value.CRID == payload).MATNR,
                PlannedQty: trim((vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'PPPI_ORDER_QUANTITY' and value.FTNO == '00000010' and value.CRID == payload))[0].ATWRT),
                UoM: (vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'PPPI_UNIT_OF_MEASURE' and value.FTNO == '00000010' and value.CRID == payload))[0].ATWRT,
                PlannedStartDate: ((vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRHE.*row filter(value) -> value.CRID == payload)[0].SCHED_START_DATE as LocalDateTime {format: 'eee MMM dd HH:mm:ss zzz yyyy'} as String {format: 'yyyy-MM-dd'}),
                PlannedStartTime: (vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRHE.*row filter(value) -> value.CRID == payload)[0].SCHED_START_TIME as LocalDateTime {format:'eee MMM dd HH:mm:ss zzz yyyy'} as String {format: 'HH:mm'},
                PlannedEndDate:  ((vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'ZPPPI_ORDER_END_DATE' and value.FTNO == '00000010' and value.CRID == payload))[0].ATWRT as Date {format: 'yyyyMMdd'} as String {format: 'yyyy-MM-dd'}),
                PlannedEndTime: (vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRHE.*row filter(value) -> value.CRID == payload)[0].SCHED_START_TIME as LocalDateTime {format:'eee MMM dd HH:mm:ss zzz yyyy'} as String {format: 'HH:mm'},
                ProductionVersion: (vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'PPPI_PHASE_RESOURCE' and value.FTNO == '00000010' and value.CRID == payload))[0].ATWRT,
                BatchNumber: if (batchNumber != null) (batchNumber) else (prOrNumber),
                ReservationNumber: payload,
            },
            PrOrBody: 
            {
                Operations: 
                {
                     Operation: 
                   {
                        OperationNumber:null,
                        PhaseNumber:null,
                        PhaseText:null,
                        ResourceName:(vars.rootMessage.payload.CONTROL_RECIPE_DOWNLOAD.tables.CRFV.*row filter(value, index) -> (value.ATNAM == 'PPPI_PHASE_RESOURCE' and value.CRID == payload))[0].ATWRT
                    }       
                },
                Components:  
                {
                    Component:
                    {                                    
                        OperationItem:null,
                        PhaseNumber:null,
                        ItemNumber:null,
                        ComponentMaterialNumber:null,
                        ComponentQty: null,
                        ComponentUoM:null,
                        ComponentDescription:null,
                        CoProductIndicator:null,
                        ComponentScrap:null,
                        GoodsIssueStorageLocation:null,
                        ItemReservationNumber:null,
                     }
                }
           }
      }
   
}