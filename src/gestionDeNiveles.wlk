import wollok.game.*
import messi.*

object gestionDeNivel {
    method iniciarCaidaDeRecolectables() {
        game.onTick(1500, "generadorObjetos", { self.generarObjeto() })
    }

    method generarObjeto() {
        const opciones = messi.estadoEmocional().itemsPosibles()
        const nuevoItem = opciones.anyOne()

        const xAleatoria = (0 .. game.width() - 1).anyOne()
        nuevoItem.position(game.at(xAleatoria, game.height() - 1))

        game.addVisual(nuevoItem)
        nuevoItem.iniciarCaida(messi.estadoEmocional().velocidadCaida())
    }
}