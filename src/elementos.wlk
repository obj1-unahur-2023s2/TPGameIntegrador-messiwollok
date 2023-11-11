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

object panelInicio inherits Visual(image= "PacManInicio.jpg"){
		override method ejecutar(){
			super()
			game.schedule(4000,{self.remover()})
		}
}

object menu inherits Visual(image = "fondo.jpeg"){
	const property ajustes = new Visual(image = "")
	
	override method ejecutar(){
		super()
		//soundPrincipal.play()
		keyboard.enter().onPressDo{
			nivel1.cargar()
		}
		keyboard.a().onPressDo({self.setting()})
	}
	method setting(){
		game.addVisual(ajustes)
		keyboard.backspace().onPressDo{game.removeVisual(ajustes)}
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

object gameOver inherits Visual(image = " "){
	override method ejecutar(){
		super()
		//soundPrincipal.stop()
		//soundGameOver.play()
		game.schedule(5000,{game.stop()})
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
