cask "kelp" do
  version "0.1.0"
  sha256 "d04c9638ac0f97940b38f67b7b4fd9ce4481f87508c6b7477a59ef0feeb5aef9"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.1.0/kelp-0.1.0-universal.app.zip"
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
