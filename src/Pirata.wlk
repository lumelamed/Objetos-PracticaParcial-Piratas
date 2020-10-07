import Item.*

class Pirata {
	var property items = []
	var property nivelEbriedad
	var property cantidadDinero
	var pirataQueLoInvito
	
	method esUtilParaMision(unaMision) {
		return unaMision.pirataCumpleRequisitos(self)
	}
	
	method estaPasadoDeGrogXD(){
		return nivelEbriedad >= 90
	}
	
	method seAnimaASaquearA(unaVictima){
		return unaVictima.pirataSeAnimaASaquear(self)
	}
	
	method puedeFormarParteDeLaTripulacionDe(unBarco){
		return !unBarco.tieneCapacidadLlena() && self.esUtilParaMision(unBarco.mision())
	}
	
	method tomarGrogXD(){
		//items.add(botellaDeGrogXD)
		if(cantidadDinero <= 0){
			throw new Exception(message = "El pirata no tiene dinero para comprar el Grog XD")
		} else {
			(cantidadDinero --).max(0)
		}
		nivelEbriedad += 5
	}
}

class PirataEspia inherits Pirata {
	override method estaPasadoDeGrogXD(){ // "nunca esta pasado de grogXD" puede interpretarse como "no importa su nivel de ebriedad, nunca esta pasado" o "no tiene la capacidad de tener mas de 90 de nivelDeEbriedad", yo elegi la primera
		return false
	}
	
	override method seAnimaASaquearA(unaVictima){
		return super(unaVictima) && items.contains(permisoDeLaCorona)
	}
}