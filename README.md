[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/hUnPAC5R)
# Pac-Man

## Equipo de desarrollo

- Barrionuevo Julian.
- Chebeste Alexis.
- Gonzalez Federico.
- Zolohaga Ruben.

## Capturas
Como principal tarea del proyecto nos enfocamos en desarrollar la idea de como queriamos que sea el aspecto del videojuego Pac-Man. Esta era una imagen ilustrativa de lo que podia llegar a ser. 

![pac 2](https://github.com/obj1-unahur-2023s2/TPGameIntegrador-messiwollok/assets/48963265/965f44f9-4682-4814-a032-cc827ddb8adf)

Una vez tomada la desición del aspecto del juego.  
Comenzamos con la adaptacion de una visual( tomada al azar como ejemplo) como paredes del escenario y la acoplacion de las pelotitas que luego seran reemplazadas por cerezas.
Como paso siguiente tambien incluimos dentro del escenario al personaje principal, en este caso Pac-Man.
En el caso de prueba, comprobamos la colision de pacman con las paredes, y la colision del mismo con la comida.

![pac 1](https://github.com/obj1-unahur-2023s2/TPGameIntegrador-messiwollok/assets/48963265/276dc993-f9a6-4426-80a0-d7251b8e5887)

El tablero del nivel 1 fue tomando forma a medida que ibamos avanzando con la visual del juego.

![pac 5](https://github.com/obj1-unahur-2023s2/TPGameIntegrador-messiwollok/assets/48963265/18ad0f78-089e-4eea-80ff-07c014c150e3)

Luego una vez ya finalizado el tablero, se agregaron los famosos fantasmas, que serian los enemigos de Pac-Man.
Testeamos infinidad de veces, la colision de los mismo con las paredes y los movimientos aleatorios.

![escenario](https://github.com/obj1-unahur-2023s2/TPGameIntegrador-messiwollok/assets/141649633/9dfc808c-bddd-4173-9939-a37fa1313e5f)

Tambien testeamos cuando Pac-Man come una de las comidas especiales, esta misma haria que los fantasmas cambien de color, y pasen a ser vulnerables a que Pac-Man los pueda deborar.

![pac 3](https://github.com/obj1-unahur-2023s2/TPGameIntegrador-messiwollok/assets/48963265/545585b3-b203-4b7c-bc8e-49ed7067ccb6)

Aca se puede apreciar como se agregaron las nuevas visuales al tablero, pero nos equivocamos en el orden de aniadir las visuales. Ya que las visuales de la comida deberian ir primero, para que los fantasmas y el mismo Pac-Man puedan superponerlos.
![pac 6](https://github.com/obj1-unahur-2023s2/TPGameIntegrador-messiwollok/assets/48963265/715bb670-db49-4295-8f93-33b2dc2e4fcf)

Este fue el proceso de armado del nivel dos, utilizamos paint para ir tapando las ubicaciones que ya poniamos cerezas, y asi darle una ubicacion dentro del codigo de wollok.
![tablero](https://github.com/obj1-unahur-2023s2/TPGameIntegrador-messiwollok/assets/141649633/2793fb1a-5f1b-43cc-9041-aa3d58b27fe9)






## Reglas de Juego / Instrucciones

-Primeramente para mover al Pac-man se debe mover con: 
  W : Que hace el movimiento hacia arriba.
  A : Que hace el movimiento hacia la izquierda.
  D : Que hace el movimiento hacia derecha.
  S : Que hace el movimiento hacia abajo.

   

  Los fantasmas se mueven aleatoriamente, por lo tanto, Pac-man debe avanzar por el tablero comiendo las cerezas. 
  Pero tambien debera evitar que los fantasmas lo coman a el. Ya que solamente tiene tres vidas nuestro pacman.
  El objetivo del juego es lograr que Pac-man coma todas las cerezas y pastillas que se encuentran en el tablero. 

  Pac-Man tiene la posibilidad de comer una comida especial para poder tener un poder, el cual hace que los fantasmas sean vulnerables ante él. A su vez, en el tablero se encuentran pesas, de las cuales pacman tendra que evitar comer, debido a que las mismas lo realentizaran durante 8 segundos.


  


## Otros

- Programacion en objetos - Turno mañana - Universidad Nacional de Hurlingham
- Versión de wollok: 3.0.0
- Una vez terminado, no tenemos problemas en que el repositorio sea público.
