# rm(list = ls())
options(editor = 'notepad') 
library(tidyverse)
library(lubridate)

# Processos ANM 
df_Processos_ANM_Dados_Abertos <- 
  readRDS(file = "~/D_Lake/RFB/data/df_Processos_ANM_Dados_Abertos.RData")
                            
options(editor = 'notepad') 
library(tidyverse)
library(lubridate)

# Processos ANM 
df_Processos_ANM_Dados_Abertos <- 
  readRDS(file = "./data/df_Processos_ANM_Dados_Abertos.RData")




# Fase de Lavra 

df_Processos_ANM_Dados_Abertos <-
  df_Processos_ANM_Dados_Abertos[df_Processos_ANM_Dados_Abertos$Fase.Atual %in% 
                                   c("Concessão de Lavra",
                                     "Licenciamento",
                                     "Lavra Garimpeira"),]

motivoSituacaoCadastral <-
  read.table(
    file = "./data/DominiosMotivoSituacaoCadastral.csv",
    sep = ";", encoding = "UTF-8", header = TRUE, 
    stringsAsFactors = FALSE, colClasses = c("character"))

df_Processos_ANM_Dados_Abertos$CPF.CNPJ.do.titular <- 
  gsub(pattern = "\\.", replacement = "", df_Processos_ANM_Dados_Abertos$CPF.CNPJ.do.titular) %>% 
  gsub(pattern = "\\/", replacement = "") %>% gsub(pattern = "-", replacement = "")


# CNPJs alvo ----
cnpj_alvos <- df_Processos_ANM_Dados_Abertos$CPF.CNPJ.do.titular

# cnpj_alvos <- df_Processos_ANM_Dados_Abertos[grepl(df_Processos_ANM_Dados_Abertos$Superintend?ncia, pattern = "SP"),]$CPF.CNPJ.do.titular



arquivos <-
  c(
    "K3241.K03200Y0.D10213.ESTABELE",
    "K3241.K03200Y1.D10213.ESTABELE",
    "K3241.K03200Y2.D10213.ESTABELE",
    "K3241.K03200Y3.D10213.ESTABELE",
    "K3241.K03200Y4.D10213.ESTABELE",
    "K3241.K03200Y5.D10213.ESTABELE",
    "K3241.K03200Y6.D10213.ESTABELE",
    "K3241.K03200Y7.D10213.ESTABELE",
    "K3241.K03200Y8.D10213.ESTABELE",
    "K3241.K03200Y9.D10213.ESTABELE"
  )


lista <- list()

for (i in 1:length(arquivos)) {
  
  lista[[i]] <-
    read.table(file = paste('./D_Lake/RFB/Arquivos/', arquivos[[i]], sep = ""),
               header = FALSE, 
               colClasses = c("character",
                              "character",
                              "character",
                              "character",
                              "NULL", 		# Nome Fantasia
                              "character",
                              "character",
                              "character",
                              "NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL"),
               sep = ";", #nrows = 10000, 
               fill = TRUE,
               encoding = 'ISO-8859', 
               quote = "\""
    )
}

cnpj_Dados_Abertos <- 
  do.call("rbind", lista)
rm(lista)

# renomeando colunas
colnames(cnpj_Dados_Abertos) <- 
  c("cnpjBasico","cnpjOrdem","dv","matrizFilial",
    "situacaoCadastral","dataSituacao","motivo")

# cnpj sem caracteres que n?o d?gitos
cnpj_Dados_Abertos$cnpj <- 
  paste(cnpj_Dados_Abertos$cnpjBasico , cnpj_Dados_Abertos$cnpjOrdem, 
        cnpj_Dados_Abertos$dv, sep = "")
cnpj_Dados_Abertos$cnpjBasico <- NULL
cnpj_Dados_Abertos$cnpjOrdem <- NULL
cnpj_Dados_Abertos$dv <- NULL

# delimitando Situa??o cadastral

#  SITUA??O CADASTRAL:
# 01 - NULA
# 2 - ATIVA
# 3 - SUSPENSA
# 4 - INAPTA
# 08 - BAIXADA

