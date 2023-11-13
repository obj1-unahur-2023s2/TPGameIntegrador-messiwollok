import wollok.game.*
import pacman.*
import niveles.*
import fantasmas.*

class Visual{
	var property position = game.at(0,0)
	var property image
	method ejecutar(){
		game.addVisual(self)
	}
	method remover(){game.removeVisual(self)}
}

object inicio inherits Visual(image= "PacManInicio.jpg",position= game.at(0,3)){
		
}

object menu inherits Visual(image = "fondo.png"){
	const property ajustes = new Visual(image = "")
	
	override method ejecutar(){
		super()
	
		
		keyboard.enter().onPressDo{
			game.clear()
			nivel1.iniciar()
			soundPrincipal.play()
		}
		game.width(26)
		game.height(20)
		keyboard.f().onPressDo({self.instruccionesInicio()})
		keyboard.q().onPressDo{game.stop()} 
		
	}
	
	method instruccionesInicio(){
		
		game.addVisual(instruccionesMenu)
		keyboard.b().onPressDo{
			if(game.hasVisual(instruccionesMenu)){
        		game.removeVisual(instruccionesMenu)
        	}
			if(game.hasVisual(instruccionesMenuDos)){
        		game.removeVisual(instruccionesMenuDos)
        	}
		}
		keyboard.c().onPressDo{
			if(game.hasVisual(instruccionesMenu)){
        		game.removeVisual(instruccionesMenu)
        	}
			game.addVisual(instruccionesMenuDos)
		}
      
    
	}
	method instruccionesEnJuego(){
		game.removeVisual(visualPausa)
		game.addVisual(instruccionesJuego)
		keyboard.b().onPressDo{game.removeVisual(instruccionesJuego)}
		keyboard.p().onPressDo({
			game.removeVisual(instruccionesJuego)
			self.juegoPausa()
		})
	}
	
	method juegoPausa(){
		game.addVisual(visualPausa)
		keyboard.v().onPressDo{game.removeVisual(visualPausa)}
		keyboard.f().onPressDo({self.instruccionesEnJuego()})
		keyboard.q().onPressDo({
			game.clear()
			self.ejecutar() 
			inicio.ejecutar()
		})
	}
	
	method volverAlMenu(){
		game.clear()
		inicio.ejecutar()
	}
}

object victoria inherits Visual(image = "fondo.png"){
	override method ejecutar(){
		game.clear()
		super()
		game.addVisual(logrado)
		//soundPrincipal.stop()
		//soundVictoria.play()
		keyboard.m().onPressDo{self.siguientePartida()}
	}
	method siguientePartida(){
		game.clear()
		pacman.resetear()
		
		menu.ejecutar()
		inicio.ejecutar()
	}

}

object gameOver inherits Visual(image = "fondo.png "){
	override method ejecutar(){
		super()
		//soundPrincipal.stop()
		//soundGameOver.play()
		game.clear()
		game.addVisual(self)
		game.schedule(500,{
			
			game.addVisual(terminado)
		})
	}
}

object siguienteNivel inherits Visual(image="fondo.png"){
	
	override method ejecutar(){
		game.clear()
		super()
		game.addVisual(intermedio)
		keyboard.enter().onPressDo{
			game.clear()
			
			pacman.pasarNivel()
		}
	}
}

object logo1{
	var property position = game.at(20,17)
		method image()= "pacmanlogo.jpg"
}

object logo2{
	var property position = game.at(21,13)
		method image()= "pacmanlogo2.jpg"
}

object soundPrincipal {
	
	method play(){
		game.sound("pacman-music.mp3").play()	
	}
}



object grupoVidas{
	var property position = game.at(22,7)
	var property image = "vidas" + pacman.vidas() + ".png"
	method iniciar(){game.addVisual(self)}
	method resetear(){
		game.removeVisual(self)
		image = "vidas3.png"
		game.addVisual(self)
	}
}

object contador{
	var property text= "PUNTOS: " + pacman.puntos().toString()
	var property position=game.at(22,3)
	var property textColor= "#FFFFFF"
	method actualizarPuntos(){
		text= "PUNTOS: " + pacman.puntos().toString()
	}
	method resetear(){
		pacman.puntos(0)
		self.actualizarPuntos()
	}
}

object mostrarPuntos{
	
	var property text= "PUNTOS: " + pacman.puntos().toString()
	var property position= game.at(13,10)
	var property textColor= "#FFFFFF"
	
}

object terminado {
	method position() = game.at(0,3)
	method image() = "gameover2.jpg"
}

object intermedio{
	method position() = game.at(0,5)
	method image() = "visualEntreNivel.jpg"
}
object logrado{
	method position() = game.at(0,5)
	method image() = "ganaste.jpg"
}

object logoOpciones {
	var property position = game.at(20,11)
		method image()= "logoOpciones.jpg"
}

object visualPausa {
	var property position = game.at(4,5)
	method image() = "visualPausa.jpg"
}

object instruccionesMenuDos {
    var property position = game.at(8,3)
    method image() = "instruccionesMenuDos.jpg"
}

object instruccionesJuego{
	var property position = game.at(4,4)
	method image() = "instruccionesJuego.jpg"
}

object instruccionesMenu {
	var property position = game.at(8,3)
	method image() = "instruccionesMenu.jpg"
}

