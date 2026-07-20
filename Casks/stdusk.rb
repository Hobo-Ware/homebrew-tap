cask "stdusk" do
  version "1.0.6"
  sha256 "b8d9648f2c3fb681f2ff27d254c9865dc1b1d60562e9de25dfb3d56e9c65be4c"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v1.0.6/stdusk-1.0.6-universal.app.zip"
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
