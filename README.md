Celem projektu jest opracowanie i zaimplementowanie automatycznego systemu nawadniającego dla ogrodu o dowolnym kształcie spełniającym optymalne wymagania klienta. System jest oparty na kompaktowych zraszaczach okrągłych umożliwiających równomierne podlewanie ogrodu. Należy rozplanować optymalne rozmieszczenie zraszaczy minimalizując ich liczbę w taki sposób, aby koszt instalacji systemu nawadniania był jak najmniejszy spełniając jednocześnie zadane wymagania: 

  1. Promień $R \in(4; 8.5)$,
  
  2. Zraszacz umożliwia 7-stopniowe ustawianie sektorów zraszania w zakresie 90° do 360° w odstępach co 45°,
  
  3. Woda podlewa jednostajnie obszar będący w zasięgu zraszacza,
  
  4. Powierzchnia ogrodu musi być zraszana w 95%,
  
  5. Obszary podwójnego, potrójnego czy kilkakrotnego zraszania powinny zajmować jak najmniejszą powierzchnię.

Celem jest zrealizowanie wyznaczonych wymagań (1-5) oraz przedstawienie w sposób czytelny uzyskanych wyników w postaci tabeli oraz graficzne przedstawienie umiejscowienia zraszaczy na wyznaczonym regularnym obszarze - prostokątnej działce, bądź na obszarze nieregularnym. Również zaprezentowane będą różne sposoby pakowania okręgów na zadanym obszarze.  


# Teoria i analiza
## Pakowanie na planie kwadratu
Dla regularnych obszarów należy podać długość boku $a$ i $b$ i dla tych wartości wyliczamy optymalne promienie. Sprawdzamy, który z boków jest dłuższy, tak aby jak najwięcej całych lub połówek (z zał. 2) zraszaczy znajdowała się w wyznaczonym obszarze. 

Algorytm: generujemy ciąg arytmetyczny, na przedziale $R \in(4; 8,5)$, gdzie każdy kolejny element jest większy o $0.1$. Każdy element tego ciągu wstawiamy do następującej formuły: a/2*i w sytuacji gdzie bok b jest dłuższy, lub analogicznie b/2*i (Figure 1), gdzie $i$ oznacza element ciągu. W ten sposób otrzymujemy ile okręgów zmieści się na zadanym boku. Wyniki zapisujemy do listy, a następnie wybieramy tylko tą liczbę okręgów gdzie reszta z dzieleniajest równa 0.5 lub 1, tak aby doprowadzić do sytuacji, gdzie w obszarze znajdują się tylko całe lub połówki zraszaczy. w sytuacji gdzie bok $b$ jest dłuższy, lub analogicznie b/2

