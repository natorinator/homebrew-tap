class Gaol < Formula
  desc "Containers and VMs all the way down"
  homepage "https://github.com/natorinator/gaol-rs"
  version "0.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/natorinator/gaol-rs/releases/download/v#{version}/gaol-macos-arm64"
      sha256 "PLACEHOLDER"
    end

    on_intel do
      url "https://github.com/natorinator/gaol-rs/releases/download/v#{version}/gaol-macos-x86_64"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/natorinator/gaol-rs/releases/download/v#{version}/gaol-linux-arm64"
      sha256 "PLACEHOLDER"
    end

    on_intel do
      url "https://github.com/natorinator/gaol-rs/releases/download/v#{version}/gaol-linux-x86_64"
      sha256 "PLACEHOLDER"
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
      if Hardware::CPU.arm?
        bin.install "gaol-linux-arm64" => "gaol"
      else
        bin.install "gaol-linux-x86_64" => "gaol"
      end
    end
  end

  test do
    assert_match "gaol", shell_output("#{bin}/gaol --version")
  end
end
