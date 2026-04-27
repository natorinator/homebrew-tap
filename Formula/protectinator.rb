class Protectinator < Formula
  desc "General security tool"
  homepage "https://github.com/natorinator/protectinator"
  version "0.0.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/natorinator/protectinator/releases/download/v#{version}/protectinator-macos-arm64"
      sha256 "PLACEHOLDER"
    end

    on_intel do
      url "https://github.com/natorinator/protectinator/releases/download/v#{version}/protectinator-macos-x86_64"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/natorinator/protectinator/releases/download/v#{version}/protectinator-linux-arm64"
      sha256 "PLACEHOLDER"
    end

    on_intel do
      url "https://github.com/natorinator/protectinator/releases/download/v#{version}/protectinator-linux-x86_64"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "protectinator-macos-arm64" => "protectinator"
      else
        bin.install "protectinator-macos-x86_64" => "protectinator"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "protectinator-linux-arm64" => "protectinator"
      else
        bin.install "protectinator-linux-x86_64" => "protectinator"
      end
    end
  end

  test do
    assert_match "protectinator", shell_output("#{bin}/protectinator --help")
  end
end
