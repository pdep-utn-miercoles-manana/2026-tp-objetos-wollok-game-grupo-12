import recolectables.*
class EstadoEmocional{
    const property tiempoCooldown
    const property velocidadCaida
    const property itemsPosibles
}

const crisis = new EstadoEmocional (
    tiempoCooldown = 300, 
    velocidadCaida = 300, 
    itemsPosibles = [
        { => new Critica(impacto = -0.30)}, 
        { => new Critica(impacto = -0.20)}, 
        { => new Critica(impacto = -0.25)}, 
        { => new Gol(impacto = 0.15)}
    ]
)
const estable = new EstadoEmocional (
    tiempoCooldown = 120, 
    velocidadCaida = 500, 
    itemsPosibles = [
        { => new Gol(impacto = 0.15)}, 
        { => new Critica(impacto = -0.15)}, 
        { => new Critica(impacto = -0.25)}
    ]
)
const gloria = new EstadoEmocional (
    tiempoCooldown = 50, 
    velocidadCaida = 800, 
    itemsPosibles = [
        { => new Gol(impacto = 0.15)}, 
        { => new Gol(impacto = 0.15)}, 
        { => new Gol(impacto = 0.15)}, 
        { => new Critica(impacto = -0.10)}
    ]
)

/*object crisis { 
    method tiempoCooldown() = 300
    method velocidadCaida() = 300 
    method itemsPosibles() = [new Critica(impacto = -0.30), new Critica(impacto = -0.20), new Critica(impacto = -0.25), new Gol(impacto = 0.15)]
}

object estable  { 
    method tiempoCooldown() = 120
    method velocidadCaida() = 500 
    method itemsPosibles() = [new Gol(impacto = 0.15), new Critica(impacto = -0.15), new Critica(impacto = -0.25)]
}

object gloria {
    method tiempoCooldown() = 50  
    method velocidadCaida() = 800 
    method itemsPosibles() = [new Gol(impacto = 0.15), new Gol(impacto = 0.15), new Gol(impacto = 0.15), new Critica(impacto = -0.10)]
}*/