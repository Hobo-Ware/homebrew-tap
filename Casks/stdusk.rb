cask "stdusk" do
  version "1.6.2"
  sha256 "18daf1d3cc0d91a7b67aed9b4d8efb6f96d6760360585a5e13f9d13c67581e97"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v1.6.2/stdusk-1.6.2-universal.app.zip"
  name "stdusk"
  desc "Native Rust quake terminal with a real GUI tab bar and ambient AI-CLI awareness"
  homepage "https://github.com/Hobo-Ware/stdusk"

  app "stdusk.app"
  binary "#{appdir}/stdusk.app/Contents/MacOS/stdusk"

  postflight do
    # Ad-hoc signed, not notarized: strip quarantine so Gatekeeper does not hard-block
    # the GUI launch. Signed releases omit this block (baked by the release workflow).
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/stdusk.app"]
  end

  zap trash: "~/.config/stdusk"
end
