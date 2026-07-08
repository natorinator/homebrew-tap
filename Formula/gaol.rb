class Gaol < Formula
  desc "Cross-platform container and VM management tool"
  homepage "https://github.com/natorinator/gaol-rs"
  version "2026.7.7"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/natorinator/gaol-rs/releases/download/v2026.7.7/gaol-macos-arm64"
      sha256 "5bd549a0777d37ed2c51b1ac0af8014e2889c486f17a2ee811700be162030e19"
    end

    on_intel do
      url "https://github.com/natorinator/gaol-rs/releases/download/v2026.7.7/gaol-macos-x86_64"
      sha256 "14c6c68ec18b2bb3f76dffd52276ab6636db9f331baef2a32e5c197381fc4366"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/natorinator/gaol-rs/releases/download/v2026.7.7/gaol-linux-x86_64"
      sha256 "b68075e2b6f60569567110f35a8b955bff40594a1a6524c948b6e69b1221bd95"
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
