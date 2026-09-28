cask "kelp" do
  version "0.5.0"
  sha256 "8794251d166eb66f2cff2680ddfba4fadcf81011150618fa5c3d0053410db6b8"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.5.0/kelp-0.5.0-universal.app.zip"
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
