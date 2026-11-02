import wollok.game.*
import messi.*
import estados.*

object gestionDeNivel {
    var dificultadActual = normal
    method dificultadActual() = dificultadActual
    method cambiarDificultad(nuevaDificultad) { dificultadActual = nuevaDificultad }
    
    method iniciarCaidaDeRecolectables() {
        game.onTick(1500, "generadorObjetos", { self.generarObjeto() })
    }

    method generarObjeto() {
        const generadorDeItem = messi.estadoEmocional().itemsPosibles().anyOne()
        const nuevoItem = generadorDeItem.apply()
        const xAleatoria = (0 .. game.width() - 1).anyOne()
        
        nuevoItem.position(game.at(xAleatoria, game.height() - 1))
        game.addVisual(nuevoItem)
        nuevoItem.iniciarCaida(messi.estadoEmocional().velocidadCaida())
    }
}