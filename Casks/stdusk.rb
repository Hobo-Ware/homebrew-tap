cask "stdusk" do
  version "0.1.4"
  sha256 "ea7e4b725f321e6180099d3d735b2047b5415964331eb0954bb1b0fb9e0933b3"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v0.1.4/stdusk-0.1.4-universal.app.zip"
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
