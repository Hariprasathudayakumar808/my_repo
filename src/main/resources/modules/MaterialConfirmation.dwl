%dw 2.0
output application/xml encoding="UTF-8"

---
{
    ZBR_RFC_TRAKSYS_ORDER_CONFIRM: {
        "import": {
            CLEAR_RES: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW:payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['ClearReservations'],
                        HIGH:''
                    }
                
            },
            ENTRY_UOM: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW: payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['UoM'],
                        HIGH:''
                    }
                    
            },
            MESKEY: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW: payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['MESKey'],
                        HIGH:''
                    }
                    
            },
            ORDERID: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW: payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['PrOrNumber'],
                        HIGH:''
                    }
                    
            },
            PHASE: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW: payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['Phase'],
                        HIGH:''
                    }
                    
            },
            PLANT: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW: payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['Plant'],
                        HIGH:''
                    }
                    
            },
            POSTG_DATE: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW: payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['ConfirmationDate'],
                        HIGH:''
                    }
                    
            },
            STATUS: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW: payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['Status'],
                        HIGH:''
                    }
                    
            },
            YIELD: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW: payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['Yield'],
                        HIGH:''
                    }
                    
            }
        }
    }
}