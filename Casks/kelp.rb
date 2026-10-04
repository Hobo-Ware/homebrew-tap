cask "kelp" do
  version "0.8.15"
  sha256 "7492992db3de1a0a6882db0fd4456ef40a4cb92972fce7cb44374c8d123753c8"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.8.15/kelp-0.8.15-universal.app.zip"
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
