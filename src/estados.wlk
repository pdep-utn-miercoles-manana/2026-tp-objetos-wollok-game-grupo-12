import recolectables.*

class EstadoEmocional {
    const property tiempoCooldown
    const property velocidadCaida
    const property itemsPosibles
}

object normal {
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
        itemsPosibles = [ copaMundial, gol, hattrick, critica ]
    )
}

object dificil {
    method crisis() = new EstadoEmocional(
        tiempoCooldown = 400,
        velocidadCaida = 150,
        itemsPosibles = [ sancorSeguros, finalPerdida, finalPerdida, critica ] 
    )
    
    method estable() = new EstadoEmocional(
        tiempoCooldown = 200, 
        velocidadCaida = 300, 
        itemsPosibles = [ penalErrado, critica, finalPerdida, gol ] 
    )
    
    method gloria() = new EstadoEmocional(
        tiempoCooldown = 100, 
        velocidadCaida = 500, 
        itemsPosibles = [ copaAmerica, gol, penalErrado, critica ] 
    )
}