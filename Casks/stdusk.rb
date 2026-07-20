cask "stdusk" do
  version "1.3.0"
  sha256 "5d057b9297a33be7ca8c534d2c7008d493b9b121c0eac66ea4918473a64e1f6f"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v1.3.0/stdusk-1.3.0-universal.app.zip"
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
