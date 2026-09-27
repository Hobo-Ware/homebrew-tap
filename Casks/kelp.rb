cask "kelp" do
  version "0.1.1"
  sha256 "91af73e3056861afde6b8664fb0777c62786a5ca7e252d84920b5f006b400a79"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.1.1/kelp-0.1.1-universal.app.zip"
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
