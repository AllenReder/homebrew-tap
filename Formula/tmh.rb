class Tmh < Formula
  desc "Turn natural language into reviewable terminal commands"
  homepage "https://github.com/AllenReder/tmh"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AllenReder/tmh/releases/download/v0.2.1/tmh_darwin_arm64.tar.gz"
      sha256 "70918511fb68a884bd0132026f40dcad6a4cce426fb1441ca242a39f9a93b90b"
    else
      url "https://github.com/AllenReder/tmh/releases/download/v0.2.1/tmh_darwin_amd64.tar.gz"
      sha256 "3558f242eb0d9f83c98ff2e374d302ca7d0519a61bc0a0589869c1995f1a4dee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AllenReder/tmh/releases/download/v0.2.1/tmh_linux_arm64.tar.gz"
      sha256 "356c228c04fa60975dc3d9e176750fc11830ae33874404228a155ce86d5eb345"
    else
      url "https://github.com/AllenReder/tmh/releases/download/v0.2.1/tmh_linux_amd64.tar.gz"
      sha256 "579c7ff5154786ddc6b3ee75cf0d3cf14fad46da7cb4d7fff097bc61ccde54d1"
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
