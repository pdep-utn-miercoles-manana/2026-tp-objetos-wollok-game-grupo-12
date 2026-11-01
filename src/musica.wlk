object reproductorMusical {
    const musicaDeFondo = game.sound("musicaFondo.mp3")

    method iniciarMusicaFondo() {
        musicaDeFondo.shouldLoop(true)
        musicaDeFondo.volume(0.3)
        game.schedule(500, { musicaDeFondo.play() })
    }

    method detenerMusicaFondo() {
        musicaDeFondo.stop()
    }

    method reproducirVictoria() {
        self.detenerMusicaFondo()

        game.sound("musicaVictoria.mp3").play()
    }

    method reproducirDerrota() {
        self.detenerMusicaFondo()

        game.sound("musicaDerrota.mp3").play()
    }
}