import wollok.game.*
import barraEmocional.*
import recolectables.*

object messi {
    var posicion = game.at(8, 0)
    var estadoEmocional = "estable"
    // Idea para avanzar constantemente mientras se tiene una flecha apretada
    var property direccion = null

    method image() = "messi.png"

    method estadoEmocional() = estadoEmocional

    // Idea para avanzar constantemente mientras se tiene una flecha apretada
    method avanzar() {
        if (direccion != null) {
            posicion = direccion.siguientePosicion(posicion)
        }
    }

    method moverIzquierda() {
        //const nuevaX = 0.max(posicion.x() - estadoEmocional.velocidad())
        //posicion = game.at(nuevaX, posicion.y())
    }

    method moverDerecha() {
        //const nuevaX = (game.width() - 1).min(posicion.x() + estadoEmocional.velocidad())
        //posicion = game.at(nuevaX, posicion.y())
    }
    
    method atraparRecolectable(recolectable){
        recolectable.esAtrapadoPor(self)
        self.chequearEstado()
        
    }

    method chequearEstado() {
        if (barraEmocional.nivelDePorcentaje() > 80) { estadoEmocional = "crisis" }
        else if (barraEmocional.nivelDePorcentaje() < 20) { estadoEmocional = "gloria" }
        else { estadoEmocional = "estable" }
    }

}
// Idea para avanzar constantemente mientras se tiene una flecha apretada

object derecha   { method siguientePosicion(pos) = pos.right(1) }
object izquierda { method siguientePosicion(pos) = pos.left(1) }