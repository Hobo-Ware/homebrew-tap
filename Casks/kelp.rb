cask "kelp" do
  version "0.8.5"
  sha256 "736b662d206523e679f585796b9eab153f2fa5d56e42cf989ed82ff47e113d34"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.8.5/kelp-0.8.5-universal.app.zip"
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
