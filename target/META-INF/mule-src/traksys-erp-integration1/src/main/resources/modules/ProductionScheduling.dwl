%dw 2.0
output application/xml encoding="UTF-8"

var materialSplit = vars.singleMaterial splitBy (".")

---
{
    ZBR_RFC_TRAKSYS_PLANNEDORDER: {
        "import": {
            BASIC_FINISH_DATE: {
                row:
                {
                    SIGN:'I',
                    OPTION:'BT',
                    LOW: (now() + |P7D|) as String {format: "y-MM-dd"},
                    HIGH: ''                  
                }                  
            },
            BASIC_START_DATE: {
                row:
                {
                    SIGN:'I',
                    OPTION:'BT',
                    LOW: now() as String {format: "y-MM-dd"},
                    HIGH: ''                  
                }                  
            },
            MATERIAL: {
                row:
                {
                    SIGN:'I',
                    OPTION:'BT',
                    LOW: materialSplit[0],
                    HIGH: ''                  
                }                  
            },
            PLANT:  
            {
                row:
                {
                    SIGN:'I',
                    OPTION:'EQ',
                    LOW: upper(vars.plantCode),
                    HIGH: ''                   
                }                  
            },
            VERSION:  
            {
                row:
                {
                    SIGN:'I',
                    OPTION:'EQ',
                    LOW: materialSplit[1],
                    HIGH: ''                   
                }                  
            }  
        }
    }
}