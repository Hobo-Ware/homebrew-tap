cask "stdusk" do
  version "1.8.0"
  sha256 "3849ecb4f7ae1ed82d152d9305f7c4c8a892676ad1c6a3d63fd8586a10c85ccd"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v1.8.0/stdusk-1.8.0-universal.app.zip"
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
