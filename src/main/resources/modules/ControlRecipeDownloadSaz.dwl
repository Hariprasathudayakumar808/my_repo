%dw 2.0
output application/xml encoding="UTF-8"

var mesKey = vars.mesKey

---


{
    ZBR_RFC_TRAKSYS_CONTROLRECIPE: {
        "import": {
            MESKEY: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW:mesKey,
                        HIGH:''
                    }
                
            },
            PRORNUMBER: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW: payload['ZBR_RFC_TRAKSYS_CREATEORDPRO']['export']['RETURN_MESSAGES']['row']['PRORNUMBER'],
                        HIGH:''
                    }
                    
            }
        }
    }
}