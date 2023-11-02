import comida.*
import pared.*
import pacman.*
import comida.*
import wollok.game.*

object nivel1 {
	
	method cargar(){
		
		//Paredes
		const ancho = game.width() -1
		const largo = game.height() -1
		
		var posParedes = []
		(0 .. ancho).forEach{ n => posParedes.add(new Position(x=n, y=0)) } // bordeAbajo
		(0 .. ancho).forEach{ n => posParedes.add(new Position(x=n, y=largo)) } // bordeArriba 
		(0 .. largo).forEach{ n => posParedes.add(new Position(x=0, y=n)) } // bordeIzq 
		(0 .. largo).forEach{ n => posParedes.add(new Position(x=ancho, y=n)) } // bordeDer
		
		posParedes.addAll([new Position(x=1,y=4), new Position(x=13,y=8),new Position(x=13,y=11), new Position(x=1,y=12),new Position(x=2,y=12)])
		posParedes.addAll([new Position(x=2,y=2), new Position(x=3,y=2),new Position(x=4,y=2), new Position(x=5,y=2)])
		posParedes.addAll([new Position(x=3,y=4), new Position(x=4,y=4), new Position(x=5,y=4)])
		posParedes.addAll([new Position(x=2,y=8), new Position(x=2,y=9),new Position(x=2,y=10), new Position(x=2,y=11)])
		
		
		posParedes.forEach { p => self.dibujar(new Pared(position = p)) }	
		
		//Comida
		const comidas = [new Position(x=1, y=11), new Position(x=1, y=10),new Position(x=1, y=9), new Position(x=1, y=8)]
			.map{ p => self.dibujar(new Comida(position = p)) }
		
		//Fantasmas
		
		
		
		//Pacman
		
		game.addVisual(pacman)
		
		//Teclado
		keyboard.up().onPressDo{ pacman.irArriba()}
		keyboard.down().onPressDo{ pacman.irAbajo()}
		keyboard.left().onPressDo{ pacman.irIzquierda()}
		keyboard.right().onPressDo{ pacman.irDerecha()}
		
		keyboard.r().onPressDo{ self.restart() }
		//keyboard.any().onPressDo{ self.comprobarSiGano(comida) }
		
		//Colisiones
		game.whenCollideDo(pacman, { e => pacman.comer(e) })
		
	}
	
	method restart() {
		game.clear()
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
