import cosas.*

object camion {
	const property cosas = #{bumblebee, paqueteLadrillos}
	const pesoCamion = 1000
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
	  cosas.remove(unaCosa)
	}

	method todoPesoPar() {
	  return cosas.all({cosa => cosa.peso().even()})
	}

	method hayAlgunoQuePesa(peso){
		return if (not cosas.isEmpty()) {cosas.any({cosa => cosa.peso() == peso})}
	}

	method elDeNivel(nivel) {
	  
	  return cosas.filter( {cosa => cosa.nivelPeligrosidad() == nivel}).first()
	}

	method pesoTotal() {
	  return cosas.sum({cosa => cosa.peso()}) + pesoCamion
	}

	method excedidoDePeso() {
	  return not (self.pesoTotal() < 2500 )
	}

	method objetosQueSuperanPeligrosidad(nivel){
	  return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel })
	}

	method objetosMasPeligrososQue(cosa){
	  return cosas.filter({ cosaCamion => cosaCamion.nivelPeligrosidad() > cosa.nivelPeligrosidad()})
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
	  return not (self.excedidoDePeso()) and self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()
	}

	method pesaEntre(cosa, min, max) {
	  return cosa > min and cosa < max
	}

	method tieneAlgoQuePesaEntre(min, max){

		return cosas.any({cosa => self.pesaEntre(cosa.peso(), min, max)})
	}

	method cosaMasPesada() {
	  return cosas.max({cosa => cosa.peso()})
	}

	method pesos() {
	  return cosas.map({cosa => cosa.peso()})
	}
}
