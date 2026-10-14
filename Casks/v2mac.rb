cask "v2mac" do
  version "0.5.1"
  sha256 "b1091efcac72dda5b809f7e4a6e0ff0caca8db508770213ce80ac23d48ce4982"

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
