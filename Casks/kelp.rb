cask "kelp" do
  version "0.2.0"
  sha256 "62f79bb2f82f31b356bf598d0282df49a339a53efd43a686ec66bf030395cf83"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.2.0/kelp-0.2.0-universal.app.zip"
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
