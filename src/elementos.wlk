import wollok.game.*
import pacman.*
import niveles.*
import fantasmas.*

class Visual{
	var property position = game.at(0,0)
	var property image
	method ejecutar(){
		game.addVisual(self)
	}
	method remover(){game.removeVisual(self)}
}

object menu inherits Visual(image = "PacManInicio.jpg"){
	override method ejecutar(){
		super()
		keyboard.enter().onPressDo{
			reseteoJuego.reset()
			nivel1.iniciar()
			soundPrincipal.play()
		}
		game.width(26)
		game.height(20)
		keyboard.f().onPressDo({self.instruccionesInicio()})
		keyboard.q().onPressDo{game.stop()} 		
	}
	
	method instruccionesInicio(){
		
		game.addVisual(instruccionesMenu)
		keyboard.b().onPressDo{
			if(game.hasVisual(instruccionesMenu)){
        		game.removeVisual(instruccionesMenu)
        	}
			if(game.hasVisual(instruccionesMenuDos)){
        		game.removeVisual(instruccionesMenuDos)
        	}
		}
		keyboard.c().onPressDo{
			if(game.hasVisual(instruccionesMenu)){
        		game.removeVisual(instruccionesMenu)
        	}
			game.addVisual(instruccionesMenuDos)
		}
	}
	method instruccionesEnJuego(){
		game.removeVisual(visualPausa)
		game.addVisual(instruccionesJuego)
		keyboard.b().onPressDo{game.removeVisual(instruccionesJuego)}
		keyboard.p().onPressDo({
			game.removeVisual(instruccionesJuego)
			self.juegoPausa()
		})
	}
	
	method juegoPausa(){
		game.addVisual(visualPausa)
		keyboard.v().onPressDo{game.removeVisual(visualPausa)}
		keyboard.f().onPressDo({self.instruccionesEnJuego()})
		keyboard.q().onPressDo({
			reseteoJuego.reset()
			self.ejecutar() 
		})
	}
	
	method volverAlMenu(){
		game.clear()
		self.ejecutar()
	}
}

object victoria inherits Visual(image = "ganaste.jpg"){
	override method ejecutar(){
		game.clear()
		super()
		//soundPrincipal.stop()
		//soundVictoria.play()
		keyboard.m().onPressDo{self.siguientePartida()}
	}
	method siguientePartida(){
		reseteoJuego.reset()
		menu.ejecutar()
	}

}

object gameOver inherits Visual(image = "gameover2.jpg"){
	override method ejecutar(){
		//soundPrincipal.stop()
		//soundGameOver.play()
		game.clear()
		super()
		keyboard.m().onPressDo({
			reseteoJuego.reset()
			pacman.resetear()
			grupoVidas.resetear()
			menu.ejecutar() 
		})
	}
}

object siguienteNivel inherits Visual(image="visualEntreNivel.jpg"){
	
	override method ejecutar(){
		game.clear()
		super()
		keyboard.enter().onPressDo{
			game.clear()
			pacman.pasarNivel()
		}
	}
}

object logo1{
	var property position = game.at(20,17)
		method image()= "pacmanlogo.jpg"
}

object logo2{
	var property position = game.at(21,13)
		method image()= "pacmanlogo2.jpg"
}

object soundPrincipal {
	
	method play(){
		game.sound("pacman-music.mp3").play()	
	}
}
object grupoVidas{
	var property position = game.at(22,7)
	var property image = "vidas" + pacman.vidas().toString() + ".png"
	method iniciar(){game.addVisual(self)}
	method resetear(){
		image = "vidas3.png"
	}
}

object contador{
	var property text= "PUNTOS: " + pacman.puntos().toString()
	var property position=game.at(22,3)
	var property textColor= "#FFFFFF"
	method actualizarPuntos(){
		text= "PUNTOS: " + pacman.puntos().toString()
	}
	method resetear(){
		pacman.puntos(0)
		self.actualizarPuntos()
	}
}

object logoOpciones {
	var property position = game.at(20,11)
		method image()= "logoOpciones.jpg"
}

object visualPausa {
	var property position = game.at(4,5)
	method image() = "visualPausa.jpg"
}

object instruccionesMenuDos {
    var property position = game.at(8,3)
    method image() = "instruccionesMenuDos.jpg"
}

object instruccionesJuego{
	var property position = game.at(4,4)
	method image() = "instruccionesJuego.jpg"
}

object instruccionesMenu {
	var property position = game.at(8,3)
	method image() = "instruccionesMenu.jpg"
}
object reseteoJuego{
	method reset(){
		game.clear()
		pacman.resetear()
		grupoFantasma.reseteo()
	}
}
