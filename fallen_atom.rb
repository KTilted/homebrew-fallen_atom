class FallenAtom < Formula
  desc "Minimalistic puzzle game"
  homepage "https://github.com/ktilted/fallen_atom"
  url "https://github.com/ktilted/fallen_atom/archive/v1.0.0.tar.gz"
  sha256 "4130045f1b8982ba051c711724e26ef3bfcf6d54134b625ee3bcfa8080b6f318"

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