rm(list = ls())

setwd("D:/Users/humberto.serna/Desktop/Fiscalização_do_Aproveitamento/Caducidade/DADOS_ABERTOS_CNPJ")


# cnpjs alvo ----
lista <- c('13cnpjReceitaFederal.csv',
           '2cnpjReceitaFederal.csv',
           '107cnpjReceitaFederal.csv',
           '127cnpjReceitaFederal.csv',
           '129cnpjReceitaFederal.csv',
           '182cnpjReceitaFederal.csv',
           '237cnpjReceitaFederal.csv',
           '10cnpjReceitaFederal.csv',
           '22cnpjReceitaFederal.csv',
           '38cnpjReceitaFederal.csv',
           '54cnpjReceitaFederal.csv',
           '63cnpjReceitaFederal.csv',
           '112cnpjReceitaFederal.csv',
           '152cnpjReceitaFederal.csv',
           '206cnpjReceitaFederal.csv',
           '246cnpjReceitaFederal.csv',
           '278cnpjReceitaFederal.csv',
           '20cnpjReceitaFederal.csv',
           '21cnpjReceitaFederal.csv',
           '23cnpjReceitaFederal.csv',
           '26cnpjReceitaFederal.csv',
           '50cnpjReceitaFederal.csv',
           '75cnpjReceitaFederal.csv',
           '83cnpjReceitaFederal.csv',
           '86cnpjReceitaFederal.csv',
           '106cnpjReceitaFederal.csv',
           '110cnpjReceitaFederal.csv',
           '144cnpjReceitaFederal.csv',
           '147cnpjReceitaFederal.csv',
           '150cnpjReceitaFederal.csv',
           '154cnpjReceitaFederal.csv',
           '172cnpjReceitaFederal.csv',
           '181cnpjReceitaFederal.csv',
           '197cnpjReceitaFederal.csv',
           '198cnpjReceitaFederal.csv',
           '220cnpjReceitaFederal.csv',
           '226cnpjReceitaFederal.csv',
           '240cnpjReceitaFederal.csv',
           '247cnpjReceitaFederal.csv',
           '248cnpjReceitaFederal.csv',
           '260cnpjReceitaFederal.csv',
           '266cnpjReceitaFederal.csv',
           '0cnpjReceitaFederal.csv',
           '1cnpjReceitaFederal.csv',
           '5cnpjReceitaFederal.csv',
           '7cnpjReceitaFederal.csv',
           '11cnpjReceitaFederal.csv',
           '12cnpjReceitaFederal.csv',
           '15cnpjReceitaFederal.csv',
           '19cnpjReceitaFederal.csv',
           '24cnpjReceitaFederal.csv',
           '25cnpjReceitaFederal.csv',
           '28cnpjReceitaFederal.csv',
           '29cnpjReceitaFederal.csv',
           '33cnpjReceitaFederal.csv',
           '35cnpjReceitaFederal.csv',
           '37cnpjReceitaFederal.csv',
           '39cnpjReceitaFederal.csv',
           '40cnpjReceitaFederal.csv',
           '41cnpjReceitaFederal.csv',
           '46cnpjReceitaFederal.csv',
           '47cnpjReceitaFederal.csv',
           '51cnpjReceitaFederal.csv',
           '52cnpjReceitaFederal.csv',
           '56cnpjReceitaFederal.csv',
           '68cnpjReceitaFederal.csv',
           '74cnpjReceitaFederal.csv',
           '78cnpjReceitaFederal.csv',
           '84cnpjReceitaFederal.csv',
           '85cnpjReceitaFederal.csv',
           '87cnpjReceitaFederal.csv',
           '94cnpjReceitaFederal.csv',
           '99cnpjReceitaFederal.csv',
           '100cnpjReceitaFederal.csv',
           '101cnpjReceitaFederal.csv',
           '102cnpjReceitaFederal.csv',
           '103cnpjReceitaFederal.csv',
           '108cnpjReceitaFederal.csv',
           '109cnpjReceitaFederal.csv',
           '111cnpjReceitaFederal.csv',
           '114cnpjReceitaFederal.csv',
           '118cnpjReceitaFederal.csv',
           '121cnpjReceitaFederal.csv',
           '123cnpjReceitaFederal.csv',
           '125cnpjReceitaFederal.csv',
           '128cnpjReceitaFederal.csv',
           '133cnpjReceitaFederal.csv',
           '137cnpjReceitaFederal.csv',
           '140cnpjReceitaFederal.csv',
           '141cnpjReceitaFederal.csv',
           '145cnpjReceitaFederal.csv',
           '149cnpjReceitaFederal.csv',
           '153cnpjReceitaFederal.csv',
           '158cnpjReceitaFederal.csv',
           '160cnpjReceitaFederal.csv',
           '163cnpjReceitaFederal.csv',
           '168cnpjReceitaFederal.csv',
           '179cnpjReceitaFederal.csv',
           '184cnpjReceitaFederal.csv',
           '189cnpjReceitaFederal.csv',
           '192cnpjReceitaFederal.csv',
           '194cnpjReceitaFederal.csv',
           '199cnpjReceitaFederal.csv',
           '200cnpjReceitaFederal.csv',
           '203cnpjReceitaFederal.csv',
           '205cnpjReceitaFederal.csv',
           '207cnpjReceitaFederal.csv',
           '211cnpjReceitaFederal.csv',
           '223cnpjReceitaFederal.csv',
           '224cnpjReceitaFederal.csv',
           '225cnpjReceitaFederal.csv',
           '227cnpjReceitaFederal.csv',
           '229cnpjReceitaFederal.csv',
           '230cnpjReceitaFederal.csv',
           '232cnpjReceitaFederal.csv',
           '245cnpjReceitaFederal.csv',
           '250cnpjReceitaFederal.csv',
           '251cnpjReceitaFederal.csv',
           '254cnpjReceitaFederal.csv',
           '263cnpjReceitaFederal.csv',
           '267cnpjReceitaFederal.csv',
           '272cnpjReceitaFederal.csv',
           '274cnpjReceitaFederal.csv')

# _____________ ----
  
cnpjReceitaFederal <- 
  data.frame(tipo_de_registro = c("a"), cnpj = c("a"), matriz_filial = c("a"), 
             razao_social = c("a"), nome_fantasia = c("a"), situacao = c("a"), 
             data_situacao = c("a"))


for (x in lista) {
    cnpjReceitaFederal <- 
    rbind(read.table(x, sep = ";", encoding = "ANSI", 
                     stringsAsFactors = FALSE, header = TRUE,
                     colClasses = c("character","character","character","character",
                                    "character","character","character")),
          cnpjReceitaFederal) }


inativos <- 
  cnpjReceitaFederal[cnpjReceitaFederal$situacao!="02",]



# processos ----


titulares <- 
  read.csv(file = "D:/Users/humberto.serna/Desktop/Fiscalização_do_Aproveitamento/Caducidade/Titulares.csv", 
             header = TRUE, sep = ";", stringsAsFactors = FALSE, encoding = "ANSI", fill = TRUE)


titulares$cpf.cnpj <- 
  titulares$cpf.cnpj %>%   gsub(pattern = "-", replacement = "") %>% 
  gsub(pattern = '\\.', replacement = "") %>% gsub(pattern = '\\/', replacement = "")

titulares[grepl(titulares$titular, pattern = "Veneza")==TRUE,]



resultado <- 
  left_join(inativos, titulares, by = c("cnpj" = "cpf.cnpj"))

View(resultado)




