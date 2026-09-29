cask "kelp" do
  version "0.8.6"
  sha256 "0ef046b4101cf2fd1c4ffa26b0f7749cb884a118eeaa5313db4190a2ff3a354e"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.8.6/kelp-0.8.6-universal.app.zip"
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
