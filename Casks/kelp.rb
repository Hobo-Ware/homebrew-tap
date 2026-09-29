cask "kelp" do
  version "0.8.10"
  sha256 "57819908a3d38245fc1fdcba69d0fdbc98b9ca0e12ac7da82dc6aa364fdaef28"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.8.10/kelp-0.8.10-universal.app.zip"
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
