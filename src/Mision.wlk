import Pirata.*
import BarcoPirata.*
import Item.*

class Mision {
	method puedeSerRealizadaPor(unBarco){
		return unBarco.tieneSuficienteTripulacion()
	}
	
	method pirataCumpleRequisitos(unPirata)
}

class BusquedaDelTesoro inherits Mision {
	const itemsRequeridos = #{brujula, mapa, botellaDeGrogXD}
	
	override method puedeSerRealizadaPor(unBarco){
		return super(unBarco) &&
			unBarco.tripulantes().any({tripulante => tripulante.items().contains(llaveDeCofre)})
	}
	
	override method pirataCumpleRequisitos(unPirata){
		return itemsRequeridos.any({itemReq => unPirata.items().contains(itemReq)}) && unPirata.cantidadDinero() <= 5
	}
}

class ConvertirseEnLeyenda inherits Mision {
	const itemObligatorio
	
	override method pirataCumpleRequisitos(unPirata){
		return unPirata.items().size() >= 10 && unPirata.items().contains(itemObligatorio)
	}
}

class Saqueo inherits Mision {
	var property cantidadRequeridaDeMonedas
	const victima
	
	override method puedeSerRealizadaPor(unBarco){
		return super(unBarco) &&
			victima.esVulnerableA(unBarco)
	}
	
	override method pirataCumpleRequisitos(unPirata){
		return unPirata.cantidadDinero() <= cantidadRequeridaDeMonedas && unPirata.seAnimaASaquearA(victima)
	}
}