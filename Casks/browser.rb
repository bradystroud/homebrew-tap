cask "browser" do
  version "0.1.4"
  sha256 "50491f5b46dd59c99d54e27b9730261c30fa61b078289f031eb4eed7f9dcfaa1"

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
