class Pirata {
	const items = []
	const nivelEbriedad
	const cantidadDinero
	
	method items(){
		return items
	}
	
	method cantidadDinero(){
		return cantidadDinero
	}
	
	method esUtilParaMision(unaMision) {
		unaMision.pirataCumpleRequisitos(self)
	}
	
	method estaPasadoDeGrogXD(){
		return nivelEbriedad >= 90
	}
	
	method seAnimaASaquearA(unaVictima){
		return self.estaPasadoDeGrogXD()
	}
}