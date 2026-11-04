object silencio {
    method played() = false
    method stop() {}
}

object reproductorMusical {
    var musicaDeFondo = silencio
    var musicaFinal = silencio

    method iniciarMusicaFondo() {
        const musica = game.sound("musicaFondo.mp3")
        musica.shouldLoop(true)
        musica.volume(0.3)
        musicaDeFondo = musica
        game.schedule(500, { musica.play() })
    }

    method detenerMusicaFondo() {
        self.detener(musicaDeFondo)
    }

    method detener(sonido) {
        if (sonido.played()) { sonido.stop() }
    }

    method reproducirVictoria() {
        self.reproducirFinal("musicaVictoria.mp3")
    }

    method reproducirDerrota() {
        self.reproducirFinal("musicaDerrota.mp3")
    }

    method reproducirFinal(archivo) {
        self.detenerMusicaFondo()
        musicaFinal = game.sound(archivo)
        musicaFinal.play()
    }

    method reiniciar() {
        self.detener(musicaFinal)
        self.detenerMusicaFondo()
        self.iniciarMusicaFondo()
    }
}
