cask "stdusk" do
  version "0.2.5"
  sha256 "e1a22514cdc9aec3af6e40eb4becf514bdeec945dc5e103f0bc358652a95dd0d"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v0.2.5/stdusk-0.2.5-universal.app.zip"
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
