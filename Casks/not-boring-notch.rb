cask "not-boring-notch" do
  version "1.3.0"
  sha256 "f0fd1f1e2783334628f6b87a783d968384cec2e1f8bdbd389479d55a093151b5"

  url "https://github.com/AllenReder/not-boring-notch/releases/download/v#{version}/Not-Boring-Notch-v#{version}.dmg"
  name "Not Boring Notch"
  desc "Notch companion with Liquid Glass, media controls, calendar and a file shelf"
  homepage "https://github.com/AllenReder/not-boring-notch"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Not Boring Notch.app"

  zap trash: [
    "~/Library/Application Scripts/com.allenreder.notboringnotch",
    "~/Library/Containers/com.allenreder.notboringnotch",
    "~/Library/Preferences/com.allenreder.notboringnotch.plist",
  ]

  caveats <<~EOS
    Not Boring Notch is ad-hoc signed and not notarized, so macOS Gatekeeper
    blocks the first launch after a normal install. Either install without the
    quarantine flag:

      brew install --cask --no-quarantine AllenReder/tap/not-boring-notch

    or clear it afterwards:

      xattr -dr com.apple.quarantine "/Applications/Not Boring Notch.app"
  EOS
end
