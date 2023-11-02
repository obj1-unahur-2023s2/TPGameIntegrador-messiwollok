import wollok.game.*

class Comida {
	const property position
	method sumarPunto() = game.removeVisual(self)
	method movete(direccion) {}
	method puedePisarte(_) = true
	method image() = "comida.png"
	
}

class Especial inherits Comida{
	override method image() = "poder.png"
}