cask "kelp" do
  version "0.8.2"
  sha256 "fd959a5455a8f77234d5c02df5281613c08640ce90924344f32e801b73122c3e"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.8.2/kelp-0.8.2-universal.app.zip"
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
