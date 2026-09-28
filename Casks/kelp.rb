cask "kelp" do
  version "0.3.0"
  sha256 "d993c6ff4dc91898e24f7176eec2c9fe96d8da0da92f876ad6cc025ac8f798be"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.3.0/kelp-0.3.0-universal.app.zip"
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
