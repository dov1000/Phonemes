library('xml2')
library('rvest')
library('stringr')
library('purrr')



url <- 'http://www.corpuscodea.es/corpus/documento.php?documento=CODEA-2438&loc=undefined&paleografica=off&mayusculas=off&busqueda='

xxx <- read.table(file = "C:/Users/daoban/OneDrive/NPL_work/Textos/España/1700/links.txt")
#xxx$V1 %>% as.character() %>% map(.f = function(vv) ((strsplit(vv, split = ".php\\?") %>% unlist)[2] %>% strsplit(split = "&") %>% unlist)[1]) %>% unlist()


for (url in xxx$V1) {
  i ==1
  webpage <- read_html(url)
  
  
  cr_html <- html_nodes(webpage,xpath = '//*[@id="textos"]')
  cr_table <- html_table(cr_html)
  
  paleo <- toString(i)+'_paleo'
  critico <- str(i)+'_critico'
  
  write.table(cr_table[[1]]$`TEXTO PALEOGRÁFICO`, "C:/Users/daoban/Documents/paleo.txt", sep="\t")
  write.table(cr_table[[1]]$`TEXTO CRÍTICO`, "C:/Users/daoban/Documents/critico.txt", sep="\t")
  i = i+1
}




webpage <- read_html(url)


cr_html <- html_nodes(webpage,xpath = '//*[@id="textos"]')
cr_table <- html_table(cr_html)

paleo <- year+'_paleo'
critico <- year+'_critico'




write.table(cr_table[[1]]$`TEXTO PALEOGRÁFICO`, "C:/Users/daoban/Documents/paleo.txt", sep="\t")
write.table(cr_table[[1]]$`TEXTO CRÍTICO`, "C:/Users/daoban/Documents/critico.txt", sep="\t")