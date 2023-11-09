import wollok.game.*
import pacman.*

class Comida {
	const property position
	method serComido(){
		game.removeVisual(self)
		pacman.sumarPuntos(100)
	} 
	method image() = "comida.png"
}

class SuperPastilla inherits Comida{
	override method image()= "poder.png"
	override method serComido(){
		super()
		poderes.superPastilla()
	}
}

class SuperVelocidad inherits Comida{
	override method image() = "poder.png" //deje la misma imagen del otro poder pero podria cambiarse 
	override method serComido(){
		super()
		poderes.superVelocidad()
	}	
}
