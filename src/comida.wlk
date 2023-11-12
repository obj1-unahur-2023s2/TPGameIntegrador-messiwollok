import wollok.game.*
import pacman.*
import elementos.*

class Comida {
	const property position
	method serComido(){
		game.removeVisual(self)
		pacman.sumarPuntos(100)
		contador.actualizarPuntos()
	} 
	method image() = "cereza.png"
	method puedePisarte(obj) = true
}

class SuperPastilla inherits Comida{
	override method image()= "pastilla.png"
	override method serComido(){
		super()
		
		pacman.sumarPuntos(300)
		contador.actualizarPuntos()
		poderes.superPastilla()
	}
}

class SuperVelocidad inherits Comida{
	override method image() = "sandia.png" //deje la misma imagen del otro poder pero podria cambiarse 
	override method serComido(){
		super()
		
		pacman.sumarPuntos(200)
		contador.actualizarPuntos()
		poderes.superVelocidad()
	}	
}

object comida1 {
	method cargar(){

		var comidas = []
		(1 .. 18).forEach{ n => comidas.add(new Position(x=n, y=1)) } // bordeAbajo
		(1 .. 5).forEach{ n => comidas.add(new Position(x=n, y=5)) }
		(14 .. 18).forEach{ n => comidas.add(new Position(x=n, y=5)) }
		(7 .. 12).forEach{ n => comidas.add(new Position(x=n, y=4)) }
		(7 .. 12).forEach{ n => comidas.add(new Position(x=n, y=7)) }
		(1 .. 8).forEach{ n => comidas.add(new Position(x=n, y=18)) }
		(11 .. 18).forEach{ n => comidas.add(new Position(x=n, y=18)) }
		(11 .. 17).forEach{ n => comidas.add(new Position(x=1, y=n)) }
		(7 .. 11).forEach{ n => comidas.add(new Position(x=3, y=n)) }
		(11 .. 17).forEach{ n => comidas.add(new Position(x=18, y=n)) }
		(7 .. 11).forEach{ n => comidas.add(new Position(x=16, y=n)) }
		(6 .. 17).forEach{ n => comidas.add(new Position(x=6, y=n)) }
		(6 .. 17).forEach{ n => comidas.add(new Position(x=13, y=n)) }
		(14 .. 17).forEach{ n => comidas.add(new Position(x=4, y=n)) }
		(14 .. 17).forEach{ n => comidas.add(new Position(x=15, y=n)) }
		(12 .. 17).forEach{ n => comidas.add(new Position(x=8, y=n)) }
		(12 .. 17).forEach{ n => comidas.add(new Position(x=11, y=n)) }
		
		comidas.addAll([new Position(x=1,y=2),new Position(x=1,y=3),new Position(x=2,y=3),new Position(x=3,y=4), new Position(x=1,y=6),new Position(x=1,y=7),new Position(x=2,y=7),
			new Position(x=2,y=11),new Position(x=2,y=14),new Position(x=3,y=14),new Position(x=4,y=11),new Position(x=4,y=12),new Position(x=5,y=12),new Position(x=8,y=6), 
			new Position(x=8,y=5),new Position(x=7,y=12),new Position(x=5,y=3),new Position(x=5,y=4),new Position(x=6,y=3),new Position(x=7,y=2),
			new Position(x=5,y=6),new Position(x=5,y=8),new Position(x=4,y=8),new Position(x=11,y=5),new Position(x=11,y=6),new Position(x=12,y=2),new Position(x=12,y=3),new Position(x=10,y=2),
			new Position(x=9,y=2),new Position(x=13,y=3),new Position(x=14,y=4),new Position(x=14,y=6),new Position(x=16,y=4),new Position(x=17,y=3),
			new Position(x=18,y=3),new Position(x=18,y=6),new Position(x=18,y=7),new Position(x=17,y=7),new Position(x=15,y=8),new Position(x=14,y=8),new Position(x=18,y=2),
			new Position(x=15,y=11),new Position(x=15,y=12),new Position(x=14,y=12),new Position(x=12,y=12),new Position(x=12,y=15),new Position(x=14,y=15),new Position(x=16,y=14),
			new Position(x=9,y=14),new Position(x=10,y=14),new Position(x=10,y=12),new Position(x=9,y=12)])
		
		
		comidas.forEach { p => self.dibujar(new Comida(position = p)) }
		
		var pastillas = []
		
		pastillas.addAll([new Position(x=14,y=3),new Position(x=5,y=15),new Position(x=7,y=3),new Position(x=17,y=14)])
		pastillas.forEach { p => self.dibujar(new SuperPastilla(position = p)) }
		
		var sandias = []
		sandias.addAll([new Position(x=16,y=3),new Position(x=3,y=3),new Position(x=17,y=11),new Position(x=7,y=15)])
		sandias.forEach { p => self.dibujar(new SuperVelocidad(position = p)) }
		
	}
	method dibujar(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}
}
