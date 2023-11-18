import wollok.game.*
import comida.*
import pared.*
import pacman.*
import comida.*
import fantasmas.*
import elementos.*

class Nivel{
	var property image
	var property pantallaSiguiente
	
	
	method iniciar(){
			keyboard.p().onPressDo({menu.juegoPausa()})
			game.addVisualIn(self, game.at(0,0))
			grupoVidas.iniciar()
			game.width(20)
			game.height(20)
			game.addVisual(logo1)
			game.addVisual(logo2)
			game.addVisual(logoOpciones)
			
	}
	method pasarNivel(){
		grupoVidas.resetear()
		grupoFantasma.reseteo()
		pantallaSiguiente.ejecutar()
	}
}


object nivel1 inherits Nivel(image="fondo.png", pantallaSiguiente = siguienteNivel){
	override method iniciar(){
		super()
		comida1.cargar()
		pacman.iniciar()
		paredes1.cargar()
		keyboard.k().onPressDo({comida1.sacar()})
		grupoFantasma.introducir()
	}
	method eliminarComida(comida){
		comida1.eliminar(comida)
	}
}

object nivel2 inherits Nivel(image="fondo.png", pantallaSiguiente = victoria){
	override method iniciar(){
		super()
		comida2.cargar()
		pacman.iniciar()
		paredes2.cargar()
		keyboard.o().onPressDo({comida2.sacar()})
		grupoFantasma.introducir()
	}
	method eliminarComida(comida){
		comida2.eliminar(comida)
	}
}


