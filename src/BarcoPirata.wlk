import Mision.*

class BarcoPirata {
	var property mision
	const capacidad
	const property tripulantes = #{}
	
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
	
	method pirataSeAnimaASaquear(unPirata){
		return unPirata.estaPasadoDeGrogXD()
	}
	
	method tieneCapacidadLlena(){
		return tripulantes.size() == capacidad
	}
	
	method agregarTripulante(unPirata){
		if(unPirata.puedeFormarParteDeLaTripulacionDe(self)){
			tripulantes.add(unPirata)
		}
		else {
			throw new Exception(message = "El tripulante no es apto para formar parte de la tripulacion")
		}
	}
	
	method cambiarMision(nuevaMision){
		mision = nuevaMision
		tripulantes.removeAllSuchThat({tripulante => !tripulante.puedeFormarParteDeLaTripulacionDe(self)})
	}
	
	method tripulanteMasEbrio(){
		return tripulantes.max({tripulante => tripulante.nivelEbriedad()})
	}
	
	method anclarEn(ciudadCostera){
		tripulantes.forEach({tripulante => tripulante.tomarGrogXD()})
		const tripulanteMasEbrio = self.tripulanteMasEbrio()
		if(tripulanteMasEbrio != null){
			tripulantes.remove(tripulanteMasEbrio)
			ciudadCostera.agregarHabitante()
		}
	}
}

class CiudadCostera {
	var cantidadDeHabitantes
	
	method esVulnerableA(unBarco){
		return unBarco.tripulantes().size() >= cantidadDeHabitantes * 0.4 || 
			   unBarco.tripulantes().all({tripulante => tripulante.estaPasadoDeGrogXD()})
	}
	
	method pirataSeAnimaASaquear(unPirata){
		return unPirata.nivelEbriedad() >= 50
	}
	
	method agregarHabitante(){
		cantidadDeHabitantes ++
	}
}
