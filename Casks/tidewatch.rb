cask "tidewatch" do
  version "0.1.1"
  sha256 "51472c174c98326d384f35430c55609e7a4d02db98011df76850e3d13dffe2aa"

  url "https://github.com/Hobo-Ware/tidewatch/releases/download/v#{version}/tidewatch-#{version}-universal.app.zip"
  name "Tidewatch"
  desc "Run AI coding agents in git worktrees, one repo at a time"
  homepage "https://github.com/Hobo-Ware/tidewatch"

  depends_on :macos

  app "Tidewatch.app"
  binary "#{appdir}/Tidewatch.app/Contents/MacOS/tidewatch"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Tidewatch.app"]
  end

  zap trash: [
    "~/.config/tidewatch",
    "~/.tidewatch",
  ]
end
