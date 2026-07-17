cask "stdusk" do
  version "0.1.7"
  sha256 "d7b2d2332941321bbc675381696eb36db6b8787ba1a7541e8c94615b0a3b0dbd"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v0.1.7/stdusk-0.1.7-universal.app.zip"
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
