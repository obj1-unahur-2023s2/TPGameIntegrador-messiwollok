import wollok.game.*
import pacman.*
import direcciones.*
import pared.*
import niveles.*
import elementos.*

class Fantasma{
	const posicionInicial 
	var property position = posicionInicial
	var puedeComerse = false 
	const direcciones = [abajo,izquierda, derecha, arriba]
	var direccion = arriba
	var estado = "normal"
	var  property color 
	
	var property image = "fantasma" + color + ".png"
	
	method serComido(nivelActual){
		if (puedeComerse){
			position = posicionInicial
			pacman.sumarPuntos(1000)
			contador.actualizarPuntos()
			game.removeVisual(self)
			image = "fantasma" + color + ".png"
			game.schedule(5000, {
				if(not game.hasVisual(self)){
					game.addVisual(self)
				}
			})
			} 
		else{
			pacman.morir()
			pacman.restarPuntos(500)
			contador.actualizarPuntos()
		}
	}
	method estaAsustado() = puedeComerse
	
	method resetear(){
		position = posicionInicial
	}
	
	method cambiarImagen(){
		if (estado == "normal") {
         	image = "fantasma" + color + ".png"
         	estado = "asustado"
      } else{
      		game.removeVisual(self)
         	image = "fantasma_asustado.png"
         	estado = "normal"
         	game.addVisual(self)
      }
	}
	
	method asustarse(){ 
		puedeComerse = true
		estado = "asustado"
		self.cambiarImagen()
		game.schedule(10000, { 
			puedeComerse = false
			if(game.hasVisual(self)){
				game.removeVisual(self)
			}
			self.cambiarImagen()
			game.addVisual(self)
		})
	}
	
	method iniciar(){
		game.onTick(1000,"movimiento" ,{
			self.avanzar()
			game.schedule(500, {self.direccionAzar()})
		})
	}
	method avanzar(){
		if(direccion!=null)
			self.moverAzar()	
	}

	method direccionAzar(){
		direccion = direcciones.get(0.randomUpTo(3))
	}
	
	method moverAzar(){
		self.obtenerYValidarDireccionAlAzar()
	}
	
	method obtenerYValidarDireccionAlAzar() {
   		self.direccionAzar()
   		self.validarLugarLibre()	
	}

	method validarLugarLibre() {
		const posAlLado = direccion.siguiente(position) 
		const lugarLibre = game.getObjectsIn(posAlLado)
			.all{ obj => obj.puedePisarte(self) } 
		
		if (!lugarLibre) 
			self.moverAzar()
		else{
			position = posAlLado
		}
	}
	
	method puedePisarte(_) = true

	
}

object grupoFantasma {
	const fantasma2 =new Fantasma(posicionInicial=game.at(9,10), color = "rojo")
	const fantasma4 =new Fantasma(posicionInicial=game.at(10,10), color = "verde")
	const fantasma1 =new Fantasma(posicionInicial=game.at(11,10), color = "celeste")
	const fantasma3 =new Fantasma(posicionInicial=game.at(8,10), color = "amarillo")
	
	const fantasmas = [fantasma1,fantasma2,fantasma3,fantasma4]
	
	method introducir(){
		fantasmas.forEach( {rival => 
			game.addVisual(rival)
			rival.iniciar()
			})
	}
	
	method asustarGrupo(){
		fantasmas.forEach{x=>x.asustarse()}
//	funcion tambien deberia ir dentro del pacman.
	}
	
	method reseteo(){
		fantasmas.forEach{x=>x.resetear()}
	}
	
}

