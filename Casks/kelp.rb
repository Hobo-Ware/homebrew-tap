cask "kelp" do
  version "0.6.0"
  sha256 "816f6224249cb6e0f3b7e6742065e58a7dab713889b02a09722153b9d9866d7c"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.6.0/kelp-0.6.0-universal.app.zip"
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
