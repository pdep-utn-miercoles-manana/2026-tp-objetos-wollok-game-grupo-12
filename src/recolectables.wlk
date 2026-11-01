import wollok.game.*
import barraEmocional.*

class Recolectable {
    var position = game.origin()

    method position() = position
    method position(nuevaPosicion) { position = nuevaPosicion }
    
    method image()

    method iniciarCaida(velocidad) {
        game.onTick(velocidad, "caer_" + self.identity().toString(), { self.caer() })
    }

    method caer() {
        position = position.down(1)
        if (position.y() < 0) {
            self.desaparecerSeguro()
        }
    }

    method esAtrapadoPor(personaje) {
        self.aplicarEfecto()
        self.desaparecerSeguro()
    }

    method desaparecerSeguro() {
        if (game.hasVisual(self)) {
            game.removeVisual(self)
            game.removeTickEvent("caer_" + self.identity().toString())
        }
    }

    method aplicarEfecto()
}

class RecolectableMalo inherits Recolectable {
    const impacto 
    
    override method image() = "critica.png"

    override method aplicarEfecto() {
        barraEmocional.modificarPorcentaje(impacto)
    }
}

class RecolectableBueno inherits Recolectable {
    const impacto 
    override method image() = "gol.png" 
    
    override method aplicarEfecto() {
        barraEmocional.modificarPorcentaje(impacto)
    }
}

//const sancorSeguros = new RecolectableMalo(impacto = -1.0)
//const penalErrado = new RecolectableMalo(impacto = -0.5)
//const finalPerdida = new RecolectableMalo(impacto = -0.4)
//const gol = new RecolectableBueno(impacto = 0.15)
//const critica = new RecolectableMalo(impacto = -0.15)
//const copaMundial = new RecolectableBueno(impacto = 0.4)
//const copaAmerica = new RecolectableBueno(impacto = 0.25)
//const hattrick = new RecolectableBueno(impacto = 0.25)