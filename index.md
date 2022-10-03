



# Entrelazados

En esta página se puede encontrar todos los recursos audiovisuales y de código de mi trabajo Entrelazados: el posthumanismo en la música electroacústica desarrollado en la ENES Morelia como parte de mi exámen de titulación en la licenciatura de Música y Tecnología Artística.


## Piezas

1. [**Preludio(Alienación)**](pages/preludio.md)
3. [**non-Human**](pages/non-Human.md)
4. [**LCSE**](pages/LCSE.md)
5. [**Intertwined**](pages/intertwined.md)

# Herramientas de partida

El desarrollo del proceso de composición del ciclo comienza con la generación de las vocales “abiológicas” propuestas por Clarence Barlow en su libro On Musiquantics (2012), las cuales están directamente relacionadas con lo no-corpóreo posthumano. En el diagrama de 2 dimensiones que elabora a partir de las tablas fonéticas de formantes vocales, Barlow realiza un espejo en el eje vertical de las formantes  de las vocales que da origen a nuevas vocales que solo pueden ser realizadas con medios tecnológicos (Fig. 2). Esto se tomó como punto de partida e implementó en el lenguaje de síntesis y programación algorítmica SuperCollider (Anexo 1). Los resultados obtenidos no resultaron en fonemas reconociblemente humanos, como era previsible, aunque tampoco parecieron de interés tímbrico y como material de partida en el contexto de las obras. Sin embargo, impulsaron una búsqueda creativa alrededor de la emisión de las vocales y su extrapolación fuera de lo corpóreo.   

<img src="../assets/Figura2 Herramientas de partida.png" alt="drawing" width="1000">


<img src="../assets/Alienacion3@4x%20(1).png" alt="drawing" width="1000">

<sub> Nota:  Tomado de Two-dimensional formant chart of the vowels with their (abiological) F1 mirror images de Clarence Barlow (p. 58), 2012, On Musiquantics.</sub>

En una segunda etapa se realizaron las grabaciones , análisis de las vocales y consonantes presentes del Alfabeto Internacional Fonético (IPA) (Fig. 3 y 4) y un código en SuperCollider que selecciona los fonemas consonantes de manera aleatoria. La aleatoriedad es controlada por medio de la distribución de probabilidades para cada zona de articulación fonética . Esta distribución es modificada con cada selección del algoritmo a través de la rotación de la lista comenzando con tendencia hacia la glotis y terminando con mayor probabilidad a las consonantes bilabiales (Fig. 5). 

<img src="../assets/Figura3 Herramientas de partida .png" alt="drawing" width="1000">
<sub>Nota. La figura ilustra la interfaz gráfica de Praat con los formantes,  las envolventes de amplitud y altura tomados en cuenta para el análisis tanto de vocales como de consonantes.</sub>

<img src="../assets/Figura4 Herramientas de partida .png" alt="drawing" width="1000">
Nota. Esta figura muestra el análisis de altura (F) y formantes (1, 2, 3, 4) de algunas de las vocales grabadas por una mujer traducidas a notas en sus respectivos registros y su reducción a octava.

<img src="../assets/Figura5 Herramientas de partida .png" alt="drawing" width="1000">
Nota. Esta distribución de probabilidades fue implementada en SuperCollider con un arreglo multidimensional que se homologa con las zonas del aparato fonador en su primera dimensión. Cada índice contiene todos los fonemas que pueden ser emitidos en esa zona. Una vez seleccionado el índice aleatoriamente, se selecciona nuevamente un fonema al azar dentro de todos los pertenecientes a esa zona.


Otra herramienta desarrollada fue la implementación de caminatas aleatorias  sobre la lista de vocales. El sistema es capaz de realizar caminatas aleatorias en una dimensión variando el tamaño del paso, número de pasos, semilla y punto de llegada (Fig. 6 y Fig. 7). 

<img src="../assets/Figura6 Herramientas de partida .png" alt="drawing" width="1000">
Nota. Visualización de múltiples caminatas aleatorias en una dimensión en SuperCollider.

<img src="../assets/Figura7 Herramientas de partida .png" alt="drawing" width="1000">
Nota.  Resultado del algoritmo de caminata aleatoria aplicado a la lista de formantes de las vocales.


También se realizó una homologación de la colocación de la lengua y la abertura de la mandíbula para emitir las vocales en el aparato fonador y sus partes con posiciones en el espacio (Fig. 8).

<img src="../assets/Figura8 Herramientas de partida .png" alt="drawing" width="1000">
Nota. En la figura se realiza una homologación entre la posición de la lengua (eje horizontal) y la apertura de la mandíbula (eje vertical) con posiciones en un arreglo de bocinas multicanal.


Esta etapa previa a la composición me permitió adquirir un conocimiento más práctico sobre el aparato fonador, las características tímbricas de las vocales, las consonantes y al mismo tiempo comenzar a imaginar  y diseñar los primeros elementos del universo sonoro del ciclo (Fig. 9).

<img src="../assets/Figura9 Herramientas de partida .png" alt="drawing" width="1000">
Nota. Lluvia de ideas y bosquejo de las ideas iniciales para cada pieza del ciclo y la interconexión de materiales e ideas a través de las piezas.
