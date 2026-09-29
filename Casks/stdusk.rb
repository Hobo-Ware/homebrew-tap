cask "stdusk" do
  version "1.7.5"
  sha256 "c0c5a4cd2128263d2edcd7163dbaedba89d3b0e612b7c7e9d486a87afa38ad1b"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v1.7.5/stdusk-1.7.5-universal.app.zip"
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
