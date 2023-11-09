import wollok.game.*
import direcciones.*
import fantasmas.*
import niveles.*

object pacman {
	var property position = game.at(9,7)
	var property direccion = null
	var puntos = 0
	var vidas = 3
	
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
	method restarPuntos(cant){puntos-=cant}
	
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
		vidas --
		//vuelve a su posicion inicial
		position = game.at(9,7)
		//si se queda sin vidas finaliza el juego
		if (vidas <= 0)
			game.stop()
	}
	
	method image() = "pacman.png"
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
		nivel1.fantasmas().forEach{x=>x.asustarse()}
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