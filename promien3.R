#ustalanie dlugosci promienia po oklikaniu wybranej dzialki i ustaleniu skali

rmin <- 4*jM
rmax <- 8.5*jM

lista_m <- c()
lista_n <- c()
for(i in seq(rmin,rmax, by= 0.01)){
  m = round((((max(pkt_mapa[1,])-min(pkt_mapa[1,]))/i)-1)/2,1)
  n = round(((((max(pkt_mapa[2,])-min(pkt_mapa[2,]))/i)-2)/sqrt(3))+1,1)
  lista_m <- c(lista_m,m)
  lista_n <- c(lista_n,n)
}

lista_m <- lista_m[!lista_m%%c(0.5,1)]
lista_n <- lista_n[!lista_n%%c(0.5,1)]
lista_r <- c()
lista_r2 <- c()
for(i in lista_m){
  r=(max(pkt_mapa[1,])-min(pkt_mapa[1,]))/(2*i+1)
  lista_r2 <-c(lista_r2,r)
}

for(j in lista_n){
  r= (max(pkt_mapa[2,])-min(pkt_mapa[2,]))/((2+(j-1)*sqrt(3)))
  lista_r <- c(lista_r,r)
}

lista_r <- unique(lista_r)
lista_r2 <- unique(lista_r2)
print(lista_r)
