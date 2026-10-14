cask "kelp" do
  version "0.8.21"
  sha256 "2a9b8ca42882b42f1d88189598740f1a1a81dc6c73a99f7e1c452661a93e77ea"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.8.21/kelp-0.8.21-universal.app.zip"
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
