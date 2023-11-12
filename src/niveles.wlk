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
		game.addVisualIn(self, game.at(0,0))
		pacman.iniciar()
		pacman.nivelActual(self)
		grupoVidas.iniciar()
		game.width(20)
		game.height(20)
		if(self.equals(nivel1)){
			paredes1.cargar()
		}
		game.addVisual(logo1)
		game.addVisual(logo2)
		grupoFantasmas.introducir()
		//const pastillasPoderes = [new SuperPastilla(position=game.at(1,6)), new SuperVelocidad(position=game.at(18,6)), new PastillaDeHielo(position=game.at(18,18))]
		//pastillasPoderes.forEach{c=>game.addVisual(c)}
	}
	method pasarNivel(){
		grupoVidas.resetear()
		contador.resetear()
		pantallaSiguiente.ejecutar()
	}
}

const nivel1 = new Nivel(image="fondo.png", siguiente=nivel2, pantallaSiguiente = siguienteNivel)
const nivel2 = new Nivel(image="fondo.png", siguiente=victoria, pantallaSiguiente = victoria)

