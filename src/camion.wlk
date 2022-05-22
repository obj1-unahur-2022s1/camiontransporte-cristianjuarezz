import cosas.*

object camion{

	var cosas = []

	method cargar(unaCosa){cosas.add(unaCosa)}
	method descargar(unaCosa){cosas.remove(unaCosa)}
	method hayAlgunoQuePesa(peso) = cosas.any({c=>c.peso()==peso})
	method todoPesoPar() = cosas.all({c=>c.peso().even()})
	method elDeNivel(nivel) = cosas.find({c=>c.peligrosidad()==nivel})
	method pesoTotal() = cosas.sum({c=>c.peso()}) + self.pesoCamionVacio()
	method pesoCamionVacio() = 1000
	method excedidoDePeso() = self.pesoTotal()>2500
	method cosasDeMayorPeligrosidadNivel(nivel) = cosas.filter({c=>c.peligrosidad()>=nivel})
	method cosasMasPeligrososQue(cosa) = self.cosasDeMayorPeligrosidadNivel(cosa.peligrosidad())
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) = self.excedidoDePeso() and self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()
	method hayAlgoQuePesaEntre(min, max) = cosas.any({c=>c.peso().between(min,max)})
	method cosaMasPesada() = cosas.max({c=>c.peso()})
	method pesos() = cosas.map({c=>c.peso()})	
}
