cask "kelp" do
  version "0.8.11"
  sha256 "474ba67cbc56a31a21b922cdbe5bedefb93111be7c1da97a654a4af76c852682"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.8.11/kelp-0.8.11-universal.app.zip"
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
