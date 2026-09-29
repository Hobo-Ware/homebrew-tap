cask "kelp" do
  version "0.8.12"
  sha256 "fe2cdf878c674ad4b4f8336541e4ac5148cde85b06893071e63a2022b902f6e1"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.8.12/kelp-0.8.12-universal.app.zip"
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
