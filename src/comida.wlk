import wollok.game.*
import pacman.*
import elementos.*

class Comida {
	const property position
	method serComido(){
		game.removeVisual(self)
		pacman.sumarPuntos(100)
		contador.actualizarPuntos()
	} 
	method image() = "comida.png"
	method puedePisarte(obj) = true
}

class SuperPastilla inherits Comida{
	override method image()= "poder.png"
	override method serComido(){
		super()
		poderes.superPastilla()
		pacman.sumarPuntos(300)
		contador.actualizarPuntos()
	}
}

class SuperVelocidad inherits Comida{
	override method image() = "comida.png" //deje la misma imagen del otro poder pero podria cambiarse 
	override method serComido(){
		super()
		poderes.superVelocidad()
		pacman.sumarPuntos(200)
		contador.actualizarPuntos()
	}	
}
