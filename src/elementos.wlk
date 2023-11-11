import wollok.game.*

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

object textoPuntos {
	
	var property position = game.at(21,13)
	
	method text() = "PUNTOS"
}

object sonido {
	
	method play(){
		game.sound("pacman-music.mp3").play()
	}
}