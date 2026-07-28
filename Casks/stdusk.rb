cask "stdusk" do
  version "1.4.9"
  sha256 "f36896ce3500a9c89b4325da78f0250775308a63464670321ade29274e14a9bc"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v1.4.9/stdusk-1.4.9-universal.app.zip"
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
