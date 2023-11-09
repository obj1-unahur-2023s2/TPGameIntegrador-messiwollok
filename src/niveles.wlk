import comida.*
import pared.*
import pacman.*
import comida.*
import wollok.game.*
import fantasmas.*

object nivel1 {
	
	//la lista fantasmas es requerida para el poder de la superpastilla
	const fantasmas = [new FantasmaRojo(posicionInicial=game.at(8,9)), new FantasmaVerde(posicionInicial=game.at(8,10)), new FantasmaCeleste(posicionInicial=game.at(11,9)), new FantasmaAmarillo(posicionInicial=game.at(11,10))]
	method fantasmas()= fantasmas
	
	method cargar(){
		
		//Paredes
		const ancho = game.width() -1
		const largo = game.height() -1
		
		const posParedes = []
		(0 .. ancho).forEach{ n => posParedes.add(new Position(x=n, y=0)) } // bordeAbajo
		(0 .. ancho).forEach{ n => posParedes.add(new Position(x=n, y=largo)) } // bordeArriba 
		(0 .. 8).forEach{ n => posParedes.add(new Position(x=0, y=n)) } // bordeIzq
		(10 .. largo).forEach{ n => posParedes.add(new Position(x=0, y=n)) } // bordeIzq 
		(0 .. 8).forEach{ n => posParedes.add(new Position(x=19, y=n)) } // bordeDer
		(10 .. largo).forEach{ n => posParedes.add(new Position(x=19, y=n)) } // bordeDer
		
		posParedes.addAll([new Position(x=2,y=2), new Position(x=3,y=2),new Position(x=4,y=2), new Position(x=5,y=2),new Position(x=6,y=2),
		new Position(x=17,y=2), new Position(x=16,y=2), new Position (x=15,y=2), new Position(x=15,y=2), new Position(x=14,y=2), new Position(x=13,y=2),
		new Position(x=8,y=2), new Position(x=11,y=2),
		new Position(x=4,y=3), new Position(x=4,y=4),new Position(x=15,y=3), new Position(x=15,y=4),
		new Position(x=8,y=3), new Position(x=9,y=3),new Position(x=10,y=3), new Position(x=11,y=3),
		new Position(x=1,y=4), new Position(x=2,y=4),new Position(x=18,y=4), new Position(x=17,y=4),
		new Position(x=6,y=4), new Position(x=6,y=5),new Position(x=13,y=4), new Position(x=13,y=5),
		new Position(x=9,y=5), new Position(x=10,y=5),new Position(x=7,y=5), new Position(x=12,y=5),
		new Position(x=7,y=8), new Position(x=12,y=8),new Position(x=8,y=8), new Position(x=9,y=8), new Position(x=10,y=8), new Position(x=11,y=8),
		new Position(x=7,y=9), new Position(x=7,y=10), new Position(x=7,y=11),new Position(x=8,y=11),
		new Position(x=12,y=9), new Position(x=12,y=10), new Position(x=12,y=11),new Position(x=11,y=11),
		new Position(x=2,y=6), new Position(x=3,y=6), new Position(x=4,y=6),new Position(x=4,y=7),new Position(x=5,y=7),
		new Position(x=7,y=6), new Position(x=9,y=6), new Position(x=10,y=6),new Position(x=4,y=6),new Position(x=12,y=6),
		new Position(x=14,y=7), new Position(x=15,y=7), new Position(x=15,y=6),new Position(x=16,y=6),new Position(x=17,y=6),
		new Position(x=5,y=9), new Position(x=5,y=10), new Position(x=5,y=11),new Position(x=14,y=9),new Position(x=14,y=10),new Position(x=14,y=11),
		new Position(x=1,y=8), new Position(x=2,y=8), new Position(x=1,y=10),new Position(x=2,y=10),new Position(x=4,y=10),
		new Position(x=4,y=9), new Position(x=3,y=12), new Position(x=2,y=12),
		new Position(x=18,y=8), new Position(x=17,y=8), new Position(x=18,y=10),new Position(x=17,y=10),new Position(x=15,y=9),new Position(x=15,y=10),
		new Position(x=4,y=9), new Position(x=3,y=12), new Position(x=2,y=12),
		new Position(x=17,y=12), new Position(x=16,y=12),
		new Position(x=2,y=17), new Position(x=3,y=17), new Position(x=2,y=16),new Position(x=3,y=16),new Position(x=2,y=15),new Position(x=3,y=15),new Position(x=17,y=17),
		new Position(x=16,y=17),new Position(x=16,y=16),new Position(x=17,y=16),new Position(x=16,y=15),new Position(x=17,y=15),
		new Position(x=9,y=18), new Position(x=10,y=18), new Position(x=9,y=17),new Position(x=10,y=17),new Position(x=9,y=16),new Position(x=10,y=16),new Position(x=9,y=15),new Position(x=10,y=15),
		new Position(x=2,y=13), new Position(x=3,y=13), new Position(x=4,y=13),new Position(x=5,y=13),new Position(x=5,y=14),new Position(x=5,y=16),new Position(x=5,y=17),
		new Position(x=9,y=13), new Position(x=10,y=13), new Position(x=7,y=13),new Position(x=7,y=14),new Position(x=7,y=16),new Position(x=7,y=17),
		new Position(x=17,y=13), new Position(x=16,y=13), new Position(x=15,y=13),new Position(x=14,y=13),new Position(x=14,y=14),new Position(x=14,y=16),new Position(x=14,y=17),
		new Position(x=12,y=13), new Position(x=12,y=14), new Position(x=12,y=16),new Position(x=12,y=17)])
		
		posParedes.forEach { p => self.dibujar(new Pared(position = p)) }		
		
		//Comida
		
		const superPastillas = [new SuperPastilla(position=game.at(1,5)),new SuperPastilla(position=game.at(18,5)), new SuperPastilla(position=game.at(1,17)),new SuperPastilla(position=game.at(18,17))]
		superPastillas.forEach{p=>game.addVisual(p)}
		
		//Fantasmas
		fantasmas.forEach{f=>game.addVisual(f)}
		
		//Pacman
		
		game.addVisual(pacman)
		
		//Teclado
		controles.cargar()
		
		keyboard.r().onPressDo{ self.restart() }
		//keyboard.any().onPressDo{ self.comprobarSiGano(comida) }
		
		//Colisiones
		game.whenCollideDo(pacman, { e => pacman.comer(e) })
	}
	
	method restart() {
		game.clear()
		pacman.position(game.at(9,7))
		self.cargar()
	}
	
	method dibujar(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}
	
	method comprobarSiGano(comida) {
		if (comida.isEmpty()) {
			game.say(pacman, "GANASTE!") 
		}
	}
}