motivos_Baixa <- 
  c(
    1,		# EXTIN??O POR ENCERRAMENTO LIQUIDA??O VOLUNT?RIA
    2,		# INCORPORA??O
    3,		# FUS?O
    4,		# CIS?O TOTAL 
    5,		# ENCERRAMENTO DA FAL?NCIA
    6,		# ENCERRAMENTO DA LIQUIDA??O
    7,		# ELEVA??O A MATRIZ
    8,		# TRANSPASSE 
    9,		# N?O IN?CIO DE ATIVIDADE
    10,		# EXTIN??O PELO ENCERRAMENTO DA LIQUIDA??O JUDICIAL
    11,		# ANULA??O POR MULTICIPLIDADE
    12,		# ANULA??O ONLINE DE OFICIO
    13,		# OMISSA CONTUMAZ
    14,		# OMISSA N?O LOCALIZADA
    15,		# INEXISTENTE DE FATO
    16,		# ANULA??O POR V?CIOS
    17,		# BAIXA INICIADA E AINDA N?O DEFERIDA
    18,		# INTERRUP??O TEMPOR?RIA DAS ATIVIDADES
    19,		# OMISSO DE DIRPJ AT? 5 EXERC?CIOS
    20,		# EM CONDI??O DE INAPTID?O
    21,		# PEDIDO DE BAIXA INDEFERIDA
    22,		# RESTABELECIMENTO COM CERTID?O POSITIVA COM EFEITO DE NEGATIVA
    23,		# COM PEND?NCIA FISCAL
    24,		# POR EMISS?O CERTID?O NEGATIVA
    25,		# CERTID?O POSITIVA COM EFEITO DE NEGATIVA
    26,		# IRREGULARIDADE DE PAGAMENTO
    27,		# IRREGULARIDADE DE RECOLHIMENTO E EXIGIBILIDADE SUSPENSA
    28,		# TRANSFER?NCIA FILIAL CONDI??O MATRIZ
    29,		# AGUARDANDO CONF. DE DIRPJ/DIPJ
    30,		# ANR - AGUARDANDO CONF. DE DIRPJ/DIPJ
    31,		# EXTIN??O DA FILIAL
    32,		# INEXISTENTE DE FATO - ADE/COSAR
    33,		# TRANSFER?NCIA DO ?RG?O LOCAL A CONDI??O DE FILIAL DO ?RG?O REGIONAL
    34,		# ANULA??O DE INSCRI??O INDEVIDA
    35,		# EMPRESA ESTRANGEIRA AGUARDANDO DOCUMENTA??O
    36,		# PR?TICA IRREGULAR DE OPERA??O DE COMERCIO EXTERIOR
    37,		# BAIXA DE PRODUTOR RURAL
    38,		# BAIXA DEFERIDA PELA RFB AGUARDANDO ANALISE DO CONVENENTE
    39,		# BAIXA DEFERIDA PELA RFB E INDEFERIDA PELO CONVENENTE
    40,		# BAIXA INDEFERIDA PELA RFB E AGUARDANDO ANALISE DO CONVENENTE
    41,		# BAIXA INDEFERIDA PELA RFB E DEFERIDA PELO CONVENENTE
    42,		# BAIXA INDEFERIDA PELA RFB E SEFIN, AGUARDANDO ANALISE SEFAZ
    43,		# BAIXA DEFERIDA PELA RFB, AGUARDANDO ANALISE DA SEFAZ E INDEFERIDA PELA SEFIN
    44,		# BAIXA DEFERIDA PELA RFB E SEFAZ, AGUARDANDO ANALISE SEFIN
    45,		# BAIXA DEFERIDA PELA RFB, AGUARDANDO ANALISE DA SEFIN E INDEFERIDA PELA SEFAZ
    46,		# BAIXA DEFERIDA PELA RFB E SEFAZ E INDEFERIDA PELA SEFIN
    47,		# BAIXA DEFERIDA PELA RFB E SEFIN E INDEFERIDA PELA SEFAZ
    48,		# BAIXA INDEFERIDA PELA RFB, AGUARDANDO ANALISE SEFAZ E DEFERIDA PELA SEFIN
    49,		# BAIXA INDEFERIDA PELA RFB, AGUARDANDO ANALISE DA SEFAZ E INDEFERIDA PELA SEFIN
    50,		# BAIXA INDEFERIDA PELA RFB, DEFERIDA PELA SEFAZ E AGUARDANDO ANALISE DA SEFIN
    51,		# BAIXA INDEFERIDA PELA RFB E SEFAZ, AGUARDANDO ANALISE DA SEFIN
    52,		# BAIXA INDEFERIDA PELA RFB, DEFERIDA PELA SEFAZ E INDEFERIDA PELA SEFIN
    53,		# BAIXA INDEFERIDA PELA RFB E SEFAZ E DEFERIDA PELA SEFIN
    54,		# BAIXA - TRATAMENTO DIFERENCIADO DADO AS ME E EPP (LEI COMPLEMENTAR NUMERO 123/2006)
    55,		# DEFERIDO PELO CONVENENTE, AGUARDANDO ANALISE DA RFB
    60,		# ARTIGO 30, VI, DA IN 748/2007
    61,		# INDICIO INTERPOS. FRAUDULENTA
    62,		# FALTA DE PLURALIDADE DE SOCIOS
    63,		# OMISS?O DE DECLARA??ES
    64,		# LOCALIZA??O DESCONHECIDA
    66,		# INAPTID?O
    67,		# REGISTRO CANCELADO
    70,		# ANULA??O POR N?O CONFIRMADO ATO DE REGISTRO DO MEI NA JUNTA COMERCIAL
    71,		# INAPTID?O (LEI 11.941/2009 ART.54)
    72,		# DETERMINA??O JUDICIAL
    73,		# OMISS?O CONTUMAZ
    74,		# INCONSIST?NCIA CADASTRAL
    80		# BAIXA REGISTRADA NA JUNTA, INDEFERIDA NA RFB
  )


