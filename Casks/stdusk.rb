cask "stdusk" do
  version "1.7.1"
  sha256 "5cf3e6aca905f3bccf6aa7b9a180741d5e747ed85016d127fc6fcbdf665ddc52"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v1.7.1/stdusk-1.7.1-universal.app.zip"
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
