import wollok.game.*
import pacman.*

class Fantasma{
	var posicionInicial //necesita una posicion inicial para saber donde revivir cuando es comido
	var property position = posicionInicial
	var puedeComerse = false //la condicion cambia cuando se asusta(pacman come la super pastilla)
	 
	method image()
	
	method serComido(){
		if (puedeComerse){ //si puede ser comido, desaparece y revive luego de un tiempo
			game.removeVisual(self)
			game.schedule(5000, {game.addVisualIn(self, posicionInicial)})} //el nro indica el tiempo que tarda en revivir
		else{ //si no puede ser comido, pacman muere al intentar comerlo, y resta 500 puntos
			pacman.morir()
			pacman.restarPuntos(500)
		}
	}
	
	method asustarse(){ //se activa cuando pacman come la super pastilla
		puedeComerse = true //habilita que pacman pueda comerlo
		//aca deberia ir el cambio de visual a la de fantasma azul
		game.schedule(10000, { //deshabilita que pacman pueda comerlo, tras 10 seg
			puedeComerse = false
			//aca deberia ir el cambio de visual a la original
		})
	}
}

class FantasmaRojo inherits Fantasma {
	override method image()="fantasma1.png"
}

class FantasmaVerde inherits Fantasma {
	override method image()="fantasma2.png"
}

class FantasmaCeleste inherits Fantasma {
	override method image()="fantasma3.png"
}

class FantasmaAmarillo inherits Fantasma {
	override method image()="fantasma4.png"
}