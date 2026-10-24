import wollok.game.*

object barraEmocional {
    var porcentaje = 0.5
    const posicion = game.at(8, 9)

    method posicion() = posicion
    method image() = "barraEmocional.png"
    method nivelDePorcentaje() = porcentaje * 100

    method modificarPorcentaje(cantidad) {
        porcentaje = 0.max(1.min(porcentaje + cantidad))
    }

    //ver más adelante
    method modificarDificultad(recolectable){
        
    }
}