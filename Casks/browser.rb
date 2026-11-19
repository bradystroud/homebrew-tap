cask "browser" do
  version "0.1.12"
  sha256 "f71647831025d1b5132cfe0cba9175967ee9cd176a7a77ad3c6025e3b19b3ae2"

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
