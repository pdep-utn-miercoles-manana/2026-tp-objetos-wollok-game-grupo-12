import wollok.game.*
import messi.*
import recolectables.*
import gestionDeNiveles.*
import estados.*
object barraEmocional {
    var porcentaje = 0.5
    const position = game.at(7, 8) 

    method position() = position
    method image() = "barraEmocional.png"
    method nivelDePorcentaje() = porcentaje * 100

    method modificarPorcentaje(cantidad) {
        porcentaje = 0.max(1.min(porcentaje + cantidad))
    }

}