df_cnpj_Baixados <- 
  cnpj_Dados_Abertos[cnpj_Dados_Abertos$cnpj %in% cnpj_alvos &
                       cnpj_Dados_Abertos$motivo %in% motivos_Baixa,]



df_cnpj_Baixados$dataSituacao <- 
  lubridate::ymd(cnpj_Lista_Baixados$dataSituacao)

df_cnpj_Baixados$matrizFilial <- 
  gsub(pattern = "1", replacement = "Matriz", df_cnpj_Baixados$matrizFilial) %>% 
  gsub(pattern = "2", replacement = "Filal")


df_cnpj_Baixados$situacaoCadastral <- 
  gsub(pattern = "3", replacement = "SUSPENSA", df_cnpj_Baixados$situacaoCadastral) %>% 
  gsub(pattern = "4", replacement = "INAPTA") %>% 
  gsub(pattern = "8", replacement = "BAIXADA") 

df_cnpj_Baixados <- 
  left_join(df_cnpj_Baixados, motivoSituacaoCadastral, by = c("motivo" = "C?digo"))


df_cnpj_Baixados <- 
  df_cnpj_Baixados[,c("cnpj", "matrizFilial", "nomeFantasia", "situacaoCadastral", 
                      "dataSituacao", "motivo", "Descri??o")]


# saveRDS(object = df_cnpj_Baixados, file = "D:/Users/humberto.serna/Documents/D_Lake/RFB/CNPJs_Baixados.RDATA")

# saveRDS(object = cnpj_Dados_Abertos, file = "D:/Users/humberto.serna/Documents/D_Lake/RFB/CNPJs_BRASIL_COMPLETO.RDATA")



############ TELA LIVRE ###############



library(rvest)

xml2::read_html(
  x = "D:/Users/humberto.serna/Desktop/Fiscaliza??o_do_Aproveitamento/Caducidade/processos_SP.htm")

rvest::html_table()


left_join(cnpj_Dados_Abertos, motivoSituacaoCadastral, 
          by = c("situacaoCadastral" = "C?digo"))





df_cnpj_Baixados <- 
  cnpj_Dados_Abertos[cnpj_Dados_Abertos$cnpj %in% cnpj_alvos &
                       cnpj_Dados_Abertos$situacaoCadastral == "8",]
