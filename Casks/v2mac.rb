cask "v2mac" do
  version "1.2.0"
  sha256 "0f5d39440068dadc4e6a5fe956285fb1ba125da190f4e6df474ee84772c5bfcd"

  url "https://github.com/LordVersA/v2mac/releases/download/v#{version}/V2Mac-#{version}.dmg"
  name "V2Mac"
  desc "Menu bar client for Xray-core"
  homepage "https://github.com/LordVersA/v2mac"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "V2Mac.app"
  binary "V2Mac.app/Contents/Helpers/v2mac"

  # The app is ad-hoc signed and not notarized, so Gatekeeper would block the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/V2Mac.app"]
  end

  uninstall quit: "io.github.lordversa.v2mac"

  zap trash: [
    "~/Library/Application Support/v2mac",
    "~/Library/Preferences/io.github.lordversa.v2mac.plist",
  ]
end
