cask "tidewatch" do
  version "0.1.68"
  sha256 "f647979189989d1ba809d1f04234da4819041b3ba974bafdb4942980bbc46436"

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
