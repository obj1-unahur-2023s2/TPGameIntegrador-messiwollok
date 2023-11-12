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


method tablero2(){
		const ancho = game.width() -1
		const largo = game.height() -1
		
		var posParedes = []
		var posParedesfantasma = []
		(0 .. ancho).forEach{ n => posParedes.add(new Position(x=n, y=0)) } // bordeAbajo
		(0 .. ancho).forEach{ n => posParedes.add(new Position(x=n, y=largo)) } // bordeArriba 
		(0 .. 8).forEach{ n => posParedes.add(new Position(x=0, y=n)) } // bordeIzq 
		(10 .. 20).forEach{ n => posParedes.add(new Position(x=0, y=n)) } // bordeIzq 
		(0 .. 8).forEach{ n => posParedes.add(new Position(x=19, y=n)) } // bordeDer
		(10 .. 20).forEach{ n => posParedes.add(new Position(x=19, y=n)) } // bordeDer
		
		posParedes.addAll([new Position(x=2,y=2), new Position(x=3,y=2),new Position(x=4,y=2), new Position(x=5,y=2),new Position(x=6,y=2),
		new Position(x=17,y=2), new Position(x=16,y=2), new Position (x=15,y=2), new Position(x=15,y=2), new Position(x=14,y=2), new Position(x=13,y=2),
		new Position(x=8,y=2), new Position(x=11,y=2),new Position(x=1,y=8),new Position(x=2,y=8), new Position(x=1,y=10),new Position(x=2,y=10),
		new Position(x=18,y=8),new Position(x=17,y=8),new Position(x=18,y=10),new Position(x=17,y=10),new Position(x=7,y=8), new Position(x=12,y=8),new Position(x=8,y=8), new Position(x=9,y=8), new Position(x=10,y=8), new Position(x=11,y=8),
		new Position(x=7,y=9), new Position(x=7,y=10), new Position(x=7,y=11),new Position(x=8,y=11),
		new Position(x=12,y=9), new Position(x=12,y=10), new Position(x=12,y=11),new Position(x=11,y=11),
		new Position(x=2,y=4), new Position(x=2,y=5),new Position(x=2,y=6),new Position(x=17,y=4), new Position(x=17,y=5),new Position(x=17,y=6),
		new Position(x=2,y=17), new Position(x=3,y=17),new Position(x=4,y=17), new Position(x=5,y=17),new Position(x=6,y=17),
		new Position(x=17,y=17), new Position(x=16,y=17), new Position (x=15,y=17), new Position(x=15,y=17), new Position(x=14,y=17), new Position(x=13,y=17),
		new Position(x=2,y=15),new Position(x=2,y=14),new Position(x=2,y=13),new Position(x=2,y=12),
		new Position(x=17,y=15),new Position(x=17,y=14),new Position(x=17,y=13),new Position(x=17,y=12),
		new Position(x=6,y=4),new Position(x=7,y=4),new Position(x=8,y=4),new Position(x=9,y=4),
		new Position(x=10,y=4),new Position(x=11,y=4),new Position(x=12,y=4),new Position(x=13,y=4),
		new Position(x=8,y=3),new Position(x=9,y=3),new Position(x=10,y=3),new Position(x=11,y=3),
		new Position(x=4,y=4),new Position(x=4,y=5),new Position(x=4,y=6),
		new Position(x=5,y=6),new Position(x=6,y=6),new Position(x=7,y=6),
		new Position(x=15,y=4),new Position(x=15,y=5),new Position(x=15,y=6),
		new Position(x=14,y=6),new Position(x=13,y=6),new Position(x=12,y=6),
		new Position(x=9,y=6),new Position(x=10,y=6),
		new Position(x=4,y=11),new Position(x=5,y=11),
		new Position(x=15,y=11),new Position(x=14,y=11),
		new Position(x=4,y=9),new Position(x=5,y=9),
		new Position(x=4,y=8),new Position(x=5,y=8),
		new Position(x=15,y=9),new Position(x=14,y=9),
		new Position(x=15,y=8),new Position(x=14,y=8),
		new Position(x=8,y=13),new Position(x=9,y=13),new Position(x=10,y=13),new Position(x=11,y=13),
		new Position(x=8,y=14),new Position(x=9,y=14),new Position(x=10,y=14),new Position(x=11,y=14),
		new Position(x=8,y=17),new Position(x=11,y=17),
		new Position(x=8,y=16),new Position(x=11,y=16),
		new Position(x=9,y=16),new Position(x=10,y=16),
		new Position(x=4,y=15),new Position(x=5,y=15),new Position(x=6,y=15),
		new Position(x=4,y=13),new Position(x=5,y=13),new Position(x=6,y=13),
		new Position(x=15,y=15),new Position(x=14,y=15),new Position(x=13,y=15),
		new Position(x=15,y=13),new Position(x=14,y=13),new Position(x=13,y=13)])
		
		
		
		posParedesfantasma.addAll([new Position(x=9,y=11),new Position(x=10,y=11)])
		posParedes.forEach { p => self.dibujar(new Pared(position = p)) }	
		posParedesfantasma.forEach { p => self.dibujar(new ParedLineaFantasma(position = p)) }
	}
	
	
}
