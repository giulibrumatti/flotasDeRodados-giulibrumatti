class Pedido{
	const property distancia
	const property tiempo
	const property pasajeros
	const coloresIncompatibles = #{}
	
	method velocidadRequerida() = distancia / tiempo
	
	method puedeSerSatisfechoPor(unRodado) = unRodado.velocidad() >= 10 + self.velocidadRequerida()
	&& unRodado.capacidad() >= pasajeros && self.esDeColorCompatible(unRodado.color())
	
	method esDeColorCompatible(unColor){
		return !coloresIncompatibles.contains(unColor)
	}
	
	
}

