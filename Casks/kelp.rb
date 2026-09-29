cask "kelp" do
  version "0.8.4"
  sha256 "0a9087f5ff0623b4e190ba1ff053cde72e33abb3db549a61cf8c8752a659a9f7"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.8.4/kelp-0.8.4-universal.app.zip"
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
