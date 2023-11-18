import wollok.game.*
import pacman.*
import elementos.*
import direcciones.*
import niveles.*

class Comida {
	const property position
	method serComido(nivelActual){		
		pacman.sumarPuntos(100)
		contador.actualizarPuntos()
		game.removeVisual(self)
		nivelActual.eliminarComida(self)
	} 
	method image()
	method puedePisarte(obj) = true
	method iniciar(){game.addVisual(self)}
}

class SuperPastilla inherits Comida{
	override method image()= "pastilla.png"
	override method serComido(nivelActual){
		super(nivelActual)
		poderes.superPastilla()
		pacman.sumarPuntos(300)
		contador.actualizarPuntos()
	}
}

class Cereza inherits Comida {
	override method image() = "cereza.png"

}

class MenorVelocidad inherits Comida{
	override method image() = "pesa.png"
	override method serComido(nivelActual){
		super(nivelActual)
		poderes.menorVelocidad()
		pacman.sumarPuntos(200)
		contador.actualizarPuntos()
	}	
}

object comida1 {
	var comidasNormales = []
	
	method cargar(){
		
		(1 .. 18).forEach{ n => comidasNormales.add(new Cereza(position = game.at(n, 1) )) } // bordeAbajo
		(1 .. 5).forEach{ n => comidasNormales.add(new Cereza(position = game.at(n, 5)) )}
		(14 .. 18).forEach{ n => comidasNormales.add(new Cereza(position = game.at(n, 5))) }
		(7 .. 12).forEach{ n => comidasNormales.add(new Cereza(position = game.at(n, 4)) )}
		(7 .. 12).forEach{ n => comidasNormales.add(new Cereza(position = game.at(n, 7)) )}
		(1 .. 8).forEach{ n => comidasNormales.add(new Cereza(position = game.at(n, 18))) }
		(11 .. 18).forEach{ n => comidasNormales.add(new Cereza(position = game.at(n, 18))) }
		(11 .. 17).forEach{ n => comidasNormales.add(new Cereza(position = game.at(1, n)) )}
		(7 .. 11).forEach{ n => comidasNormales.add(new Cereza(position = game.at(3, n)) )}
		(11 .. 17).forEach{ n => comidasNormales.add(new Cereza(position = game.at(18, n))) }
		(7 .. 11).forEach{ n => comidasNormales.add(new Cereza(position = game.at(16, n)) )}
		(6 .. 17).forEach{ n => comidasNormales.add(new Cereza(position = game.at(6, n)) )}
		(6 .. 17).forEach{ n => comidasNormales.add(new Cereza(position = game.at(13, n)) )}
		(14 .. 17).forEach{ n => comidasNormales.add(new Cereza(position = game.at(4, n)) )}
		(14 .. 17).forEach{ n => comidasNormales.add(new Cereza(position = game.at(15, n)) )}
		(12 .. 17).forEach{ n => comidasNormales.add(new Cereza(position = game.at(8, n)) )}
		(12 .. 17).forEach{ n => comidasNormales.add(new Cereza(position = game.at(11, n)) )}
		
		comidasNormales.addAll([new Cereza(position = game.at(1,2)),new Cereza(position = game.at(1,3)),new Cereza(position = game.at(2,3)),new Cereza(position = game.at(3,4)), new Cereza(position = game.at(1,6)),
			new Cereza(position = game.at(1,7)),new Cereza(position = game.at(2,7)),new Cereza(position = game.at(2,11)),new Cereza(position = game.at(2,14)),new Cereza(position = game.at(3,14)),
			new Cereza(position = game.at(4,11)),new Cereza(position = game.at(4,12)),new Cereza(position = game.at(5,12)),new Cereza(position = game.at(8,6)), new Cereza(position = game.at(8,5)),
			new Cereza(position = game.at(7,12)),new Cereza(position = game.at(5,3)),new Cereza(position = game.at(5,4)),new Cereza(position = game.at(6,3)),new Cereza(position = game.at(7,2)),
			new Cereza(position = game.at(5,6)),new Cereza(position = game.at(5,8)),new Cereza(position = game.at(4,8)),new Cereza(position = game.at(11,5)),new Cereza(position = game.at(11,6)),
			new Cereza(position = game.at(12,2)),new Cereza(position = game.at(12,3)),new Cereza(position = game.at(10,2)),new Cereza(position = game.at(9,2)),new Cereza(position = game.at(13,3)),
			new Cereza(position = game.at(14,4)),new Cereza(position = game.at(14,6)),new Cereza(position = game.at(16,4)),new Cereza(position = game.at(17,3)),new Cereza(position = game.at(18,3)),
			new Cereza(position = game.at(18,6)),new Cereza(position = game.at(18,7)),new Cereza(position = game.at(17,7)),new Cereza(position = game.at(15,8)),new Cereza(position = game.at(14,8)),
			new Cereza(position = game.at(18,2)),new Cereza(position = game.at(15,11)),new Cereza(position = game.at(15,12)),new Cereza(position = game.at(14,12)),new Cereza(position = game.at(12,12)),
			new Cereza(position = game.at(12,15)),new Cereza(position = game.at(14,15)),new Cereza(position = game.at(16,14)),new Cereza(position = game.at(9,14)),new Cereza(position = game.at(10,14)),
			new Cereza(position = game.at(10,12)),new Cereza(position = game.at(9,12))])
		
		comidasNormales.addAll([new SuperPastilla(position = game.at(14,3)),new SuperPastilla(position = game.at(5,15)),new SuperPastilla(position = game.at(7,3)),new SuperPastilla(position = game.at(17,14))])
		comidasNormales.addAll([new Cereza(position = game.at(16,3)),new Cereza(position = game.at(3,3)),new Cereza(position = game.at(17,11)),new Cereza(position = game.at(7,15))])
		comidasNormales.forEach({x=>x.iniciar()})
	}

	
	
