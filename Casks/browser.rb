cask "browser" do
  version "0.1.6"
  sha256 "ead6c3da04d017b53f154e0638503c7710bbdc4c70e06516d20092f32bf51a6a"

  url "https://github.com/bradystroud/browser/releases/download/v#{version}/Browser-#{version}.dmg"
  name "Browser"
  desc "Native browser with separate profiles and rule-based link routing"
  homepage "https://bradystroud.github.io/browser/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Browser.app"
  binary "#{appdir}/Browser.app/Contents/Resources/bin/browser"

  zap trash: [
    "~/Library/Application Support/Browser",
    "~/Library/Caches/Browser",
    "~/Library/Caches/dev.stroud.browser",
    "~/Library/HTTPStorages/dev.stroud.browser",
    "~/Library/HTTPStorages/dev.stroud.browser.binarycookies",
    "~/Library/Preferences/dev.stroud.browser.plist",
    "~/Library/WebKit/dev.stroud.browser",
  ]
end
