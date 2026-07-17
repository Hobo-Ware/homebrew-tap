cask "stdusk" do
  version "0.1.8"
  sha256 "db73c744b38838bda67f50157dd89f9d87ecf4414d6dd6dd07e3ff187951c81d"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v0.1.8/stdusk-0.1.8-universal.app.zip"
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
