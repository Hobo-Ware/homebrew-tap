cask "kelp" do
  version "0.8.7"
  sha256 "1c3db226f629aeb6f918d2c4bb6ca63d4e795fc1d4195a5c879872a099662a40"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.8.7/kelp-0.8.7-universal.app.zip"
  name "Kelp"
  desc "Fast, low-power git client with a beautiful commit graph"
  homepage "https://kelp.hoboware.dev"

  depends_on :macos

  app "Kelp.app"
  binary "#{appdir}/Kelp.app/Contents/MacOS/kelp"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Kelp.app"]
  end

  zap trash: [
    "~/Library/Application Support/kelp",
    "~/Library/Caches/kelp",
  ]
end
