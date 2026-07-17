class Stdusk < Formula
  desc "Native Rust quake terminal with a real GUI tab bar and ambient AI-CLI awareness"
  homepage "https://github.com/Hobo-Ware/stdusk"
  version "0.1.0"
  license "MIT"
  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v0.1.0/stdusk-0.1.0-universal.app.zip"
  sha256 "8ce5efa57a6f7db22efd923776732c92cc4102b42391930c42025f4f12cbb79d"

  def install
    prefix.install "stdusk.app"
    bin.install_symlink prefix/"stdusk.app/Contents/MacOS/stdusk"
  end

  test do
    assert_match "stdusk #{version}", shell_output("#{bin}/stdusk --version")
  end
end
