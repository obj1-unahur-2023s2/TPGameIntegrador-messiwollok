import wollok.game.*
import pacman.*
import elementos.*
import niveles.*


object juego {
	method iniciarJuego(){
		self.config()
		game.start()
	}
	method config(){
		
		self.configVentana()
		menu.ejecutar()

	}
	method configVentana(){
		game.title("Pacman")	
		
	}
	
}
