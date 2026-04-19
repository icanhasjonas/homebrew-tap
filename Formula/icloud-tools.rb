class IcloudTools < Formula
  desc "CLI for managing iCloud Drive files (replacement for brctl download/evict)"
  homepage "https://github.com/icanhasjonas/icloud-tools"
  url "https://github.com/icanhasjonas/icloud-tools/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "5ea35258455d71bacc26f825b161c452c4ffca47582f0060031338597e2d43e1"
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