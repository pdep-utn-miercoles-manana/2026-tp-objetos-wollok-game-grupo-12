import wollok.game.*
import barraEmocional.*

class Recolectable {

    var posicion = game.origin()

    method position() = posicion
    method position(nuevaPosicion) { posicion = nuevaPosicion }
    
    method image()

    method iniciarCaida(velocidad) {
        game.onTick(velocidad, "caer_" + self.identity().toString(), { self.caer() })
    }

    method caer() {
        posicion = posicion.down(1)
        if (posicion.y() < 0) {
            game.removeVisual(self)
            game.removeTickEvent("caer_" + self.identity().toString())
        }
    }

    method esAtrapadoPor(personaje) {
        self.aplicarEfecto()
        game.removeVisual(self)
        game.removeTickEvent("caer_" + self.identity().toString())
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

//const critica = new RecolectableMalo(impacto = -0.5)