import wollok.game.*
import pacman.*
import niveles.*

class Visual{
	var property position = game.at(0,0)
	var property image
	method ejecutar(){
		game.addVisual(self)
	}
	method remover(){game.removeVisual(self)}
}

object inicio inherits Visual(image= "PacManInicio.jpg",position= game.at(0,3)){
		override method ejecutar(){
			
			super()
		}
}

object menu inherits Visual(image = "fondo.png"){
	const property ajustes = new Visual(image = "")
	
	override method ejecutar(){
		super()
	
		//soundPrincipal.play()
		keyboard.enter().onPressDo{
			game.clear()
			nivel1.iniciar()
		}
		game.width(26)
		game.height(20)
		keyboard.f().onPressDo({self.instruccionesIninio()})
		keyboard.q().onPressDo{game.stop()} 
	}
	
	method instruccionesIninio(){
		
		game.addVisual(instruccionesMenu)
		keyboard.b().onPressDo{game.removeVisual(instruccionesMenu)}
	}
	method instruccionesEnJuego(){
		game.removeVisual(visualPausa)
		game.addVisual(instruccionesJuego)
		keyboard.b().onPressDo{game.removeVisual(instruccionesJuego)}
		keyboard.p().onPressDo({self.juegoPausa()})
	}
	
	method juegoPausa(){
		game.addVisual(visualPausa)
		keyboard.v().onPressDo{game.removeVisual(visualPausa)}
		keyboard.f().onPressDo({self.instruccionesEnJuego()})
		keyboard.q().onPressDo({
			game.clear()
			self.ejecutar() 
			inicio.ejecutar()
		})
	}
	
	method volverAlMenu(){
		game.clear()
		inicio.ejecutar()
		
	}
}

object victoria inherits Visual(image = "victoria.png"){
	override method ejecutar(){
		super()
		//soundPrincipal.stop()
		//soundVictoria.play()
		keyboard.r().onPressDo{self.siguientePartida()}
	}
	method siguientePartida(){}
}

object gameOver inherits Visual(image = "fondo.png "){
	override method ejecutar(){
		super()
		//soundPrincipal.stop()
		//soundGameOver.play()
		
		game.schedule(500,{
			game.addVisual(terminado)
		})
	}
}

object siguienteNivel inherits Visual(image="sigNivel.png"){
	override method ejecutar(){
		super()
		keyboard.enter().onPressDo{
			game.clear()
			pacman.nivelActual().iniciar()
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

object sonido {
	
	method play(){
		game.sound("pacman-music.mp3").play()	
	}
}

object grupoVidas{
	var property position = game.at(22,10)
	var property image = "vidas" + pacman.vidas() + ".png"
	method iniciar(){game.addVisual(self)}
	method resetear(){image = "vidas3.png"}
}

object contador{
	var property text= "PUNTOS: " + pacman.puntos().toString()
	var property position=game.at(22,5)
	var property textColor= "#FFFFFF"
	method actualizarPuntos(){
		text= "PUNTOS: " + pacman.puntos().toString()
	}
	method resetear(){
		pacman.puntos(0)
		self.actualizarPuntos()
	}
}

object mostrarPuntos{
	
	var property text= "PUNTOS: " + pacman.puntos().toString()
	var property position= game.at(13,10)
	var property textColor= "#FFFFFF"
	
}

object terminado {
	method position() = game.at(5,4)
	method image() = "gameover.jpg"
}

object logoOpciones {
	var property position = game.at(20,11)
		method image()= "logoOpciones.jpg"
}

object visualPausa {
	var property position = game.at(4,5)
	method image() = "visualPausa.jpg"
}

object instruccionesJuego{
	var property position = game.at(4,4)
	method image() = "instruccionesJuego.jpg"
}

object instruccionesMenu {
	var property position = game.at(8,3)
	method image() = "instruccionesMenu.jpg"
}
