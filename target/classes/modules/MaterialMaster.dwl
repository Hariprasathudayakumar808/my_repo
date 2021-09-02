%dw 2.0
output application/xml encoding="UTF-8"

---
{
    ZBR_RFC_TRAKSYS_MATERIAL: {
        "import": {
            DATA: {
                row:
                {
                    SIGN:'I',
                    OPTION:'BT',
                    LOW: now() as String {format: "y-MM-dd"},
                    HIGH: now() as String {format: "y-MM-dd"}                    
                }                  
            },
            PLANTA:  
            {
                row:
                {
                    SIGN:'I',
                    OPTION:'EQ',
                    LOW: upper(vars.plantCode),
                    HIGH: ''                   
                }                  
            }  
			
        }
    }
}