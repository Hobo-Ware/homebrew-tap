cask "kelp" do
  version "0.1.2"
  sha256 "3696a8e2dc66acd9319498f89ad060952b96dde8cd9e8fdbba2ddad31ac53898"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.1.2/kelp-0.1.2-universal.app.zip"
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
