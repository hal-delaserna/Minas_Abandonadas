
rm(list = ls())


setwd("D:/Users/humberto.serna/Desktop/Fiscalização_do_Aproveitamento/Caducidade/DADOS_ABERTOS_CNPJ/")


colunas <- c('tipo_de_registro',
				  'cnpj',
				  'matriz_filial',
				  'razao_social', 
				  'nome_fantasia',
				  'situacao',  
				  'data_situacao')

wid <- c(1,-1,-1,14,1,150,55,2,8,-967)
	
 for (i in 0:800) {
cnpjReceitaFederal <- 
  as.list(
    read.fwf(file = 'F.K032001K.D81106D',  
						widths = wid,  
						col.names = colunas, 
						n = 100000, 
						skip = i*100000, 
						buffersize = 100000,
						colClasses = c("character","character","character","character","character","character","character")
						))

#cnpjReceitaFederal <- cnpjReceitaFederal[cnpjReceitaFederal$tipo_de_registro==1 & cnpjReceitaFederal$cnpj %in% lista,]

arquivo <- paste(i, "cnpjReceitaFederal.csv", sep = "")

write.table(cnpjReceitaFederal,file = arquivo,sep = ";", row.names = FALSE)

rm(cnpjReceitaFederal)
gc(reset = TRUE)
Sys.sleep(1)
}

