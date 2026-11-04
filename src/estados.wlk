import recolectables.*
import messi.*

class EstadoEmocional {
    const property tiempoCooldown
    const property velocidadCaida
    const property itemsPosibles
}

object normal {
    method afectarImagen() { messi.cambiarImagen("messi.png") }

    method crisis() = new EstadoEmocional(
        tiempoCooldown = 300, 
        velocidadCaida = 300, 
        itemsPosibles = [ gol, finalPerdida, critica ]
    )
    
    method estable() = new EstadoEmocional(
        tiempoCooldown = 120, 
        velocidadCaida = 500, 
        itemsPosibles = [ copaAmerica, gol, critica ]
    )

    method gloria() = new EstadoEmocional(
        tiempoCooldown = 50, 
        velocidadCaida = 800, 
        itemsPosibles = [ copaMundial, gol, camisetaDiez, critica ]
    )
}

object dificil {
    method afectarImagen() { messi.cambiarImagen("messi_dificil.png") }

    method crisis() = new EstadoEmocional(
        tiempoCooldown = 400,
        velocidadCaida = 150,
        itemsPosibles = [ sancorSeguros, sancorSeguros, finalPerdida, critica, gol, camisetaDiez] 
    )
    
    method estable() = new EstadoEmocional(
        tiempoCooldown = 200, 
        velocidadCaida = 300, 
        itemsPosibles = [ tarjetaRoja, critica, finalPerdida, gol ] 
    )
    
    method gloria() = new EstadoEmocional(
        tiempoCooldown = 100, 
        velocidadCaida = 500, 
        itemsPosibles = [ copaAmerica, gol, tarjetaRoja, critica, finalPerdida ] 
    )
}