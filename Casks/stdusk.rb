cask "stdusk" do
  version "0.3.2"
  sha256 "08016b3f9a7d3fb487c42b2febac87cf3a6fb8f4923fb876b673d68e9b68f55b"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v0.3.2/stdusk-0.3.2-universal.app.zip"
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
