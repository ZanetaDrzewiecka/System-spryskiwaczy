#dodawanie dzialki, obliczanie dlugosci skali, okreslanie wspolrzednych wierzcholkow dzialki 

#Podaj skale:
skala <- 60

#Podaj ilosc wierzchołkow
ilosc_wierzcholkow <- 15

#Podaj sciezke do zdjecia dzialki
fpath <- "D:/zadanie2.png"

obraz <- load.image(fpath)
plot(obraz)
p2p <- function(n = 1)
{
  ans <- c()
  while (n > 0) {
    p <- locator(2, type = "o", pch = 3, col = "magenta")
    if (is.null(p)) break
    ans <- c(ans, sqrt(sum(sapply(p, diff)^2)))
    n <- n - 1
  }
  return(ans)
}
d <- p2p()
jM <- d/skala
punkty_mapa <- locator(n= ilosc_wierzcholkow , type = "p", col = "blue")
pkt_mapa <- rbind(punkty_mapa$x, punkty_mapa$y)
pkt_mapa <- Rotation(t(pkt_mapa),(180*pi)/180)
pkt_mapa <-(pkt_mapa) %*% matrix(c(-1,0,0,1), ncol = 2)
pkt_mapa <- t(pkt_mapa)

a <- max(pkt_mapa[1,])
b <- max(pkt_mapa[2,])

zero_x <- min(pkt_mapa[1,])
zero_y <- min(pkt_mapa[2,])

