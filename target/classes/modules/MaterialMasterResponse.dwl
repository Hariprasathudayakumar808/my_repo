%dw 2.0
output application/xml 

---
{     
    ZMATMAS03:
        IDOC:
           row:(payload['ZBR_RFC_TRAKSYS_MATERIAL']['export'].MAT_DADOS.*row map(valor, index) ->
     (          
            {
                MATNR:valor.MATNR,
                MEINS:valor.MEINS,
                Z1MARCM:  {
                    WERKS: VALOR.WERKS 
                },
                Z1MAKTM:  {
                    MAKTX: VALOR.MAKTX 
                },                
            }      
     )
     )
}
