cask "stdusk" do
  version "1.0.4"
  sha256 "1dc2961c065e0dde2b18f087e9ccd7a0a6a2a1b0f1ea2d819e8ba157fef0febb"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v1.0.4/stdusk-1.0.4-universal.app.zip"
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
