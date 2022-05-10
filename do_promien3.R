#wybieranie okregow ktore mieszcza sie w oklikanej dzialce

for(R in lista_r){
  p <- ggplot() + coord_cartesian(xlim = c(zero_x, a),
                                  ylim = c(zero_y, b)
  )
  y0<-seq(zero_y + R,b,by=sqrt(3)*R)
  lista_pom<-c()
  
  parzyste <- y0[c(TRUE,FALSE)]
  
  for(i in 1:length(y0)){
    punkty <- if(y0[i] %in% parzyste){ 
      rbind((seq(zero_x + R,a, by=2*R)),y0[i])
    } else{ 
      rbind((seq(zero_x,a,by=2*R)),y0[i])
    }
    lista_pom <- append(lista_pom,list(punkty))
  }
  
  lista <- list()
  for(i in 1:length(lista_pom)){
    pozycje <- which(point.in.polygon(lista_pom[[i]][1,],lista_pom[[i]][2,],pkt_mapa[1,],pkt_mapa[2,])!=0)
    if(length(pozycje)==1){
      lista <- append(lista, list(t(t((lista_pom[[i]][,pozycje])))))
    }else{
      lista <- append(lista, list(lista_pom[[i]][,pozycje]))
    }
  }
  parzyste_pole <- lista[c(T,F)]
  lista_pole<-c()
  lista_p <- c()
  for(pole_ok in 1:length(lista)){
    if(lista[pole_ok] %in% parzyste_pole ){
      d <- seq(first(lista[[pole_ok]][,1]), first(lista[[pole_ok]][,length(lista[[pole_ok]])/2]), by=2*R)
      for(m1 in length(d)){
        if(round((2*R)*(m1)) <= a){
          ilosc <- length(d)
        }else{
          ilosc <- length(d)-1
        }
      }
      pole <- (ilosc*pi*R^2)
      lista_pole <- c(lista_pole,pole)
      
    }else{
      e <- seq(first(lista[[pole_ok]][,1]), first(lista[[pole_ok]][,length(lista[[pole_ok]])/2]), by=2*R)
      for(m2 in length(e)){
        if(round(R + 2*R*(m2-1)) <= a){
          ilosc_2 <- length(e)
        }else{
          ilosc_2 <- length(e) - 1
        }
      }
      pole <- ((pi*R^2)/2)+(pi*R^2)*(ilosc_2-1)
      lista_pole <- c(lista_pole,pole)
    }
    
    licznik <- 0
    if(round(first(lista[[pole_ok]][,length(lista[[pole_ok]])/2]), 1) == a){
      licznik <- licznik +1
      lista_p <- c(lista_p, licznik)
    }
    
  }
  lista_a <-c()
  for(pole_ok in 1:length(lista)){
    if(sum(lista_p) >= 1 && (round(first(lista[[pole_ok]][,length(lista[[pole_ok]])/2]),1 )== a)){
      pole2 <- (((pi*R^2)/2)*(sum(lista_p)))
      lista_a <- c(lista_a, pole2)
    }
    
  }
  pole <- sum(lista_a)/length(lista)
  pole <- pole + sum(lista_pole)
  if(round(first(lista[[pole_ok]][2,]) + R) != b){
    pole <- lista_pole[-length(lista_pole)]
    pole <- sum(pole)
    f <- lista_pole[length(lista_pole)]/2
    pole <- pole + f
  }
  
  if(round(first(lista[[pole_ok]][,length(lista[[pole_ok]])/2]),1 )== a && round(first(lista[[pole_ok]][2,])) == b ){
    pole <- pole + ((1/4)*(pi*R^2))
  }
  
  for(pole_ok in 1:length(lista)){
    if(lista[pole_ok] %in% parzyste_pole ){
      d <- seq(first(lista[[pole_ok]][,1]), first(lista[[pole_ok]][,length(lista[[pole_ok]])/2]), by=2*R)
      
      if((round((2*R)*(length(d))) <= a)){
        
      }else{
        if(round(first(lista[[pole_ok]][,length(lista[[pole_ok]])/2]),1 )== a){
          lista[[pole_ok]] <- lista[[pole_ok]]
        }else{
          lista[[pole_ok]] <- lista[[pole_ok]][,-length(d)]
        }
      }
      
      
    }else{
      e <- seq(first(lista[[pole_ok]][,1]), first(lista[[pole_ok]][,length(lista[[pole_ok]])/2]), by=2*R)
      
      if(round(R + 2*R*(length(e)-1)) <= a){
        
      }else{
        if(round(first(lista[[pole_ok]][,length(lista[[pole_ok]])/2]),1 ) == a){
          ista[[pole_ok]] <- lista[[pole_ok]]
        }else{
          lista[[pole_ok]] <- lista[[pole_ok]][,-length(e)]
        }
      }
    }
  }
  
  
  for(okrag in lista){
    p <- p + geom_point(
      data = tibble(
        x = okrag[1,],
        y = okrag[2,]
      )
      ,
      aes(x =x, y = y)
    ) + geom_circle(
      data= tibble(
        x0 = okrag[1,], 
        y0 = okrag[2,]
      )
      ,
      aes(x0 = x0, y0 = y0, r=R)
    ) + geom_hline(yintercept = zero_y, color = 'red'
    ) + geom_hline(yintercept = b, color = 'red'
    ) + geom_vline(xintercept = zero_x, color = 'red'
    ) + geom_vline(xintercept = a, color = 'red'
    )+ ggtitle(R/jM) + coord_equal()
  }
  p <- p + geom_point(
    data = tibble(
      x = pkt_mapa[1,],
      y = pkt_mapa[2,]
    )
    ,
    aes(x =x, y = y), color = "magenta"
  ) + geom_polygon(
    data = tibble(
      x = pkt_mapa[1,],
      y = pkt_mapa[2,]
    ),
    aes(x =x, y = y), color = "magenta", fill = NA
  )
  
  print(p)  
}
