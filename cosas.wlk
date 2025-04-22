object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {

	var property esAuto = false

	method peso() {
	  return 800
	}

	method nivelPeligrosidad(){
		return if (esAuto) {15} else {30}
	}
}

object paqueteLadrillos {

	var property cantidad = 5
  
  method peso() {
	return 2 * cantidad
  }

  method nivelPeligrosidad(){
	return 2
  }
}

object arenaGranel {
	
	var property peso = 5
  
  	method nivelPeligrosidad() {
		return 1
  }
}

object bateriaAntiaerea {
  
  var property tieneMisiles = false

  method peso(){
	return if (tieneMisiles) {300} else {200}
  }

  method nivelPeligrosidad(){
	return if (tieneMisiles) {100} else {0}
  }
}

object contenedorPortuario {

  const property cosasContenedor = #{} 

  const pesoContenedor = 100

  method peso() {
	return pesoContenedor + cosasContenedor.sum()
  }

  method nivelPeligrosidad() {
	return cosasContenedor.max({cosa => cosa.nivelPeligrosidad()})
  }
}

object residuosRadioactivos {
  
  var property peso = 150

  method nivelPeligrosidad() {
	return 200
  }
}

object embalajeSeguridad {
  
  method peso(cosa) {
	return cosa.peso()
  }

  method nivelPeligrosidad(cosa){
	return cosa.nivelPeligrosidad() / 2
  }
}