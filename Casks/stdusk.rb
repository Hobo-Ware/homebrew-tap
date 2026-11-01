cask "stdusk" do
  version "1.10.2"
  sha256 "6d543346a8c6bab8c7f0d21cf517a1746bf1b6ddd45362ffade2114be1409bf0"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v1.10.2/stdusk-1.10.2-universal.app.zip"
  name "stdusk"
  desc "Native Rust quake terminal with a real GUI tab bar and ambient AI-CLI awareness"
  homepage "https://github.com/Hobo-Ware/stdusk"

  depends_on :macos

  app "stdusk.app"
  binary "#{appdir}/stdusk.app/Contents/MacOS/stdusk"

  postflight_steps do
    # Ad-hoc signed, not notarized: strip quarantine so Gatekeeper does not hard-block
    # the GUI launch. Signed releases omit this block (baked by the release workflow).
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/stdusk.app"]
  end

  zap trash: "~/.config/stdusk"
end
