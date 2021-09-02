%dw 2.0
output application/xml 

---
{     
ProductionSchedules: 
     ProductionSchedule:       (payload['ZBR_RFC_TRAKSYS_PLANNEDORDER']['export'].DETAILEDLIST.*row map(valor, index) ->
     (          
            {
                Site:valor.PLAN_PLANT,
                ScheduleID:valor.PLANNEDORDER_NUM,
                ERPcode:valor.PLANNEDORDER_NUM,
                Version:valor.VERSION,
                Resource:valor.LINE,
                Material:valor.MATERIAL,
                StartInflow:valor.ORDER_START_DATE  as LocalDateTime{format:'eee MMM dd HH:mm:ss zzz yyyy'} as String {format:'yyyy-MM-dd'},
                EndInflow:valor.ORDER_FIN_DATE  as LocalDateTime{format:'eee MMM dd HH:mm:ss zzz yyyy'} as String {format:'yyyy-MM-dd'},
                Quantity:valor.TOTAL_PLORD_QTY,
                UoM:valor.BASE_UOM,
                Status:valor.FIRMING_IND,
            }      
     )
     )
}
