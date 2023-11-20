import wollok.game.*
import pacman.*
import direcciones.*
import pared.*
import niveles.*
import elementos.*

class Color {
	const property string
	
	method imagenFantasma(){
		return "fantasma"+string+".png"
	}
}

const rojo = new Color (string = "rojo")
const celeste = new Color (string = "celeste")
const amarillo = new Color (string = "amarillo")
const verde = new Color (string = "verde")

class Fantasma{
	const posicionInicial 
	var property position = posicionInicial
	var puedeComerse = false 
	const direcciones = [abajo,izquierda, derecha, arriba]
	var direccion = arriba
	var estado = "normal"
	var  property color 
	
	var property image = color.imagenFantasma()
	
	method serComido(nivelActual){
		if (puedeComerse){
			position = posicionInicial
			pacman.sumarPuntos(1000)
			contador.actualizarPuntos()
			game.removeVisual(self)
			self.cambiarImagen()
			game.schedule(5000, {
				if(!game.hasVisual(self)){
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
         	image = color.imagenFantasma()
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
		game.onTick(500,"movimiento" ,{
			self.moverAzar()
			game.schedule(500, {self.direccionAzar()})
		})
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
	const fantasmaRojo =new Fantasma(posicionInicial=game.at(9,10), color = rojo)
	const fantasmaVerde =new Fantasma(posicionInicial=game.at(10,10), color = verde)
	const fantasmaCeleste =new Fantasma(posicionInicial=game.at(11,10), color = celeste)
	const fantasmaAmarillo =new Fantasma(posicionInicial=game.at(8,10), color = amarillo)
	
	const fantasmas = [fantasmaRojo,fantasmaVerde,fantasmaCeleste,fantasmaAmarillo]
	
	method introducir(){
		fantasmas.forEach( {rival => 
			game.addVisual(rival)
			rival.iniciar()
			})
	}
	
	method asustarGrupo(){
		fantasmas.forEach{x=>x.asustarse()}
	}
	
	method reseteo(){
		fantasmas.forEach{x=>x.resetear()}
	}
	
}

