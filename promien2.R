a <- 200
b <- 50

rmin <- 5
rmax <- 8

lista_m <- c()
lista_n <- c()
for(i in seq(rmin,rmax, by= 0.01)){
  m = round(((a/i)-1)/2,1)
  n = round((((b/i)-2)/sqrt(3))+1,1)
  lista_m <- c(lista_m,m)
  lista_n <- c(lista_n,n)
}

lista_m <- lista_m[!lista_m%%c(1)]
lista_n <- lista_n[!lista_n%%c(1)]
lista_r <- c()
lista_r2 <- c()
for(i in lista_m){
  r=a/(2*i+1)
  lista_r<-c(lista_r,r)
}

for(j in lista_n){
  r= b/((2+(j-1)*sqrt(3)))
  lista_r2 <- c(lista_r2,r)
}

lista_r <- unique(lista_r)
lista_r2 <- unique(lista_r2)

