cask "not-boring-notch" do
  version "1.1.0"
  sha256 "b01aec566cad30c4756fed3280798379d715e28c4772f1f3b0935042f3e6a1ae"

  url "https://github.com/AllenReder/not-boring-notch/releases/download/v#{version}/Not-Boring-Notch-v#{version}.dmg",
      verified: "github.com/AllenReder/not-boring-notch/"
  name "Not Boring Notch"
  desc "Notch companion with Liquid Glass, media controls, calendar and a file shelf"
  homepage "https://github.com/AllenReder/not-boring-notch"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Not Boring Notch.app"

  caveats <<~EOS
    Not Boring Notch is ad-hoc signed and not notarized, so macOS Gatekeeper
    blocks the first launch after a normal install. Either install without the
    quarantine flag:

      brew install --cask --no-quarantine AllenReder/tap/not-boring-notch

    or clear it afterwards:

      xattr -dr com.apple.quarantine "/Applications/Not Boring Notch.app"
  EOS

  zap trash: [
    "~/Library/Application Scripts/com.allenreder.notboringnotch",
    "~/Library/Containers/com.allenreder.notboringnotch",
    "~/Library/Preferences/com.allenreder.notboringnotch.plist",
  ]
end
