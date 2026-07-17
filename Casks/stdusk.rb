cask "stdusk" do
  version "0.1.2"
  sha256 "d33e530dae734d36b4436ced637eaeaf50dde58015a330b55a8e1966cf0e7253"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v0.1.2/stdusk-0.1.2-universal.app.zip"
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
