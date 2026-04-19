class IcloudTools < Formula
  desc "CLI for managing iCloud Drive files (replacement for brctl download/evict)"
  homepage "https://github.com/icanhasjonas/icloud-tools"
  url "https://github.com/icanhasjonas/icloud-tools/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "207cc1b5339a4cd21682c7130cbb74ee9b3d7ffd5a5da00624fac920e2bfc2c1"
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
