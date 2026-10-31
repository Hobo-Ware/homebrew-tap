cask "tidewatch" do
  version "0.1.48"
  sha256 "98bc9a30ddd5a6b9c5ea579388097f21755e4c2e9ca12d9e9ddc2c11cb7f96fd"

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
