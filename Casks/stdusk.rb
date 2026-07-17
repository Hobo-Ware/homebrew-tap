cask "stdusk" do
  version "0.1.3"
  sha256 "307b3610a92427111ed2e0913d84d802d6e0c6212a778dd6849d8f661675bd9a"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v0.1.3/stdusk-0.1.3-universal.app.zip"
  name "stdusk"
  desc "Native Rust quake terminal with a real GUI tab bar and ambient AI-CLI awareness"
  homepage "https://github.com/Hobo-Ware/stdusk"

  app "stdusk.app"
  binary "#{appdir}/stdusk.app/Contents/MacOS/stdusk"

  postflight do
    # Ad-hoc signed, not notarized: strip quarantine so Gatekeeper doesn't hard-block the
    # GUI launch. Proper fix is Developer ID signing + notarization.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/stdusk.app"]
  end

  zap trash: "~/.config/stdusk"
end
