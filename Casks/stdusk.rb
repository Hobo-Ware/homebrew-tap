cask "stdusk" do
  version "1.0.1"
  sha256 "5d9f9e2d24bee0765eacf45bc5df2abe5dfa1e47f1eca287aded1ad6329055ba"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v1.0.1/stdusk-1.0.1-universal.app.zip"
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
