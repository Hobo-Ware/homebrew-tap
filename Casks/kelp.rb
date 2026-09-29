cask "kelp" do
  version "0.8.9"
  sha256 "0a4ed71e7ae1165a281eb006631c06f1800ec332e67bc1dab26d73f23ba1c716"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.8.9/kelp-0.8.9-universal.app.zip"
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
