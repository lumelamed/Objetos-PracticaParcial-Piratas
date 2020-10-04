import Mision.*

class BarcoPirata {
	var property mision
	const capacidad
	const tripulantes = #{}
	
	method esTemible() {
		return self.puedeCumplirMision()
	}
	
	method puedeCumplirMision(){
		return mision.puedeSerRealizadaPor(self)
	}
	
	method tieneSuficienteTripulacion(){
		return tripulantes.size() >= capacidad * 0.9
	}
	
	method esVulnerableA(otroBarco){
		return tripulantes.size() <= otroBarco.tripulantes().size() / 2
	}
}
