cask "kelp" do
  version "0.3.1"
  sha256 "c85f456aca3c9471257bbc18e72625d0fccffbca4c129ce1e53260d70d848439"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.3.1/kelp-0.3.1-universal.app.zip"
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
