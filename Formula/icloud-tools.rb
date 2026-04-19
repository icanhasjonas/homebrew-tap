class IcloudTools < Formula
  desc "CLI for managing iCloud Drive files (replacement for brctl download/evict)"
  homepage "https://github.com/icanhasjonas/icloud-tools"
  url "https://github.com/icanhasjonas/icloud-tools/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "9171154cfbfe401634282bd083a989cd006d9dad6477a53857ba354a4e961929"
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
