import wollok.game.*
import pacman.*
import direcciones.*
import pared.*

class Fantasma{
	var posicionInicial //necesita una posicion inicial para saber donde revivir cuando es comido
	var property position = posicionInicial
	var puedeComerse = false //la condicion cambia cuando se asusta(pacman come la super pastilla)
	var property numero
	var skinPrevio = 0
	const direcciones = [arriba, abajo, izquierda, derecha]
	var direccion = arriba 
	method image() = "fantasma" + numero.toString() + ".png"
	
	method serComido(){
		if (puedeComerse){ //si puede ser comido, desaparece y revive luego de un tiempo
			position = posicionInicial
			pacman.sumarPuntos(1000)
			contador.actualizarPuntos()
			game.removeVisual(self)
			numero = skinPrevio
			game.schedule(5000, {game.addVisual(self)})
			
			} //el nro indica el tiempo que tarda en revivir
		else{ //si no puede ser comido, pacman muere al intentar comerlo, y resta 500 puntos
			pacman.morir()
			pacman.restarPuntos(500)
			contador.actualizarPuntos()
		}
	}
	method asustarse(){ //se activa cuando pacman come la super pastilla
		puedeComerse = true
		
		//aca deberia ir el cambio de visual a la de fantasma azul
		
		skinPrevio = numero
		game.removeVisual(self)
		numero = 5
		game.addVisual(self)
		
		game.schedule(10000, { //deshabilita que pacman pueda comerlo, tras 10 seg
			puedeComerse = false
			//aca deberia ir el cambio de visual a la original
			if(game.hasVisual(self)){
				game.removeVisual(self)
			}
			numero = skinPrevio
			game.addVisual(self)
			
		})
	}
	
	

	method avanzar(){
		//da un paso hacia la direccion indicada en su variable
		if(direccion!=null)
			self.movete()	
	}
	method moverAzar(){
		
		
		direccion = direcciones.get(0.randomUpTo(3))
		self.validarLugarLibre()
	}
	method movete() {
		self.validarLugarLibre() 
		position = direccion.siguiente(position)
	}

	method validarLugarLibre() {
		const posAlLado = direccion.siguiente(position) 
		const lugarLibre = game.getObjectsIn(posAlLado)
			.all{ obj => obj.puedePisarte(self) } 
		
		if (!lugarLibre) 
			self.moverAzar()
	}
	
	method puedePisarte(_) = false



	
}
