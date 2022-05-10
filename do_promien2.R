#ulozenie trojkatne z malymi okragami pomiedzy 

for(R in lista_r){
  p <- ggplot() + coord_cartesian(xlim = c(0, a),
                                  ylim = c(0, b)
  )
  y0<-seq(R,b,by=sqrt(3)*R)
  parzyste <- y0[c(TRUE,FALSE)]
  lista<-c()
  
  mniejsze <- seq(R-(1/3)*R*sqrt(3), b, by=(1/3)*R*sqrt(3))
  mniejsze <- mniejsze[c(T,F,T)]
  parzyste_mniejsze <- mniejsze[c(T,T,F,F)]
  
  for(i in 1:length(y0)){
    punkty <- if(y0[i] %in% parzyste){ 
      rbind((seq(R,a, by=2*R)),y0[i])
    } else{ 
      rbind((seq(0,a,by=2*R)),y0[i])
    }
    lista <- append(lista,tibble(punkty))
  }
  # print(lista)
  lista_mniejsze <- c()
  for(i in 1:length(mniejsze)){
    punkty_mniejsze <- if(mniejsze[i] %in% parzyste_mniejsze){ 
      rbind((seq(0,a, by=2*R)),mniejsze[i])
    } else{ 
      rbind((seq(R,a,by=2*R)),mniejsze[i])
    }
    lista_mniejsze <- append(lista_mniejsze,tibble(punkty_mniejsze))
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
    ) + ggtitle(R, (1/3)*R*sqrt(3))
    # print(okrag)
  }
  
  # print(p)
  print(R)
  for(okrag_mniejszy in lista_mniejsze){
    p <- p + geom_point(
      data = tibble(
        x = okrag_mniejszy[1,],
        y = okrag_mniejszy[2,]
      )
      ,
      aes(x =x, y = y)
    ) + geom_circle(
      data= tibble(
        x0 = okrag_mniejszy[1,], 
        y0 = okrag_mniejszy[2,]
      )
      ,
      aes(x0 = x0, y0 = y0, r=(1/3)*R*sqrt(3))
    )
    # print(okrag_mniejszy) 
  }
  lista_dopelnienie <- c()
  lista_t <- c()
  for(j in 1:length(lista)){
    t <- a - (first(lista[[j]][,length(lista[[j]])/2])+R)
    # t <- t[t >= 0]
    lista_t <- c(lista_t, t)
    
    if(t < R){
      if(t < R/2){
        # x <- a
        # y <- last(lista[[j]][,length(lista[[j]])/2])
        # r <- R
        # pkt <- rbind(x,y,r)
        # lista_dopelnienie <- append(lista_dopelnienie,list(pkt))
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
  
  for(dopelnienie in lista_dopelnienie){
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
  # p <- p + geom_point(
  #   data = tibble(
  #     x = punkty_mapa$x,
  #     y = punkty_mapa$y
  #   )
  #   ,
  #   aes(x =x, y = y), color = "magenta"
  # ) + geom_polygon(
  #   data = tibble(
  #     x = pkt_mapa[1,],
  #     y = pkt_mapa[2,]
  #   ),
  #   aes(x =x, y = y), color = "magenta", fill = NA
  # )
  # 
  print(p)  
}