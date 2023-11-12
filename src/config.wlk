import wollok.game.*
import pacman.*
import elementos.*
import niveles.*
import visuales.*

object juego {
	method iniciarJuego(){
		self.config()
		game.start()
	}
	method config(){
		
		self.configVentana()
		menu.ejecutar()
		inicio.ejecutar()
	}
	method configVentana(){
		game.title("Pacman")	
		
	}
	
}
