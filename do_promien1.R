for(R in lista_r){
  p <- ggplot() + coord_cartesian(xlim = c(0, a),
                                  ylim = c(0, b)
  )
  y0<-seq(0,b,by=R)
  lista<-c()
  
  parzyste <- y0[c(TRUE,FALSE)]
  
  for(i in 1:length(y0)){
    punkty <- if(y0[i] %in% parzyste){ 
      rbind((seq(0,a, by=2*R)),y0[i])
    } else{ 
      rbind((seq(R,a,by=2*R)),y0[i])
    }
    lista <- append(lista,tibble(punkty))
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
    ) + geom_vline(xintercept = a, color = 'red')
    
  }
  
  print(p)
  
}