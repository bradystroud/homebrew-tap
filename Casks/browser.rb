cask "browser" do
  version "0.1.17"
  sha256 "f72b0a12ca73fe24e4a9725b7685f48546616429517d2e5326e4a05fb9688c8d"

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
