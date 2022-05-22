import cosasParte2.*

object camion {
	const cosas = []
	method cargar(unaCosa){
		cosas.add(unaCosa)
		unaCosa.consecuencias()
	}
	
	method descargar(unaCosa){cosas.remove(unaCosa)}
	method todoPesoPar() = cosas.all({c=>c.peso().even()})
	method hayAlgunoQuePesa(peso) = cosas.any({c=>c.peso()==peso})
	method pesoTotal() = cosas.sum({c=>c.peso()}) + self.pesoCamionVacio()
	method elDeNivel(nivel) = cosas.find({c=>c.peligrosidad()==nivel})
	method pesoCamionVacio() = 1000
	method excedidoDePeso() = self.pesoTotal()>2500
	method cosasDeMayorPeligrosidadNivel(nivel) = cosas.filter({c=>c.peligrosidad()>=nivel})
	method cosasMasPeligrososQue(cosa) = self.objetosDeMayorPeligrosidadNivel(cosa.peligrosidad())
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) = self.excedidoDePeso() and self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()
	method hayAlgoQuePesaEntre(min, max) = cosas.any({c=>c.peso().between(min,max)})
	method cosaMasPesada() = cosas.max({c=>c.peso()})
	method pesos() = cosas.map({c=>c.peso()})
}
