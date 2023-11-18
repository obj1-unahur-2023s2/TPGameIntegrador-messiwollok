import wollok.game.*
import direcciones.*
import fantasmas.*
import niveles.*
import elementos.*

object pacman {
	
	var property position = game.at(0,9)
	var property direccion = null
	var property puntos = 0
	var property vidas = 3
	var property nivelActual = nivel1
	method image() = "pacman.png"
	method puedePisarte(obj) = true
	
	method iniciar(){
		game.addVisual(self)
		controles.cargar()
		self.mostrarContador()
		game.whenCollideDo(self,{e => self.comer(e)})
		self.movilizar()
	}	
	method sumarPuntos(cant){puntos += cant}
	method restarPuntos(cant){puntos = 0.max(puntos - cant)}
	
	method comer(unElemento){
		try
			unElemento.serComido(nivelActual)
		catch e{
			self.retroceder()
			self.direccion(null)
		}
	}
	method resetear(){
		contador.resetear()
		position =game.at(0,9)
		vidas = 3
		nivelActual = nivel1
	}
	method retroceder(){
		position = direccion.opuesto().siguiente(position)
	}
	method avanzar(){
		if(direccion!=null)
			position = direccion.siguiente(position)
		self.limitarAlTablero()
	}
	method limitarAlTablero(){
		if(position.y()>=game.height()){position = game.at(position.x(), 0)}
		if(position.y()<0){position= game.at(position.x(), game.height()-1)}
		if(position.x()<0){position= game.at(game.width()-1, position.y())}
		if(position.x()>=game.width()){position= game.at(0, position.y())}
	}
	method volverInicio(){
		game.removeVisual(self)
		position = game.at(0,9)
		game.addVisual(self)
	}
	method morir(){
		vidas -= 1.max(0)
		grupoVidas.image("vidas" + vidas.toString() + ".png")
		self.volverInicio()
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
		position = game.at(0,9)
		nivelActual = nivel2
	    nivel2.iniciar()
		vidas = 3		
	}
	method movilizar(){
		game.onTick(500, "moverPacman", {self.avanzar()})
	}
	method mostrarContador(){game.addVisual(contador)}
}

object controles{
	method cargar(){
		keyboard.w().onPressDo{pacman.direccion(arriba)}
		keyboard.a().onPressDo{pacman.direccion(izquierda)}
		keyboard.s().onPressDo{pacman.direccion(abajo)}
		keyboard.d().onPressDo{pacman.direccion(derecha)}
	}
}

object poderes{
	var velocidad = 800
	method superPastilla(){
		grupoFantasma.asustarGrupo()
	}
	method menorVelocidad(){
		 game.removeTickEvent("moverPacman")
        velocidad += 150
		game.onTick(velocidad, "moverPacman", { pacman.avanzar() }) 
        game.schedule(8000, { 
            game.removeTickEvent("moverPacman")
            pacman.movilizar()
        })
	}
}


