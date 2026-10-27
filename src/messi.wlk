import wollok.game.*
import barraEmocional.*
import recolectables.*
import gestionDeNiveles.*
import estados.*
object messi {
    var position = game.at(8, 0)
    var estadoEmocional = estable
    var enCooldown = false

    method position() = position

    method image() = "messi.png"

    method estadoEmocional() = estadoEmocional

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
        self.chequearEstado()
        
    }

    method chequearEstado() {
        if (barraEmocional.nivelDePorcentaje() == 100) { self.perderJuego() }
        else if (barraEmocional.nivelDePorcentaje() > 80) { estadoEmocional = gloria }
        else if (barraEmocional.nivelDePorcentaje() < 20) { estadoEmocional = crisis }
        else { estadoEmocional = estable }
    }

    method perderJuego() {
        game.clear() 
        game.addVisual(self)
        game.say(self, "¡Perdí!")
    }

}