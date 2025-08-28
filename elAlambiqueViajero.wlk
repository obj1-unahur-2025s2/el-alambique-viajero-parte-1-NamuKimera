object luke {
  var cantidadDeViajes = 0
  var recuerdo = null
  var autoActual = alambiqueVeloz

  method recuerdo() = recuerdo
  method autoActual() = autoActual
  method cuantosViajes() = cantidadDeViajes
  method Viajar(lugar) {
    if (lugar.puedeLlegar()) {
      cantidadDeViajes = cantidadDeViajes + 1
      recuerdo = lugar.recuerdoTipico()
      self.autoActual().ConsumirCombustible()
      self.autoActual().EjecutarAccionSegunCiudad(lugar)
    }
  }
  method CambiarAuto(autoNuevo) {
    autoActual = autoNuevo
  }
}

//Vehiculos

object alambiqueVeloz {
  var combustible = 100
  const consumoPorViaje = 10
  var esRapido = true

  method tieneCombustible() {
    return combustible >= 10
  }
  method ConsumirCombustible() {
    combustible = combustible - consumoPorViaje
  }
  method esRapido() = esRapido
  method CambiarVelocidad() {
    esRapido = not esRapido
  }
  method EjecutarAccionSegunCiudad(ciudad) {}
}

object superChatarraEspecial {
  var combustible = 100
  const consumoPorViaje = 10
  var esRapido = true
  var balas = 50

  method tieneCombustible() {
    return combustible >= 10
  }
  method ConsumirCombustible() {
    combustible = combustible - consumoPorViaje
  }
  method esRapido() = esRapido
  method CambiarVelocidad() {
    esRapido = not esRapido
  }
  method EjecutarAccionSegunCiudad(ciudad) {
    self.Disparar_Balas(ciudad.gangsters())
  }
  method Disparar_Balas(cantidadDeDisparos) {
    balas = balas - cantidadDeDisparos
    self.consumirPorDisparo(cantidadDeDisparos)
  }
  method consumirPorDisparo(cantidadDeDisparos) {
   combustible = combustible - cantidadDeDisparos
  }
}

object antiguallaBlindada {
  var combustible = 100
  const consumoPorViaje = 10
  var cantidadDeGangsters = 0

  method cantidadDeGangsters() = cantidadDeGangsters
  method tieneCombustible() {
    return combustible >= 10
  }
    method ConsumirCombustible() {
    combustible = combustible - consumoPorViaje
  }
  method esRapido() {
    return cantidadDeGangsters < 10
  }

  method SubirCantidadDeGangsters(cantidad) {
    cantidadDeGangsters = cantidadDeGangsters + cantidad
  }

  method EjecutarAccionSegunCiudad(ciudad) {
    self.SubirCantidadDeGangsters(ciudad.cantidadDeGangsters())
  }
}

object superConvertible {
  var combustible = 100
  const consumoPorViaje = 10
  var esRapido = true
  var elTechoEstaPuesto = false

  method elTechoEstaPuesto() = elTechoEstaPuesto
  method tieneCombustible() {
    return combustible >= 10
  }
  method ConsumirCombustible() {
    combustible = combustible - consumoPorViaje
  }
  method esRapido() = esRapido
  method CambiarVelocidad() {
    esRapido = not esRapido
  }
  method CambiarTecho() {
    elTechoEstaPuesto = not elTechoEstaPuesto
  }
  method EjecutarAccionSegunCiudad(ciudad) {}
}

//Paises

object paris {
  method cantidadDeGangsters() = 8
  method recuerdoTipico() {
    return "LlaveroDeTorreEifel"
  }
  method puedeLlegar() {
    return alambiqueVeloz.tieneCombustible()
  }
}

object lasVegas {
  method cantidadDeGangsters() = 10
  var ciudadHomenajeada = 0

  method recuerdoTipico() = ciudadHomenajeada.recuerdoTipico()
  method homenajeA(ciudad) {
    ciudadHomenajeada = ciudad
  }
  method puedeLlegar() {
    return ciudadHomenajeada.puedeLlegar()
  }
 }

object buenosAires {
  method cantidadDeGangsters() = 15
  var presidenteEsBueno = true

  method cambioDePresidente() {
    presidenteEsBueno = not presidenteEsBueno
  }
  method recuerdoTipico() {
    return
     if (presidenteEsBueno) {
      "mate con yerba"
    }
    else "mate sin yerba"
  }
}

object bagdad {
  method cantidadDeGangsters() = 20
  var recuerdoTipico = "armas"

  method CambiarRecuerdo(recuerdoNuevo) {
    recuerdoTipico = recuerdoNuevo
  }
  method recuerdoTipico() = recuerdoTipico
  method puedeLlegar() = true
}