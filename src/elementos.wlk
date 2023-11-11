import wollok.game.*
import pacman.*

object panelInicio {
		var property position = game.at(0,4)
		method image()= "PacManInicio.jpg"
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
	var property position = game.at(21,11)
	var property image = "vidas" + pacman.vidas() + ".png"
	method iniciar(){game.addVisual(self)}
	method resetear(){image = "vidas3.png"}
}

object contador{
	var property text= "PUNTOS: " + pacman.puntos().toString()
	var property position=game.at(23,5)
	var property textColor= "#FFFFFF"
	method actualizarPuntos(){
		text= "PUNTOS: " + pacman.puntos().toString()
	}
	method resetear(){
		pacman.puntos(0)
		self.actualizarPuntos()
	}
}
