cask "stdusk" do
  version "0.1.6"
  sha256 "88d3f4dccc71eefa3f5d416ecc33775b9f650c9369af3cf64770d38bab648605"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v0.1.6/stdusk-0.1.6-universal.app.zip"
  name "stdusk"
  desc "Native Rust quake terminal with a real GUI tab bar and ambient AI-CLI awareness"
  homepage "https://github.com/Hobo-Ware/stdusk"

  app "stdusk.app"
  binary "#{appdir}/stdusk.app/Contents/MacOS/stdusk"

  postflight do
    # Ad-hoc signed, not notarized: strip quarantine so Gatekeeper doesn't hard-block the
    # GUI launch. Proper fix is Developer ID signing + notarization.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/stdusk.app"]
  end

  zap trash: "~/.config/stdusk"
end
