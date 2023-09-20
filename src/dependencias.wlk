import rodados.*
import pedido.*

class Dependencias {
	
	var property cantidadEmpleado = 0
	const rodados = []
	const pedidos = []
	
	
	method agregarAFlota(rodado){
		rodados.add(rodado)
	}
	
	method quitarDeFlota(rodado){
		rodados.remove(rodado)
	}
	
	method pesoTotalFlota(){
		return rodados.sum({rodado => rodado.peso()})
	}
	
	method todosSuperanXVelocidad(velocidad){
		return rodados.all({r => r.velocidad() >= velocidad})
	}
	
	method estaBienEquipada(){
		return rodados.size() >= 3 && self.todosSuperanXVelocidad(100)
	}
	
	method obtenerRodadosDeColor(color){
		return rodados.filter({r => r.color() == color})
	}
	
	method capacidadTotalEnColor(color){
		return self.obtenerRodadosDeColor(color).sum({r => r.capacidad()})
	}
	
	method colorDelRodadoMasRapido(){
		return self.obtenerRodadosMasRapido().color()
	}
	
	method obtenerRodadosMasRapido() {
		if(rodados.isEmpty()){
			self.error("NO se puede calcular el maximo")
		}
		return rodados.max({r => r.velocidad()})
	}
	
	method capacidadDeLaFlota(){
		return rodados.sum({r => r.capacidad()})
	}
	
	method capacidadFaltante(){
		return 0.max(cantidadEmpleado - self.capacidadDeLaFlota())
	}
	
	method esGrande(){
		return cantidadEmpleado >= 40 && rodados.size() >= 5
	}
	
	method ningunoSatisfase(pedido){
		return rodados.all({r => !pedido.puedeSerSatisfechoPor(r)})
		/*return not rodados.any({r => pedido.puedeSerSatisfechoPor(r)*/
	}
	
	method pedidosInsatisfechos(){
		return pedidos.filter({p => self.ningunoSatisfase(p)})
	}
}
