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
	var  bocaAbierta = true
	method image() = 
        if (bocaAbierta) {
            "pacman_abierto.png"
        } else {
            "pacman_cerrado.png"
        }
    
     method alternarBoca() {
        bocaAbierta = !bocaAbierta
    }
    
    method abrirYCerrarBoca() {
        game.onTick(500, "alternarBoca", { self.alternarBoca() })
    }
    
	method puedePisarte(obj) = true
	
	method iniciar(){
		game.addVisual(self)
		controles.cargar()
		self.mostrarContador()
		game.whenCollideDo(self,{e => self.comer(e)})
		self.movilizar()
		self.abrirYCerrarBoca()
	}	
	method sumarPuntos(cant){puntos += cant}
	method restarPuntos(cant){puntos = 0.max(puntos - cant)}
	
	method comer(unElemento){
		game.sound("pacman-comer.mp3").play()

		try
			unElemento.serComido(nivelActual)
		catch e{
			self.frenar()
		}
	}
	method resetear(){
		contador.resetear()
		position =game.at(0,9)
		vidas = 3
		nivelActual = nivel1
	}
	method frenar(){
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
		position = game.at(0,9)
	}
	method morir(){
		vidas -= 1.max(0)
		grupoVidas.image("vidas" + vidas.toString() + ".png")
		self.volverInicio()
		if(vidas == 0) {
			game.sound("pacman-muerte.mp3").play()
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
		game.sound("pacman-poder.mp3").play()

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


