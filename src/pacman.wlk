import wollok.game.*
import direcciones.*

object pacman {
	var property position = game.at(2,3)
	var direccion = arriba
	
	method comer(unElemento){
		try
			unElemento.sumarPunto()
		catch e{
			console.println(e)
			self.retroceder()
		}
	}
	method retroceder(){
		position = direccion.opuesto().siguiente(position)
	}
	
	method irArriba(){
		direccion = arriba
		self.avanzar()
	}
	
	method irAbajo() {
		direccion = abajo
		self.avanzar()
	}

	method irIzquierda() {
		direccion = izquierda
		self.avanzar()
	}

	method irDerecha() {
		direccion = derecha
		self.avanzar()
	}
	
	method avanzar(){
		position = direccion.siguiente(position)
	}
	
	method setDireccion(unaDireccion) {
		direccion = unaDireccion
	}
	
	method image() = "pacman.png"
	
}
