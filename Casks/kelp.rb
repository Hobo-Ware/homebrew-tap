cask "kelp" do
  version "0.8.8"
  sha256 "8b0debcedde51977a39aeedb208e875ca90e6a32080737f03a5913fae89cd200"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.8.8/kelp-0.8.8-universal.app.zip"
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
