cask "stdusk" do
  version "1.5.1"
  sha256 "b17c64ddbc0915b55033a26cf5f90208d9fd30cfd1736a45036e0327859eed95"

  url "https://github.com/Hobo-Ware/stdusk/releases/download/stdusk-v1.5.1/stdusk-1.5.1-universal.app.zip"
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
