cask "stdusk" do
  version "1.6.3"
  sha256 "8a04d814a9530f21edeccbe45232bc3dbec67c8ff31d07949c173a1c9430622b"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v1.6.3/stdusk-1.6.3-universal.app.zip"
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
