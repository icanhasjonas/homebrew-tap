class IcloudTools < Formula
  desc "CLI for managing iCloud Drive files (replacement for brctl download/evict)"
  homepage "https://github.com/icanhasjonas/icloud-tools"
  url "https://github.com/icanhasjonas/icloud-tools/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "436b30b0ca2bef080f9b6d5dd4c7ffefc5886efd9aee1c37e96611786d64912c"
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
