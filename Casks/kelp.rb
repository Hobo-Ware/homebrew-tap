cask "kelp" do
  version "0.4.0"
  sha256 "57eb43dc2f3a2db8165faa96c963079377170f08cc804e20449a01ec2bc74398"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.4.0/kelp-0.4.0-universal.app.zip"
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
