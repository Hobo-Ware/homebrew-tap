cask "kelp" do
  version "0.8.19"
  sha256 "e4640a3fe15796af38c2db745a05edd847c27fc305e5da8f1e8bbfc59bd9ef96"

  url "https://github.com/Hobo-Ware/kelp/releases/download/v0.8.19/kelp-0.8.19-universal.app.zip"
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
