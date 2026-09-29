cask "kelp" do
  version "0.8.13"
  sha256 "0b62e4a0d76d7704c218582ac8b1c1420dc591e4427d7c8dbe344cce53c2fe5c"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.8.13/kelp-0.8.13-universal.app.zip"
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
