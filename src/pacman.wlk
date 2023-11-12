import wollok.game.*
import direcciones.*
import fantasmas.*
import niveles.*
import elementos.*

object pacman {
	
	var property position = game.at(0,9)
	const property posicion = position
	var property direccion = null
	var property puntos = 0
	var property vidas = 3
	var property nivelActual = 0
	method image() = "pacman.png"
	method puedePisarte(obj) = true
	
	method iniciar(){
		game.addVisual(self)
		controles.cargar()
		self.mostrarContador()
		game.whenCollideDo(self,{e => self.comer(e)})
	}
	
	method comer(unElemento){
		//requiere que todos los elementos que no sean paredes tengan el metodo "serComido"
		try
			unElemento.serComido()
		catch e{
			self.retroceder()
			self.direccion(null)
		}
	}
	
	method sumarPuntos(cant){puntos += cant}
	method restarPuntos(cant){puntos = 0.max(puntos - cant)}
	
	method retroceder(){
		position = direccion.opuesto().siguiente(position)
	}
	
	method avanzar(){
		//da un paso hacia la direccion indicada en su variable
		if(direccion!=null)
			position = direccion.siguiente(position)
		//si pasa por algun borde del mapa, aparece en el borde opuesto
		if(position.y()>=game.height()){position = game.at(position.x(), 0)}
		if(position.y()<0){position= game.at(position.x(), game.height()-1)}
		if(position.x()<0){position= game.at(game.width()-1, position.y())}
		if(position.x()>=game.width()){position= game.at(0, position.y())}		
	}
	
	
	
	method morir(){
		//pierde una vida
		vidas -= 1.max(0)
		grupoVidas.image("vidas" + vidas + ".png")
		//vuelve a su posicion inicial
		position = posicion
		//si se queda sin vidas finaliza el juego
		if(vidas == 0) { 
			game.removeVisual(grupoVidas)
			self.perderJuego()
		}
	}
	method perderJuego() {	
		game.removeVisual(self)
		gameOver.ejecutar()
	}
	method pasarNivel(){
		nivelActual.pasarNivel()
	    nivelActual = nivelActual.siguiente()
		vidas = 3		
	}
	
	
	method mostrarContador(){game.addVisual(contador)}
}

object controles{
	method cargar(){
		keyboard.w().onPressDo{pacman.direccion(arriba)}
		keyboard.a().onPressDo{pacman.direccion(izquierda)}
		keyboard.s().onPressDo{pacman.direccion(abajo)}
		keyboard.d().onPressDo{pacman.direccion(derecha)}
		game.onTick(500, "moverPacman", {pacman.avanzar()}) //movimiento automatico, el nro indica los milisegundos entre cada paso
	}
}

object poderes{
	method superPastilla(){
		grupoFantasma.asustarGrupo()
		
	}
	
	method superVelocidad(){
		
		game.removeTickEvent("moverPacman") //cancela el movimiento inicial
		game.onTick(250, "velocidad", {pacman.avanzar()}) //inicia el poder, el nro indica los milisegundos entre cada paso
		game.schedule(5000, { //el nro indica la duracion del poder en milisegundos
			game.removeTickEvent("velocidad") //finaliza el poder
			game.onTick(500, "moverPacman", {pacman.avanzar()}) //vuelve a iniciar el movimiento normal
		})
		
	}
}
