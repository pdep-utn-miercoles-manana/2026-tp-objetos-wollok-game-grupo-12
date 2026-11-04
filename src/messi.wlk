import wollok.game.*
import barraEmocional.*
import recolectables.*
import gestionDeNiveles.*
import estados.*
import musica.*
import pantallas.*
object messi {
    var position = game.at(8, 0)
    var estadoEmocional = normal.estable()
    var enCooldown = false
    var imagenActual = "messi.png"

    method position() = position

    method image() = imagenActual

    method cambiarImagen(nuevaImagen) { imagenActual = nuevaImagen }

    method estadoEmocional() = estadoEmocional

    method cambiarEstado(nuevoEstado) {
        estadoEmocional = nuevoEstado
    }

    method reiniciar() {
        position = game.at(8, 0)
        estadoEmocional = gestionDeNivel.dificultadActual().estable()
        enCooldown = false
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