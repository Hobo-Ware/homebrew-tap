cask "kelp" do
  version "0.8.17"
  sha256 "c928514bb8db9a40286cc4bc0acec02039ee4fb54c2dcbf6c3727c3d78c4bd66"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.8.17/kelp-0.8.17-universal.app.zip"
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
