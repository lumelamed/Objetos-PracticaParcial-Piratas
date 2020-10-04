import Pirata.*
import BarcoPirata.*

class Mision {
	
	method puedeSerRealizadaPor(unBarco){
		return unBarco.tieneSuficienteTripulacion()
	}
}

class BusquedaDelTesoro inherits Mision {
	
	override method puedeSerRealizadaPor(unBarco){
		return super(unBarco) &&
			unBarco.tripulantes().anyOne({tripulante => tripulante.items().contains(llaveDeCofre)})
	}
}