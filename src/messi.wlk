import wollok.game.*
import barraEmocional.*
import recolectables.*
import gestionDeNiveles.*
import estados.*
import musica.*
import pantallas.*
object messi {
    var position = game.at(8, 0)
    var estadoEmocional = estable
    var enCooldown = false

    method position() = position

    method image() = "messi.png"

    method estadoEmocional() = estadoEmocional

    method cambiarEstado(nuevoEstado) {
        estadoEmocional = nuevoEstado
    }

    method moverseALaIzquierda() {
        if (not enCooldown) {
            const nuevaX = 0.max(position.x() - 1)
            position = game.at(nuevaX, position.y())
            self.iniciarCooldown()
        }
    }

    method moverseALaDerecha() {
        if (not enCooldown) { 
            const nuevaX = (game.width() - 1).min(position.x() + 1)
            position = game.at(nuevaX, position.y())
            self.iniciarCooldown()
        }
    }

    method iniciarCooldown() {
        enCooldown = true
        game.onTick(estadoEmocional.tiempoCooldown(), "cooldown", {
            enCooldown = false
            game.removeTickEvent("cooldown")
        })
    }

    method atraparRecolectable(recolectable){
        recolectable.esAtrapadoPor(self)
        
    }

    method perderJuego() {
        game.say(self, "Es Increible pero no se me DA!!!!")
        pantallaPerder.mostrar()
        reproductorMusical.reproducirDerrota()
    }
    method ganarJuego() {
        game.say(self, "!!!! Somos Campeones! del Mundo !!!! " )
        pantallaGanar.mostrar()
        reproductorMusical.reproducirVictoria()
    }

}