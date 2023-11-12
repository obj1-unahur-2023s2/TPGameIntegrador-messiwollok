import wollok.game.*
import comida.*
import pared.*
import pacman.*
import comida.*
import fantasmas.*
import elementos.*

class Nivel{
	var property image
	var property siguiente
	var property pantallaSiguiente
	
	
	method iniciar(){
		keyboard.p().onPressDo{menu.juegoPausa()}
		game.addVisualIn(self, game.at(0,0))
		pacman.iniciar()
		pacman.nivelActual(self)
		grupoVidas.iniciar()
		game.width(20)
		game.height(20)
		if(self.equals(nivel1)){
			paredes1.cargar()
		}
		game.addVisual(logoOpciones)
		game.addVisual(logo1)
		game.addVisual(logo2)
		grupoFantasma.introducir()
		comida1.cargar()
	}
	method pasarNivel(){
		grupoVidas.resetear()
		contador.resetear()
		pantallaSiguiente.ejecutar()
	}
}

const nivel1 = new Nivel(image="fondo.png", siguiente=nivel2, pantallaSiguiente = siguienteNivel)
const nivel2 = new Nivel(image="fondo.png", siguiente=victoria, pantallaSiguiente = victoria)


