import wollok.game.*
import messi.*
import barraEmocional.*
import gestionDeNiveles.*
import estados.* 


object indicadorDificultad {
    var texto = "Dificultad: NORMAL (Usa las teclas 1 o 2 para cambiar)"
    
    
    method position() = game.at(4, 1) 
    method text() = texto
    
    method cambiarTexto(nuevoTexto) { texto = nuevoTexto }
}

object pantallaMenu {
    method position() = game.at(0, 0)
    method image() = "menu.gif"

    method mostrar() {
        game.addVisual(self)
        game.addVisual(indicadorDificultad)
        
        keyboard.num1().onPressDo({ 
            gestionDeNivel.cambiarDificultad(normal)
            indicadorDificultad.cambiarTexto("Dificultad seleccionada: NORMAL")
        })
        keyboard.num2().onPressDo({ 
            gestionDeNivel.cambiarDificultad(dificil)
            indicadorDificultad.cambiarTexto("Dificultad seleccionada: DIFÍCIL")
        })

        keyboard.enter().onPressDo({self.iniciarJuego()})
    }

    method iniciarJuego() {
        game.removeVisual(self)
        game.removeVisual(indicadorDificultad)

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
