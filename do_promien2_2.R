#ulozenie trojkatne dostosowujace długosc promieni na koncach obszaru 

dane <- data.frame()
for(R in lista_r){
  p <- ggplot() + coord_cartesian(xlim = c(0, a),
                                  ylim = c(0, b)
  )
  y0<-seq(R,b,by=sqrt(3)*R)
  lista<-c()
  
  parzyste <- y0[c(TRUE,FALSE)]
  
  for(i in 1:length(y0)){
    punkty <- if(y0[i] %in% parzyste){ 
      rbind((seq(R,a, by=2*R)),y0[i])
    } else{ 
      rbind((seq(0,a,by=2*R)),y0[i])
    }
    lista <- append(lista,list(punkty))
  }
  print(lista)
  
  # print(R)
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
    ) + coord_equal(
    ) + geom_hline(yintercept = 0, color = 'red'
    ) + geom_hline(yintercept = b, color = 'red'
    ) + geom_vline(xintercept = 0, color = 'red'
    ) + geom_vline(xintercept = a, color = 'red'
    ) + ggtitle(R)
  }
  lista_dopelnienie <- c()
  lista_t <- c()
  for(j in 1:length(lista)){
    t <- a - (first(lista[[j]][,length(lista[[j]])/2])+R)
    # t <- t[t >= 0]
    lista_t <- c(lista_t, t)
    
    if(t < R){
      if(t < R/2){
        x <- a
        y <- last(lista[[j]][,length(lista[[j]])/2])
        r <- t+R
        pkt <- rbind(x,y,r)
        lista_dopelnienie <- append(lista_dopelnienie,list(pkt))
      }else{
        x <- a
        y <- last(lista[[j]][,length(lista[[j]])/2])
        r <- t
        pkt <- rbind(x,y,r)
        lista_dopelnienie <- append(lista_dopelnienie,list(pkt))
      }
    }else{
      x <- (first(lista[[j]][,length(lista[[j]])/2])+R) + t/2
      y <- last(lista[[j]][,length(lista[[j]])/2])
      r <- t/2
      pkt <- rbind(x,y,r)
      lista_dopelnienie <- append(lista_dopelnienie,list(pkt))
    }
  }
  pole_dopelnienia <- c()
  for(dopelnienie in lista_dopelnienie){
    pole_d <- (pi*(dopelnienie[3,])^2)/2
    pole_dopelnienia <- c(pole_d,pole_dopelnienia)
    p <- p + geom_point(
      data = tibble(
        x = dopelnienie[1,],
        y = dopelnienie[2,],
        r = dopelnienie[3,]
      )
      ,
      aes(x =x, y = y)
    ) + geom_circle(
      data= tibble(
        x0 = dopelnienie[1,],
        y0 = dopelnienie[2,],
        r = dopelnienie[3,]
      )
      ,
      aes(x0 = x0, y0 = y0, r=r))
  }
  print(p)
  pole <- pole + sum(pole_dopelnienia)
  output <- c(R,a*b,round(pole,2),round(pole/(a*b),2))
  dane <- rbind(dane, output)
}
colnames(dane)<-c("Promien", "Pole obszaru", "Pole zalania", "Procent zalania obszaru")