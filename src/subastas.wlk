import publicaciones.*

object subasta {

	var subastas = []
	
	method agregarSubasta(publicacionASubastar){
		subastas.add(publicacionASubastar)
	}
	
	method buscarObjeto(objeto){
		return subastas.any({c => c.mostarObjeto()== objeto})
	}
}
