object knightRider {
	method peso() = 500
	method peligrosidad()= 10
	method totalBultos() = 1
	method consecuencias(){}
}

object bumblebee {
	var esAuto = true
	method peso() = 800
	method esAuto()= esAuto
	method peligrosidad() = if(esAuto){15}else{30} 
	method transformar(){esAuto = !esAuto}
	method totalBultos() = 2
	method consecuencias(){esAuto=false}
}

object paqueteLadrillos{
	var property ladrillos = 0
	method peso() = ladrillos * 2
	method peligrosidad()= 2
	method totalBultos() = if(self.cantLadrillos().between(1,100)){1}
							else if (self.cantLadrillos().between(101,300)){2}
							else{3}
	method consecuencias(){cantLadrillos += 12}
}

object arena {
	var property peso = 0
	method peligrosidad()= 1
	method totalBultos() = 1
	method consecuencias(){peso += 20}
}

object bateriaAntiarea {
	var tieneMisiles = true
	method tieneMisiles()=tieneMisiles
	method peso() = if(tieneMisiles){300}else{200}
	method peligrosidad()= if(tieneMisiles){100}else{0}
	method alternarTenenciaMisiles(){tieneMisiles = !tieneMisiles}
	method totalBultos() = if(self.tieneMisiles()){2}else{1}
	method consecuencias(){tieneMisiles = true}
}

object contenedor {
	const property cosas = []
	method agregarObjeto(unObjeto) { cosas.add(unObjeto) }
	method sacarObjeto(unObjeto) { cosas.remove(unObjeto) }
	method peso() = 100 + cosas.sum({c=>c.peso()})
	method objetoConMayorPeligrosidad() = cosas.max({c=>c.peligrosidad()}) 
	method peligrosidad() = if(cosas.isEmpty()){0}else{self.objetoConMayorPeligrosidad().peligrosidad()}
	method totalBultos() = 1 + cosas.sum({c=>c.totalBultos()})
	method consecuencias(){ cosas.forEach({c=>c.consecuencias()}) }
}

object residuosRadioactivos {
	var property peso = 0
	method peligrosidad() = 200
	method totalBultos() = 1
	method consecuencias(){peso+=15}
}

object embalajeSeguridad {
	var property cosa
	method peso() = cosa.peso()
	method peligrosidad() = cosa.peligrosidad() / 2
	method totalBultos() = 2
	method consecuencias(){}
}
