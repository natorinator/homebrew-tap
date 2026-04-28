class Gaol < Formula
  desc "Cross-platform container and VM management tool"
  homepage "https://github.com/natorinator/gaol-rs"
  version "2026.4.27"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/natorinator/gaol-rs/releases/download/v2026.4.27/gaol-macos-arm64"
      sha256 "3d39dd288fea361d5433945235dee9248d10fe6851cbc97ff75f27c0600924ac"
    end

    on_intel do
      url "https://github.com/natorinator/gaol-rs/releases/download/v2026.4.27/gaol-macos-x86_64"
      sha256 "12b7ce0fafd4cfa6413810a846ee7a223498d126211df70f78c24dab2e82dfea"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/natorinator/gaol-rs/releases/download/v2026.4.27/gaol-linux-x86_64"
      sha256 "deda5b18e8f3d02d8aea6a1808d67983c3999294be8230c46a660cda838ddb01"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "gaol-macos-arm64" => "gaol"
      else
        bin.install "gaol-macos-x86_64" => "gaol"
      end
    elsif OS.linux?
      bin.install "gaol-linux-x86_64" => "gaol"
    end
  end

  test do
    assert_match "gaol", shell_output("#{bin}/gaol --version")
  end
end
