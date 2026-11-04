import wollok.game.*
import barraEmocional.*

class Recolectable {
    var position = game.origin()
    const property image

    method position() = position
    method position(nuevaPosicion) { position = nuevaPosicion }
    
    
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
        self.reproducirSonido()
        self.aplicarEfecto()
        self.desaparecerSeguro()
    }

    method desaparecerSeguro() {
        if (game.hasVisual(self)) {
            game.removeVisual(self)
            game.removeTickEvent("caer_" + self.identity().toString())
        }
    }

    method reproducirSonido() {
        game.sound(self.sonido()).play()
    }

    method sonido()

    method aplicarEfecto()
}

class RecolectableMalo inherits Recolectable {
    const impacto 
    
    override method sonido() = "sonidoMalo.mp3"

    override method aplicarEfecto() {
        barraEmocional.modificarPorcentaje(impacto)
    }
}

class RecolectableBueno inherits Recolectable {
    const impacto 

    override method sonido() = "sonidoBueno.mp3"
    
    override method aplicarEfecto() {
        barraEmocional.modificarPorcentaje(impacto)
    }
}

const sancorSeguros = { => new RecolectableMalo(impacto = -1.0, image = "sancorSeguros.png") }
const tarjetaRoja = { => new RecolectableMalo(impacto = -0.05, image = "tarjetaRoja.png") }
const finalPerdida = { => new RecolectableMalo(impacto = -0.25, image = "finalPerdida.png") }
const gol = { => new RecolectableBueno(impacto = 0.05, image = "gol.png") }
const critica = { => new RecolectableMalo(impacto = -0.1, image = "critica.png") }
const copaMundial = { => new RecolectableBueno(impacto = 0.25, image = "copaMundial.png") }
const copaAmerica = { => new RecolectableBueno(impacto = 0.1, image = "copaAmerica.png") }
const camisetaDiez = { => new RecolectableBueno(impacto = 0.07, image = "camisetaDiez.png") }
