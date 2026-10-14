cask "kelp" do
  version "0.8.20"
  sha256 "0d3c8225db1a2f0144991111b89e9a29a322a605c5045f70a9a394bbbb62106e"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.8.20/kelp-0.8.20-universal.app.zip"
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
