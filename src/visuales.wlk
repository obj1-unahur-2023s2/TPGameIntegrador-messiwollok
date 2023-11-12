import wollok.game.*
import pacman.*
import niveles.*
import fantasmas.*
import elementos.*

class Obstaculos {
	const property obstaculos = []
	var property image = "muro.png"
	var property position = 0
	
	method iniciar(){
		
	}
	
	method aniadirGrupo(uno,dos){
		const grupo1 = new Obstaculos(position = game.at(uno, 3))
		const grupo2 = new Obstaculos(position = game.at(dos, 3))
		game.addVisual(grupo1)
		game.addVisual(grupo2)
		grupo1.iniciar()
		grupo2.iniciar()
	}
	
}

class GrupoObstaculos inherits Obstaculos{
	override method iniciar(){
		self.aniadirGrupo(2,3)
		self.aniadirGrupo(8,9)
		self.aniadirGrupo(14,15)
		self.aniadirGrupo(20,21)
		self.aniadirGrupo(26,27)
		
	}	
}
