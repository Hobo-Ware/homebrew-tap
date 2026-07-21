cask "stdusk" do
  version "1.4.5"
  sha256 "1d0929b3713a1c26145a4b1e26975bd269b3ca0dc8d0e532f1697dffaeedf66c"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v1.4.5/stdusk-1.4.5-universal.app.zip"
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
