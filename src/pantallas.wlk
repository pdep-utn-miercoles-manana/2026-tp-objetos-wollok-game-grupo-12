import wollok.game.*
import messi.*
import barraEmocional.*
import gestionDeNiveles.*
import estados.* 


object indicadorDificultad {
    var texto = "Dificultad seleccionada: NORMAL (Usá 2 para cambiar, Enter para iniciar)"
    
    method position() = game.at(8, 0) 
    method text() = texto
    
    method cambiarTexto(nuevoTexto) { texto = nuevoTexto }
}

object pantallaMenu {
    var imagenActual = "pantallaMenu_normal.png"
    method position() = game.at(0, 0)
    method image() = imagenActual

    method mostrar() {
        game.addVisual(self)
        game.addVisual(indicadorDificultad)
        
        keyboard.num1().onPressDo{
            game.removeVisual(indicadorDificultad)
             
            gestionDeNivel.cambiarDificultad(normal)
            imagenActual = "pantallaMenu_normal.png"
            indicadorDificultad.cambiarTexto("Dificultad seleccionada: NORMAL (Usá 2 para cambiar, Enter para iniciar")
            
            game.addVisual(indicadorDificultad)
        }
        
        keyboard.num2().onPressDo{
            game.removeVisual(indicadorDificultad)

            gestionDeNivel.cambiarDificultad(dificil)
            imagenActual = "pantallaMenu_dificil.png"
            indicadorDificultad.cambiarTexto("Dificultad seleccionada: DIFÍCIL (Usá 1 para cambiar, Enter para iniciar)")
                
            game.addVisual(indicadorDificultad)
        }

        keyboard.enter().onPressDo{self.iniciarJuego()}
    }

    method iniciarJuego() {
        game.removeVisual(self)

        if(game.hasVisual(indicadorDificultad)) {
            game.removeVisual(indicadorDificultad)
        }

        game.addVisual(messi)
        game.addVisual(barraEmocional)
        game.addVisual(indicadorBarra)

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
