cask "tidewatch" do
  version "0.1.29"
  sha256 "f19745c0774f89a56ac538187ec1c3bbd292853931615043694c034da49bd101"

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
