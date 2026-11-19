cask "browser" do
  version "0.1.8"
  sha256 "d848c2846a61bdc8d63adeb58309de79d1365ed2ecd9940c3c68ffd35b000865"

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
