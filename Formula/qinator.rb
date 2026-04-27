class Qinator < Formula
  desc "Simple queueing. And much, much more."
  homepage "https://github.com/natorinator/qinator"
  version "0.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/natorinator/qinator/releases/download/v#{version}/qinator-macos-arm64"
      sha256 "PLACEHOLDER"
    end

    on_intel do
      url "https://github.com/natorinator/qinator/releases/download/v#{version}/qinator-macos-x86_64"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/natorinator/qinator/releases/download/v#{version}/qinator-linux-arm64"
      sha256 "PLACEHOLDER"
    end

    on_intel do
      url "https://github.com/natorinator/qinator/releases/download/v#{version}/qinator-linux-x86_64"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "qinator-macos-arm64" => "qinator"
      else
        bin.install "qinator-macos-x86_64" => "qinator"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "qinator-linux-arm64" => "qinator"
      else
        bin.install "qinator-linux-x86_64" => "qinator"
      end
    end
  end

  test do
    assert_match "qinator", shell_output("#{bin}/qinator --version")
  end
end
