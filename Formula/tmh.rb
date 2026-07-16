class Tmh < Formula
  desc "Turn natural language into reviewable terminal commands"
  homepage "https://github.com/AllenReder/tmh"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AllenReder/tmh/releases/download/v0.2.0/tmh_darwin_arm64.tar.gz"
      sha256 "368aa477136b9ae8082fd20a2bd603d646a06e9f83f10796568ec5944d7f30b2"
    else
      url "https://github.com/AllenReder/tmh/releases/download/v0.2.0/tmh_darwin_amd64.tar.gz"
      sha256 "04ef97a19b3abcea25fa3b037ed0a36cbb66be21c19289c46701638bbff9f8df"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AllenReder/tmh/releases/download/v0.2.0/tmh_linux_arm64.tar.gz"
      sha256 "11e9a4cec5700b8216162a8eb267e455738e81d224d51bed50fb58684069df3d"
    else
      url "https://github.com/AllenReder/tmh/releases/download/v0.2.0/tmh_linux_amd64.tar.gz"
      sha256 "dd2c6354acea15e914dc05a159a58f1853bbbd7d2b3fb25938f889216a34ded3"
    end
  end

  def install
    bin.install "tmh"
    pkgshare.install "LICENSE", "THIRD_PARTY_NOTICES.md", "README.md", "README.zh-CN.md"
  end

  def caveats
    <<~EOS
      To enable shell integration, add the matching line to your startup file:
        Zsh: eval "$(tmh shell init zsh)"
        Bash: eval "$(tmh shell init bash)"
        Fish: tmh shell init fish | source
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/tmh --version").strip
    assert_match "tmh", shell_output("#{bin}/tmh help")
  end
end
