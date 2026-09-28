cask "kelp" do
  version "0.5.1"
  sha256 "ea0b54a8441563096b631490359b3c68d37b339811dc2f2c75938f5ef8550860"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.5.1/kelp-0.5.1-universal.app.zip"
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
