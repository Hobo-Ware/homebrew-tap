cask "kelp" do
  version "0.8.14"
  sha256 "e58629ac005664fef81d6b207fc4f822d0f7a3c3c7b914a92354e4f2b2990fea"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.8.14/kelp-0.8.14-universal.app.zip"
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
