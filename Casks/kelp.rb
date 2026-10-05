cask "kelp" do
  version "0.8.16"
  sha256 "75f7cb3de17008571ffec61dd25eea06cfaa265326ee77b89dbd2c69bf33dc8d"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.8.16/kelp-0.8.16-universal.app.zip"
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
