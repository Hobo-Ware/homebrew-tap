cask "stdusk" do
  version "1.0.7"
  sha256 "1d717e15ea9a95489d8fd89c69e023bdf2be8f3b91dd8b1acfa535b26c229d6b"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v1.0.7/stdusk-1.0.7-universal.app.zip"
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
