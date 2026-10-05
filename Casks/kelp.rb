cask "kelp" do
  version "0.8.18"
  sha256 "8a81966d7c40bb710d6da6c7c9955f2cad4c7b78433da79e3d71d6485e628022"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.8.18/kelp-0.8.18-universal.app.zip"
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
