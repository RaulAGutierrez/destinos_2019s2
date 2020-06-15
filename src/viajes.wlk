

class Viaje {
	var property idiomas = []  // lista de idiomas
	var property esfuerzo   // booleano
	var property sirveBroncearse   // booleano
	var property diasActividad   // numerico
	
	method ingresar(idioma) { idiomas.add(idioma) }
	method quitar(idioma) { if ( not idiomas.empty()) { idiomas.remove(idioma) } }
	method interesante() { return idiomas.size() > 1 }
}

class ViajesDePlaya inherits Viaje {
	var property largoPlaya // metros -> numerico
	
	override method diasActividad() { return largoPlaya / 500 }
	override method esfuerzo() { return largoPlaya > 1200 }
	override method sirveBroncearse() { return true }
}

class ExcursionACiudad inherits Viaje {
	var property cantidadAtracciones // cantidad -> numerico
	
	override method diasActividad() { return cantidadAtracciones / 2 }
	override method esfuerzo() { return cantidadAtracciones.between(5,8) }
	override method sirveBroncearse() { return false}
	override method interesante() { return super() or (cantidadAtracciones == 5) }
}

class CiudadTopical inherits ExcursionACiudad {
	
	override method diasActividad() { return super() + 1 }
	override method sirveBroncearse() { return true}
}

class SalidaTrekking inherits Viaje {
	var property kmSenderos // km -> numerico
	var property diasSoleados // cantidad -> numerico
	
	override method diasActividad() { return kmSenderos / 50 }
	override method esfuerzo() { return kmSenderos / 80 }
	override method sirveBroncearse() { return ((diasSoleados > 200) or (diasSoleados.between(5,8))) and (kmSenderos > 120) }
	override method interesante() { return super() and (diasSoleados > 140) }
}

class Gimnasia inherits Viaje {
	
	override method idiomas() { return ["español"] }
	override method diasActividad() { return 1 }
	override method esfuerzo() { return true }
	override method sirveBroncearse() { return false }
}