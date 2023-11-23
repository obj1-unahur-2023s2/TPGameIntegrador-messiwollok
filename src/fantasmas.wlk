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
	var estaEnTablero = true
	
	var property image = color.imagenFantasma()
	
	method serComido(nivelActual){
		if (puedeComerse){
			game.sound("pacman-comerfantasma.mp3").play()
			pacman.sumarPuntos(1000)
			contador.actualizarPuntos()
			game.removeVisual(self)
			estaEnTablero = false
			position = posicionInicial
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
			game.removeVisual(self)
         	image = "fantasma_asustado.png"
         	estado = "asustado"
         	game.addVisual(self)
      } else{
      		if(estaEnTablero){
				game.removeVisual(self)
			}
         	image = color.imagenFantasma()
         	estado = "normal"
         	game.addVisual(self)
      }
	}
	
	method asustarse(){ 
		if (!puedeComerse){
		puedeComerse = true
		self.cambiarImagen()
		game.schedule(10000, { 
			puedeComerse = false
			self.cambiarImagen()
		})
		
		}
	}
	
	method iniciar(){
		game.onTick(500,"movimiento" ,{
			self.moverAzar()
			game.schedule(1000, {self.direccionAzar()})
		})
	}
	
	method direccionAzar(){
		direccion = direcciones.get(0.randomUpTo(3))
	}
	
	method moverAzar(){
		self.obtenerYValidarDireccionAlAzar()
		self.limitarCostadosTablero()
	}

	method limitarCostadosTablero(){
		if(position.x()==2 and position.y()==9){position= game.at(position.x()+1, position.y())}
		if(position.x()==game.width()-2 and position.y()==9){position= game.at(position.x()-1, position.y())}
	}
	
	method obtenerYValidarDireccionAlAzar() {
   		self.direccionAzar()
   		self.validarLugarLibre()	
	}

	method validarLugarLibre() {
		const posAlLado = direccion.siguiente(position) 
		const lugarLibre = game.getObjectsIn(posAlLado).all{ obj => obj.puedePisarte(self) } 
		
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

