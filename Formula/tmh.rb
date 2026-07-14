class Tmh < Formula
  desc "Turn natural language into reviewable terminal commands"
  homepage "https://github.com/AllenReder/tmh"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AllenReder/tmh/releases/download/v0.1.2/tmh_darwin_arm64.tar.gz"
      sha256 "54da8a14a94a51338fe36a064fb893185acea995d844d01d9a2369ead84a8080"
    else
      url "https://github.com/AllenReder/tmh/releases/download/v0.1.2/tmh_darwin_amd64.tar.gz"
      sha256 "97d14d01e6d9f004aca32c0cdc764f3f0381914e39f337d98601a1a4641a69fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AllenReder/tmh/releases/download/v0.1.2/tmh_linux_arm64.tar.gz"
      sha256 "01575a701df0a3e6f559819d68838ae210810179f18e70690bf89eb0b0d17d27"
    else
      url "https://github.com/AllenReder/tmh/releases/download/v0.1.2/tmh_linux_amd64.tar.gz"
      sha256 "7975dd3288f7f560b52c00d5ae3f5f325a0c3d88dde7e91d62a6a32dcbcbd7c9"
    end
  end

  def install
    bin.install "tmh"
    bin.install_symlink "tmh" => "tmha"
    pkgshare.install "tmh.zsh", "LICENSE", "THIRD_PARTY_NOTICES.md", "README.md", "README.zh-CN.md"
  end

  def caveats
    <<~EOS
      To enable Zsh command insertion, add this line to ~/.zshrc:
        source "#{pkgshare}/tmh.zsh"
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/tmh --version").strip
    assert_equal version.to_s, shell_output("#{bin}/tmha --version").strip
  end
end
