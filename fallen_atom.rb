class FallenAtom < Formula
  desc "Minimalistic puzzle game"
  homepage "https://github.com/ktilted/fallen_atom"
  url "https://github.com/ktilted/fallen_atom/releases/download/1.0.0/fallen_atom-1.0.0.tar.gz"
  sha256 "456a23eaebafd4f4bb94cee13624f023b3cb8b848a4f391fe67528b63fb184a8"

  depends_on "python"
  depends_on "sdl2"
  depends_on "sdl2_image"
  depends_on "sdl2_mixer"
  depends_on "sdl2_ttf"
  depends_on "ffmpeg"

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python3.11/site-packages"
    system "python3", "-m", "pip", "install", "--prefix=#{libexec}", "pygame", "numpy", "pydub"
    
    bin.install "fallen_atom.py"
    chmod 0755, bin/"fallen_atom.py"
    bin.install_symlink bin/"fallen_atom.py" => "fallen_atom"
  end

  test do
    system "#{bin}/fallen_atom", "--version"
  end
end