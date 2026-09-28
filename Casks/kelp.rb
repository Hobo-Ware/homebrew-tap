cask "kelp" do
  version "0.8.1"
  sha256 "5d4e72b6d32183fb921603ff805666c0781f3324fd693659ea3c8a228a8281ae"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.8.1/kelp-0.8.1-universal.app.zip"
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
