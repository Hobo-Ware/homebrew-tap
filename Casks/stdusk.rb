cask "stdusk" do
  version "0.1.5"
  sha256 "762a865a7a38240b8e34fdd42ec047eec4b17f08a62c221a146a7ac0f17ea6c8"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v0.1.5/stdusk-0.1.5-universal.app.zip"
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
