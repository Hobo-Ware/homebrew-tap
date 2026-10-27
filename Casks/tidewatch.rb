cask "tidewatch" do
  version "0.1.38"
  sha256 "47c48ab22ea97bb5fd0f3a4934bae6b534dd5ae51155f0fb46f4455ae8406a8b"

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
