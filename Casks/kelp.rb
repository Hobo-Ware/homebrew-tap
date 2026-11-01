cask "kelp" do
  version "0.8.23"
  sha256 "afcd766a04a91cd959dd74ae7ed14cc5f2dee27b771002892457c0de0a312f33"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.8.23/kelp-0.8.23-universal.app.zip"
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
