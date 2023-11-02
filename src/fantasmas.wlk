import wollok.game.*
import pacman.*
import pepita.*

class Fantasma{
	var property position 
	var nro 
	method image() = "fantasma" +  nro + ".png"
	method esFantasma() = true
}

class Obstaculo{
	method position() = game.center()
	method image() = "obstaculoAzul.png"
	method cambiarImagen()  = game.removeVisual(self)
	method esFantasma() = false
}

object juego{
	
	const personaje = pacman
	const obstaculo = new Obstaculo()
	method iniciar() {

		game.height(15)
		game.width(15)
		game.cellSize(50)
		game.title("Pacman")
		self.agregarVisuales()
		self.configurarTeclas()
		
		
	}
	method agregarVisuales() {
		game.addVisual(personaje)
		4.times({x=>self.agregarFantasma(x)})
		game.addVisual(obstaculo)
	
	}
	method agregarFantasma(valor) {
		game.addVisual( 
			new Fantasma( 
				position = game.at(valor,10)  ,
				nro = valor % 5 
			)
		) 
	}
	method configurarTeclas() {
		keyboard.up().onPressDo{ personaje.irArriba()}
		keyboard.down().onPressDo{ personaje.irAbajo()}
		keyboard.left().onPressDo{ personaje.irIzquierda()}
		keyboard.right().onPressDo{ personaje.irDerecha()}
		
		 
	}
	
	
}