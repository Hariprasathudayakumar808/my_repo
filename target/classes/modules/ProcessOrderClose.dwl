%dw 2.0
output application/xml encoding="UTF-8"

---
{
    ZBR_RFC_TRAKSYS_ORDERCLOSE: {
        "import": {
            ORDERS: 
            {
                row:
                    {
                        SIGN:'I',
                        OPTION:'EQ',
                        LOW:payload['ControlRecipeStatusChanges']['ControlRecipeStatusChange']['PrOrNumber'],
                        HIGH:''
                    }
                
            }
        }
    }
}