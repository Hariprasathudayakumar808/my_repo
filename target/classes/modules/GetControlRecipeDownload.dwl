%dw 2.0
output application/xml encoding="UTF-8"

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
                        LOW:payload['ControlRecipe']['MesKey'],
                        HIGH:''
                    }
                
            },
            PRORNUMBER: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW: payload['ControlRecipe']['PrOrNumber'],
                        HIGH:''
                    }
                    
            }
        }
    }
}