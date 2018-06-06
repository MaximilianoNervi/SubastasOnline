import usuarios.*
import subasta.*

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

	method oferta(unUsuario, unMonto) {
		self.modificoOferta(unUsuario, unMonto)
		unUsuario.agregarOferta(self)
	}

	method chequeoEstado() {
		if (!estadoDeLaPublicacion) subasta.cobrarComision(self)
	}

	method recibirOfertaDe(unUsuario, unMonto) {
		self.chequeoEstado()
		if (unMonto > oferta) self.oferta(unUsuario, unMonto)
		unUsuario.agregarOferta(self)
	}

	method modificoOferta(unUsuario, unMonto) {
		usuarioConMayorOferta = unUsuario
		oferta = unMonto
		var oferente = [ unUsuario, unMonto ]
		self.agregarOferente(oferente)
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
		return objeto.comision(oferta)
	}

}

class Producto {

	var valorFijo

	method comision(valor) {
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

	override method comision(valor) {
		return valor * 0.10
	}

}

class Varios inherits Producto{
	
	override method comision(valor){
		var cincoPorciento = valor*0.05
		if((cincoPorciento) > 10) return cincoPorciento
		else return 10
	}
}

