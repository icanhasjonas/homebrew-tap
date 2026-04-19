class IcloudTools < Formula
  desc "CLI for managing iCloud Drive files (replacement for brctl download/evict)"
  homepage "https://github.com/icanhasjonas/icloud-tools"
  url "https://github.com/icanhasjonas/icloud-tools/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "b526ae93d638cd94f63c6021b6c78ca371e067694c2a347dc6cba11987ffe740"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/icloud"
  end

  test do
    assert_match "Manage iCloud Drive", shell_output("#{bin}/icloud --help")
  end
end
