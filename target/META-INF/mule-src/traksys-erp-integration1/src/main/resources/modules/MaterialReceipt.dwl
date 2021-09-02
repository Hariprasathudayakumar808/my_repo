%dw 2.0
output application/xml encoding="UTF-8"

---
{
    ZBR_RFC_TRAKSYS_GOODS_RECEIPT: {
        "import": {
            BATCH: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW:payload['MaterialActualsGR']['MaterialActualGR']['BatchNr'],
                        HIGH:''
                    }
                
            },
            ENTRY_QNT: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW: payload['MaterialActualsGR']['MaterialActualGR']['Quantity'],
                        HIGH:''
                    }
                    
            },
            ENTRY_UOM: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW: payload['MaterialActualsGR']['MaterialActualGR']['UoM'],
                        HIGH:''
                    }
                    
            },
            MATERIAL: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW: payload['MaterialActualsGR']['MaterialActualGR']['Material'],
                        HIGH:''
                    }
                    
            },
            MESKEY: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW: payload['MaterialActualsGR']['MaterialActualGR']['MESKey'],
                        HIGH:''
                    }
                    
            },
            ORDERID: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW: payload['MaterialActualsGR']['MaterialActualGR']['PrOr'],
                        HIGH:''
                    }
                    
            },
            POSTG_DATE: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW: payload['MaterialActualsGR']['MaterialActualGR']['EventDate'],
                        HIGH:''
                    }
                    
            },
            STGE_LOC: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW: payload['MaterialActualsGR']['MaterialActualGR']['StorageLocation'],
                        HIGH:''
                    }
                    
            }
        }
    }
}