cask "stdusk" do
  version "0.1.0"
  sha256 "8ce5efa57a6f7db22efd923776732c92cc4102b42391930c42025f4f12cbb79d"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v#{version}/stdusk-#{version}-universal.app.zip"
  name "stdusk"
  desc "Native Rust quake terminal with a real GUI tab bar and ambient AI-CLI awareness"
  homepage "https://github.com/Hobo-Ware/stdusk"

  app "stdusk.app"
  binary "#{appdir}/stdusk.app/Contents/MacOS/stdusk"

  zap trash: "~/.config/stdusk"
end
