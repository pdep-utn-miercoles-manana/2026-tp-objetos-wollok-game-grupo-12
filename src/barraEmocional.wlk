import wollok.game.*
import messi.*
import recolectables.*
import gestionDeNiveles.*
import estados.*
object barraEmocional {
    var porcentaje = 0.5
    const position = game.at(7, 8) 

    method position() = position
    
    method nivelDePorcentaje() = porcentaje * 100

    method modificarPorcentaje(cantidad) {
        porcentaje = 0.max(1.min(porcentaje + cantidad))
    }

    method estaEnMaximo() = porcentaje >= 1.0
    method estaEnMinimo() = porcentaje <= 0.0

    method image() = "barraEmocional.png"

    method chequearEstado() {
        if (self.nivelDePorcentaje() == 0.0) { messi.perderJuego() }
        else if (self.nivelDePorcentaje() >= 0.65) { messi.cambiarEstado(gloria) }
        else if (self.nivelDePorcentaje() <= 0.35) { messi.cambiarEstado(crisis) }
        else { messi.cambiarEstado(estable) }
    }
}