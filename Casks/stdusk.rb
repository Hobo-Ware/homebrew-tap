cask "stdusk" do
  version "1.6.7"
  sha256 "bbde05e96c83541ff49f81c74c1795fdadbd94268479c611b2a832586a5b0024"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v1.6.7/stdusk-1.6.7-universal.app.zip"
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
