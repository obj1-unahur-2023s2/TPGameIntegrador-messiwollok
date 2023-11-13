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
			if(self.equals(nivel1)){
				comida1.cargar()
				pacman.iniciar()
				paredes1.cargar()
				keyboard.k().onPressDo({comida1.sacar()})
			}
			if(self.equals(nivel2)){
				comida2.cargar()
				pacman.iniciar()
				paredes2.cargar()
				keyboard.o().onPressDo({comida2.sacar()})
			}
			game.addVisual(logo1)
			game.addVisual(logo2)
			game.addVisual(logoOpciones)
			grupoFantasma.introducir()
			grupoFantasma.moverGrupo()
			
		
	}
	method pasarNivel(){
		grupoVidas.resetear()
		contador.resetear()
		grupoFantasma.reseteo()
		pantallaSiguiente.ejecutar()
	}
}

const nivel1 = new Nivel(image="fondo.png",  pantallaSiguiente = siguienteNivel)
const nivel2 = new Nivel(image="fondo.png",  pantallaSiguiente = victoria)


