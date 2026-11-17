cask "opencraft" do
  version "0.5.0"
  sha256 "0271e028806757a7d5d369d396e8bb49d2fbe5f3e7544f39f5fd4e61a3d27c42"

  url "https://github.com/shantanugoel/OpenCraft/releases/download/v#{version}/OpenCraft-#{version}-arm64.dmg"
  name "OpenCraft"
  desc "Operates the VSD StreamDock N4 Pro controller"
  homepage "https://github.com/shantanugoel/OpenCraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "OpenCraft.app"
  # The command-line client "opencraft ctl" (decision 0040, section 4). The
  # link has the name of the executable: opencraft.
  binary "#{appdir}/OpenCraft.app/Contents/MacOS/opencraft"

  uninstall quit: "com.shantanugoel.opencraft"

  zap launchctl: "opencraft.login",
      trash:     [
        "~/Library/Application Support/OpenCraft",
        "~/Library/LaunchAgents/opencraft.login.plist",
        "~/Library/Preferences/com.shantanugoel.opencraft.plist",
      ]

  caveats <<~EOS
    Quit the vendor software VSD Craft before you start OpenCraft. Two
    applications must not operate one device at the same time.

    The actions "Send a hotkey", "Type text", and "Media key" need the
    Accessibility permission of macOS. OpenCraft shows a button to give it.
  EOS
end
