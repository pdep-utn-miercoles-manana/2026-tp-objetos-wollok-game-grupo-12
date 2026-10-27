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

class Critica inherits Recolectable {
    const impacto 
    
    override method image() = "critica.png"

    override method aplicarEfecto() {
        barraEmocional.modificarPorcentaje(impacto)
    }
}

class Gol inherits Recolectable {
    const impacto 
    override method image() = "gol.png" 
    
    override method aplicarEfecto() {
        barraEmocional.modificarPorcentaje(impacto)
    }
}