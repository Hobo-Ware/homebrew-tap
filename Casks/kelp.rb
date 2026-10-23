cask "kelp" do
  version "0.8.22"
  sha256 "5284b3a54460343998c9f1b89b01d981735ba8379b7c2b8a00142fa457df089c"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.8.22/kelp-0.8.22-universal.app.zip"
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
