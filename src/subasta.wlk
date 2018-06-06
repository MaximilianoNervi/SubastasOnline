import publicaciones.*

object subasta {

	var subastas = []
	
	method agregarSubasta(publicacionASubastar){
		subastas.add(publicacionASubastar)
	}
	
	method buscarObjeto(objeto){
		return subastas.any({c => c.mostarObjeto()== objeto})
	}
	
	method ofertan(objeto,usuario,oferta){
		var publicacion = self.buscarObjeto(objeto)
		publicacion.recibirOfertaDe(usuario, oferta)
	}
	
	method cobrarComision(publicacion){
		publicacion.cobrar()
	}
}
