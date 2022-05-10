#dostosowuje dlugosc promieni dla ulozenia na kwadracie
rmin <- 4
rmax <- 8

lista_m <- c()
lista_n <- c()
for(i in seq(rmin,rmax, by= 0.1)){
  m = round(b/(2*i),2)
  lista_m <- c(lista_m,m)
  n = round(a/(2*i),2)
  lista_n <- c(lista_n,n)
}
lista_m <- lista_m[!lista_m%%c(0.5,1)]
lista_n <- lista_n[!lista_n%%c(0.5,1)]
lista_r <- c()
if(b < a){
  for(i in lista_m){
    r=b/(2*i)
    lista_r<-c(lista_r,r)
  }
}else{
  for(i in lista_n){
    r=a/(2*i)
    lista_r<-c(lista_r,r)
  }
}