	method eliminar(comida){
		
		comidasNormales.remove(comida)		
		if(comidasNormales.isEmpty()) { game.schedule(500, { victoria.ejecutar() }) }	
		
	}
	method sacar(){
		game.schedule(500,{comidasNormales.clear()})
		
	}

}
object comida2 {
	var comidasNormales = []
	var comidasConEfecto = []
	method cargar(){
		
		(1 .. 18).forEach{ n => comidasNormales.add(new Cereza(position = game.at(n, 1) )) } // bordeAbajo
		(1 .. 18).forEach{ n => comidasNormales.add(new Cereza(position = game.at(n, 18)) )}
		(1 .. 18).forEach{ n => comidasNormales.add(new Cereza(position = game.at(n, 7))) }
		(11 .. 17).forEach{ n => comidasNormales.add(new Cereza(position = game.at(1, n)) )}
		(11 .. 17).forEach{ n => comidasNormales.add(new Cereza(position = game.at(18, n))) }
		(4 .. 15).forEach{ n => comidasNormales.add(new Cereza(position = game.at(n, 12)) )}
		(4 .. 6).forEach{ n => comidasNormales.add(new Cereza(position = game.at(n, 14)) )}
		(13 .. 15).forEach{ n => comidasNormales.add(new Cereza(position = game.at(n, 14)) )}
		(4 .. 6).forEach{ n => comidasNormales.add(new Cereza(position = game.at(n, 16)) )}
		(13 .. 15).forEach{ n => comidasNormales.add(new Cereza(position = game.at(n, 16)) )}
		(8 .. 11).forEach{ n => comidasNormales.add(new Cereza(position = game.at(n, 15)) )}
		(2 .. 7).forEach{ n => comidasNormales.add(new Cereza(position = game.at(n, 3)) )}
		(12 .. 17).forEach{ n => comidasNormales.add(new Cereza(position = game.at(n, 3)) )}
		(5 .. 14).forEach{ n => comidasNormales.add(new Cereza(position = game.at(n, 5)) )}
		(2 .. 6).forEach{ n => comidasNormales.add(new Cereza(position = game.at(1, n)) )}
		(2 .. 6).forEach{ n => comidasNormales.add(new Cereza(position = game.at(18, n)) )}
		(4 .. 6).forEach{ n => comidasNormales.add(new Cereza(position = game.at(3, n)) )}
		(4 .. 6).forEach{ n => comidasNormales.add(new Cereza(position = game.at(16, n)) )}
		(8 .. 16).forEach{ n => comidasNormales.add(new Cereza(position = game.at(3, n)) )}
		(8 .. 11).forEach{ n => comidasNormales.add(new Cereza(position = game.at(6, n)) )}
		(8 .. 16).forEach{ n => comidasNormales.add(new Cereza(position = game.at(16, n)) )}
		(8 .. 11).forEach{ n => comidasNormales.add(new Cereza(position = game.at(13, n)) )}
		(13 .. 17).forEach{ n => comidasNormales.add(new Cereza(position = game.at(7, n)) )}
		(13 .. 17).forEach{ n => comidasNormales.add(new Cereza(position = game.at(12, n)) )}
		
		comidasNormales.addAll([new Cereza(position = game.at(9,2)),new Cereza(position = game.at(10,2)),new Cereza(position = game.at(4,10)),new Cereza(position = game.at(5,10)), new Cereza(position = game.at(10,17)),
			new Cereza(position = game.at(8,6)),new Cereza(position = game.at(11,6)),new Cereza(position = game.at(14,10)),new Cereza(position = game.at(15,10)),new Cereza(position = game.at(9,17))])
	
		comidasNormales.addAll([new SuperPastilla(position = game.at(2,16)),new SuperPastilla(position = game.at(17,16)),new SuperPastilla(position = game.at(5,4)),new SuperPastilla(position = game.at(14,4))])
		comidasNormales.forEach({x=>x.iniciar()})
		comidasConEfecto.addAll([new MenorVelocidad(position = game.at(2,11)),new MenorVelocidad(position = game.at(17,11)),new MenorVelocidad(position = game.at(12,2)),new MenorVelocidad(position = game.at(7,2))])
		comidasConEfecto.forEach({x=>x.iniciar()})
	}

	method eliminar(comida){
		comidasNormales.remove(comida)		
		if(comidasNormales.isEmpty()) { game.schedule(500, { victoria.ejecutar() }) }
	}
	
	method sacar(){
		game.schedule(500,{comidasNormales.clear()})
		
	}
	

}