![image](https://user-images.githubusercontent.com/105323115/194773053-973253dd-993d-425a-9500-ad3a8a899ed5.png)

W ten sposób otrzymamy zapisane do listy optymalne długości promieni zapisaną do zmiennej $lista r$. 

Następnie generujemy współrzędne ułożenia zraszaczy. Aby to zrobić generujemy ciąg arytmetyczny należący do przedziału $i \in(0, b)$, gdzie każdy kolejny elemenent jest większy o promień R. Co drugi element z ciągu przypisujemy do zmiennej $parzyste$ i łączymy z ciągiem arytmetycznym z przedziału $j \in(0, a)$, gdzie każdy kolejny element jest większy o 2*R, w ten sposób otrzymujemy rezultat (Figure 2): 
![image](https://user-images.githubusercontent.com/105323115/194773193-f0f1779f-666d-4bf1-a5a4-a4c5ad79e8c0.png)

Gdy do elementów, które nie należą do zmiennej $parzyste$ dołączymy elementy ciągu arytmetycznego z przedziału $k \in(R, a)$, gdzie każdy kolejny element jest większy o 2 x R i dołączymy to do (Figure 2), otrzymamy (Figure 3):
![image](https://user-images.githubusercontent.com/105323115/194773256-d743741e-0b16-4874-8213-acb3969b7a4e.png)

Wszystkie wygenerowane środki okręgów zapisujemy do zmiennej $lista$.

## Pakowanie na planie trójkąta
Podobnie jak dla pakowania na planie kwadratu dla regularnych obszarów należy podać długość boku $a$ i $b$ i dla tych wartości wyliczamy optymalne promienie. Sprawdzamy, który z boków jest dłuższy, tak aby jak najwięcej całych lub połówek zraszaczy znajdowała się w wyznaczonym obszarze. 

Algorytm: generujemy ciąg arytmetyczny, na przedziale $R \in(4; 8.5)$, gdzie każdy kolejny element jest większy o $0.1$. 
![image](https://user-images.githubusercontent.com/105323115/194773339-97e9ca0e-4aab-4ef2-94b9-3e620c9210d4.png)

Załóżmy, że w rysunku (Figure 4) okręgi mają promień $r$. Każda para czerwonych linii ma odległość $r$ od siebie, a każda para niebieckich lini ma odległość $r*\sqrt(3)$, tak jak wysokość trójkąta przedstawiona na rysunku (Figure 5):

![image](https://user-images.githubusercontent.com/105323115/194773385-893b927a-34ee-4def-9b2d-81cf6ae4e311.png)

Jeśli chcemy żeby na boku $a$, znajdowało się m okręgów to obszar musi mieć 2 x m + 1 długości, a jeśli bok $b$ jest dłuższy i to na jego długości będziemy pakować n okręgów, to obszar musi mieć długość (2+(n-1) x √3). Przekształcamy te wzory, wyznaczając $m$ i $n$ i każdy element tego ciągu wstawiamy do następującej formuły: ((a/i)-1)/2, w sytuacji gdzie bok $b$ jest dłuższy, lub w przeciwnym przypadku: ((b/i)-2)/(√3) + 1, gdzie $i$ oznacza element ciągu. W ten sposób otrzymujemy ile okręgów zmieści się na zadanym boku. Wyniki zapisujemy do listy, a następnie należy wybrać tylko tą liczbę okręgów gdzie reszta z dzielenia jest równa 0.5 lub 1, tak aby doprowadzić do sytuacji, gdzie w obszarze znajdują się tylko całe lub połówki zraszaczy.

Następnie generujemy współrzędne ułożenia zraszaczy. Aby to zrobić generujemy ciąg arytmetyczny należący do przedziału $i \in(R, b)$, gdzie każdy kolejny elemnent jest większy o wysokość trójkąta, co jest przedstawione na rysunku (Figure 5), czyli o √3 x R. Co drugi element z ciągu przypisujemy do zmiennej $parzyste$ i łączymy z ciągiem arytmetycznym z przedziału $j \in(R, a)$, gdzie każdy kolejny element jest większy o 2 x R. Elementom nie należącym do zmiennej $parzyste$ dołączamy ciąg artmetyczny z przedziału $k \in(0, a)$, gdzie każdy kolejny element jest większy o 2 x R, w ten sposób otrzymujemy ułożenie przedstawione na wykresie (Figure 6): 

![image](https://user-images.githubusercontent.com/105323115/194774173-16f91e19-9170-484c-83ea-71bd377d80a7.png)

Wszystkie wygenerowane środki okręgów zapisujemy do zmiennej $lista$.
Możemy rozbudować ten sposób pakowania o uzupełnienie mniejszymi okręgami.

![image](https://user-images.githubusercontent.com/105323115/194774281-e2c05e35-a77c-4eb7-87d9-5b8cb52b76d5.png)

Zauważmy że mamy możliwość wpisania okręgu w trójkąt równoboczny, który powstaje dzięki połączeniu środków okręgów sąsiadujących ze sobą. W ten sposób jesteśmy w stanie łatwo obliczyć długość promienia nowo powstałego okręgu. Będzie on miał długość: (1/3) x R x √3. Następnie należy wygenerować współrzędne środków okręgów. W tym celu należy wygenerować ciąg z przedziału $i \in(R - (1/3) x R x √3, b)$, gdzie każdy kolejny element jest większy o (1/3) x R x √3. Przy takim wygenerowaniu punktów możemy zauważyć, pewien wzór/pattern, w którym wierzchołki się pokrywają z wierzchołkami zapisanymi w liście $lista$, która zawiera współrzędne okręgów już wygenerowanych. Na rysunku (Figure 7) zaznaczono te punkty w okręgi.

![image](https://user-images.githubusercontent.com/105323115/194774450-5151b55a-a4e1-469f-9288-7a9873e41e02.png)

Pozbywamy się powtarzających wierzchołków. Następnie do zmiennej $parzyste_ mniejsze$ wybieramy dwa pierwsze punkty, a dwa kolejne odrzucamy, a potem po raz kolejny wybieramy dwa kolejne elementy.
Dla przykładu mamy listę składającą się z takich elementów: 1, 2, 3, 4, 5, 6, 7, 8, 9.
Stosując ten algorytm otrzymamy: 1, 2, 5, 6, 9.
Do punktów wybranych do zmiennej $parzyste mniejsze$ dołączamy elementy ciagu z przedziału $i \in(0, a)$, gdzie każdy kolejny element jest większy o 2 x R. Do punktów nie należących do zmiennej $parzyste mniejsze$ dołączamy elementy ciagu z przedziału $j \in(R, a)$, gdzie każdy kolejny element jest większy o 2 x R, w ten sposób otrzymujemy: 

![image](https://user-images.githubusercontent.com/105323115/194774515-1090888e-0852-4614-88e1-19afcdfffc65.png)






