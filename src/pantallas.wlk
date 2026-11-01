import wollok.game.*
import messi.*
import barraEmocional.*
import gestionDeNiveles.*

object pantallaMenu {
    method position() = game.at(0, 0)
    method image() = "menu.gif"

    method mostrar() {
        game.addVisual(self)
        keyboard.enter().onPressDo({self.iniciarJuego()})
    }

    method iniciarJuego() {
        game.removeVisual(self)

        game.addVisual(messi)
        game.addVisual(barraEmocional)

        keyboard.left().onPressDo({ messi.moverseALaIzquierda() })
        keyboard.right().onPressDo({ messi.moverseALaDerecha() })

        game.onCollideDo(messi, { objeto => messi.atraparRecolectable(objeto) })
        gestionDeNivel.iniciarCaidaDeRecolectables()
    }
}


object pantallaPerder {
    method position() = game.at(0, 0)
    method image() = "gameOver.png"

    method mostrar() {
        game.clear()
        game.addVisual(self)
    }
}

object pantallaGanar {
    method position() = game.at(0, 0)
    method image() = "ganar.png"

    method mostrar() {
        game.clear()
        game.addVisual(self)    
    }
}
