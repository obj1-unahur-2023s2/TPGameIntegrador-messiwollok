import wollok.game.*
import pacman.*
import direcciones.*
import pared.*
import niveles.*
import elementos.*

class Fantasma{
	const posicionInicial //necesita una posicion inicial para saber donde revivir cuando es comido
	var property position = posicionInicial
	var puedeComerse = false //la condicion cambia cuando se asusta(pacman come la super pastilla)
	var property numero
	var skinPrevio = 0
	const direcciones = [abajo,izquierda, derecha, arriba]
	var direccion = arriba
	
	method image() = "fantasma" + numero.toString() + ".png"
	
	method serComido(){
		if (puedeComerse){ //si puede ser comido, desaparece y revive luego de un tiempo
			position = posicionInicial
			pacman.sumarPuntos(1000)
			contador.actualizarPuntos()
			game.removeVisual(self)
			numero = skinPrevio
			game.schedule(5000, {
				if(not game.hasVisual(self)){
					game.addVisual(self)
				}
			})
			
			} //el nro indica el tiempo que tarda en revivir
		else{ //si no puede ser comido, pacman muere al intentar comerlo, y resta 500 puntos
			pacman.morir()
			pacman.restarPuntos(500)
			contador.actualizarPuntos()
		}
	}
	method estaAsustado() = puedeComerse
	
	method resetear(){
		position = posicionInicial
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
	
	
	method iniciar(){
		game.onTick(500,"movimiento" ,{self.avanzar()
				game.schedule(3000, {self.direccionAzar()})
			})
	}
	
	method avanzar(){
		
		//da un paso hacia la direccion indicada en su variable
		if(direccion!=null)
			self.movete()	
		// hace que no salga del tablero	
		if(position.y()>=game.height()){position = game.at(position.x(), 0)}
		if(position.y()<0){position= game.at(position.x(), game.height()-1)}
		if(position.x()<0){position= game.at(game.width()-1, position.y())}
		if(position.x()>=game.width()){position= game.at(0, position.y())}
	}
	
	method direccionAzar(){
		direccion = direcciones.get(0.randomUpTo(3))
	}
	
	method moverAzar(){
		//obtiene una direccion al azar y valida si es posible moverse
		self.direccionAzar()
		self.validarLugarLibre()
	}
	
	method movete() {
		self.validarLugarLibre()
		const posAlLado = direccion.siguiente(position) 
		const pos = game.getObjectsIn(posAlLado)
			.all{ obj => obj.puedePisarte(self) } 
		
		if(not pos){
			self.direccionAzar()
			
		}
		else{
			 position = direccion.siguiente(position)
			 
		}
	}

	method validarLugarLibre() {
		const posAlLado = direccion.siguiente(position) 
		const lugarLibre = game.getObjectsIn(posAlLado)
			.all{ obj => obj.puedePisarte(self) } 
		
		if (!lugarLibre) 
			self.moverAzar()
	}
	
	method puedePisarte(_) = true

	
}

object grupoFantasma {
	const fantasma2 =new Fantasma(posicionInicial=game.at(9,10), numero = 2)
	const fantasma4 =new Fantasma(posicionInicial=game.at(10,10), numero = 4)
	const fantasma1 =new Fantasma(posicionInicial=game.at(11,10), numero = 1)
	const fantasma3 =new Fantasma(posicionInicial=game.at(8,10), numero = 3)
	
	const fantasmas = [fantasma1,fantasma2,fantasma3,fantasma4]
	
	method introducir(){
		fantasmas.forEach( {rival => 
			game.addVisual(rival)
			game.whenCollideDo(rival, { personaje =>
				if(personaje.equals(pacman)and not(rival.estaAsustado())){personaje.morir()} // se maneja un método polimórfico
			
			
			})
			
			})
	}
	
	method moverGrupo(){
		fantasmas.forEach( {rival => rival.iniciar()})
			
	}
	
	method asustarGrupo(){
		fantasmas.forEach{x=>x.asustarse()}
	}
	
	method reseteo(){
		fantasmas.forEach{x=>x.resetear()}
	}
	
}


