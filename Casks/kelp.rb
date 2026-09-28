cask "kelp" do
  version "0.8.0"
  sha256 "7f6841a3901aa1fa792e45a499c4527643b5141a39ba445a87b1887922f768b8"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.8.0/kelp-0.8.0-universal.app.zip"
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
