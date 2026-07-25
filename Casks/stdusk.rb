cask "stdusk" do
  version "1.4.8"
  sha256 "f8f4d881d1fe8f7fc7cae6b3d104450464877431e7c3bcf564e6206a259f5a2f"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v1.4.8/stdusk-1.4.8-universal.app.zip"
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
