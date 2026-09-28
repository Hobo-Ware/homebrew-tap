cask "kelp" do
  version "0.7.0"
  sha256 "cf4e527029fac205d6a72da1be16948ca3158c0d1486c33a43502eeb8fe7587a"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.7.0/kelp-0.7.0-universal.app.zip"
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
