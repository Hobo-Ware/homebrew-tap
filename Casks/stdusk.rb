cask "stdusk" do
  version "0.1.9"
  sha256 "f426b278cc2b947bc982047404d1bc8b390551dc107d3d5c8ca5a8e5e6b2320f"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v0.1.9/stdusk-0.1.9-universal.app.zip"
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
