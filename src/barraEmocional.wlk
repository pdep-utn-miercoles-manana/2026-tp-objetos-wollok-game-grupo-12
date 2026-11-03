import wollok.game.*
import messi.*
import recolectables.*
import gestionDeNiveles.*
import estados.*
object barraEmocional {
    var porcentaje = 0.5
    const position = game.at(6, 8) 

    method position() = position
    
    method porcentaje() = porcentaje

    method modificarPorcentaje(cantidad) {
        porcentaje = 0.max(1.min(porcentaje + cantidad))
        self.chequearEstado()
    }

    method estaEnMaximo() = porcentaje >= 1.0
    method estaEnMinimo() = porcentaje <= 0.0

    method image() = "barraEmocional.png"

    method chequearEstado() {
        const dif = gestionDeNivel.dificultadActual()
        if (self.estaEnMinimo()) { messi.perderJuego() }
        else if (self.estaEnMaximo()) { messi.ganarJuego() }
        else if (self.porcentaje() >= 0.65) { messi.cambiarEstado(dif.gloria()) }
        else if (self.porcentaje() <= 0.35) { messi.cambiarEstado(dif.crisis()) }
        else { messi.cambiarEstado(dif.estable()) }
    }
}

object indicadorBarra {
    method image() = "indicador.png"
    
    method xActual() = 4 + (barraEmocional.porcentaje() * 4)
    method position() = game.at(self.xActual().truncate(0), 8)
}