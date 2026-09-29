cask "kelp" do
  version "0.8.3"
  sha256 "55ed0f136abafb1d7f2600345e173aff8155b2e3dbfda382ef3529464a17b222"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.8.3/kelp-0.8.3-universal.app.zip"
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
