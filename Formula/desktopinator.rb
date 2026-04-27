class Desktopinator < Formula
  desc "Wayland compositor"
  homepage "https://github.com/natorinator/desktopinator"
  version "0.0.0"
  license "MIT"

  depends_on :linux

  on_linux do
    on_arm do
      url "https://github.com/natorinator/desktopinator/releases/download/v#{version}/desktopinator-linux-arm64"
      sha256 "PLACEHOLDER"
    end

    on_intel do
      url "https://github.com/natorinator/desktopinator/releases/download/v#{version}/desktopinator-linux-x86_64"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "desktopinator-linux-arm64" => "desktopinator"
    else
      bin.install "desktopinator-linux-x86_64" => "desktopinator"
    end
  end

  test do
    assert_match "desktopinator", shell_output("#{bin}/desktopinator --version")
  end
end
