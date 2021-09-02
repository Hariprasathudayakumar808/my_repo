%dw 2.0
output application/xml encoding="UTF-8"

---
{
    ZBR_RFC_TRAKSYS_CONVPLORD: {
        "import": {
            ORDER_TYPE: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW:payload['ProductionOrderRequests']['ProductionOrderRequest']['OrderType'],
                        HIGH:''
                    }
                
            },
            PLANNED_ORDER: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW: payload['ProductionOrderRequests']['ProductionOrderRequest']['PlannedOrderNr'],
                        HIGH:''
                    }
                    
            }
        }
    }
}