%dw 2.0
output application/xml encoding="UTF-8"

---
{
    ZBR_RFC_TRAKSYS_GOODS_ISSUE: {
        "import": {
            BATCH: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW:payload['MaterialActualsGI']['MaterialActualGI']['BatchNr'],
                        HIGH:''
                    }
                
            },
            ENTRY_QNT: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW: payload['MaterialActualsGI']['MaterialActualGI']['Quantity'],
                        HIGH:''
                    }
                    
            },
            ENTRY_UOM: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW: payload['MaterialActualsGI']['MaterialActualGI']['UoM'],
                        HIGH:''
                    }
                    
            },
            MATERIAL: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW: payload['MaterialActualsGI']['MaterialActualGI']['Material'],
                        HIGH:''
                    }
                    
            },
            MESKEY: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW: payload['MaterialActualsGI']['MaterialActualGI']['MESKey'],
                        HIGH:''
                    }
                    
            },
            ORDERID: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW: payload['MaterialActualsGI']['MaterialActualGI']['PrOr'],
                        HIGH:''
                    }
                    
            },
            POSTG_DATE: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW: payload['MaterialActualsGI']['MaterialActualGI']['EventDate'],
                        HIGH:''
                    }
                    
            },
            STGE_LOC: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW: payload['MaterialActualsGI']['MaterialActualGI']['StorageLocation'],
                        HIGH:''
                    }
                    
            }
        }
    }
}