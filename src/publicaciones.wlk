import usuarios.*

class Publicacion {

	var fecha
	var objeto
	var usuario
	var property oferta
	var property usuarioConMayorOferta = sinUsuario
	var property estadoDeLaPublicacion = true
	var mejoresOferentes = []

	method cerrarSubasta() {
		estadoDeLaPublicacion = false
	}

	method recibirOfertaDe(unUsuario, unMonto) {
		var oferente = [ unUsuario, unMonto ]
		if (estadoDeLaPublicacion) {
			if (unMonto > oferta) {
				self.ofertar(unUsuario, unMonto)
				self.agregarOferente(oferente)
			}
		} else self.cobrar()
	}

	method ofertar(unUsuario, unMonto) {
		usuarioConMayorOferta = unUsuario
		oferta = unMonto
	}

	method agregarOferente(oferente) {
		mejoresOferentes.add(oferente)
	}

	method cobrar() {
		usuario.comisionACobrar()
		usuarioConMayorOferta.subastaGanada(self)
	}

	method mostrarObjeto() {
		return objeto
	}

	method oferentes() {
		return mejoresOferentes
	}

	method comision() {
		return objeto.valor(oferta)
	}

}

class Producto {

	var valorFijo

	method valor(valor) {
		return valorFijo
	}

}

class Vehiculo inherits Producto {

}

class Inmueble inherits Producto {

}

//	const vehiculos = new Producto(valorFijo = 500)
//	const inmuebles = new Producto(valorFijo = 1000)
class ArticuloDeComputacion inherits Producto {

	override method valor(valor) {
		return valor * 0.01
	}

}

