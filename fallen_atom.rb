class FallenAtom < Formula
  desc "Minimalistic puzzle game with single-file design"
  homepage "https://github.com/ktilted/fallen_atom"
  url "https://github.com/KTilted/fallen_atom/releases/download/1.0.0/fallen_atom-1.0.0.tar.gz"
  sha256 "456a23eaebafd4f4bb94cee13624f023b3cb8b848a4f391fe67528b63fb184a8"

  depends_on "python@3.11"
  depends_on "sdl2"
  depends_on "sdl2_image"
  depends_on "sdl2_mixer"
  depends_on "sdl2_ttf"
  depends_on "ffmpeg"
  depends_on "libpng"
  depends_on "jpeg"

  def install
    # Устанавливаем зависимости через pip
    system "python3.11", "-m", "pip", "install", "pygame==2.5.2", "numpy", "pydub"
    
    # Устанавливаем основной скрипт
    bin.install "fallen_atom.py" => "fallen_atom"
    
    # Делаем скрипт исполняемым
    chmod 0755, bin/"fallen_atom"
  end

  test do
    assert_match "fallen_atom", shell_output("#{bin}/fallen_atom --version", 1)
  end
end