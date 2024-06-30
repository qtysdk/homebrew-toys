class DailyScripts < Formula
    desc "Collection of daily scripts"
    homepage "https://github.com/qtysdk/toys"
    url "https://github.com/qtysdk/toys/releases/download/v0.0.2/daily-scripts.tar.gz"
    sha256 "your_tarball_sha256_checksum"
    version "0.0.2"
  
    def install
      bin.install "google-cloud-platform/gcp-pick-project.sh"
      bin.install "google-cloud-platform/gcp-remember-project.sh"
    end
  
    # test do
    #   system "#{bin}/gcp-pick-project.sh", "--help"
    #   system "#{bin}/gcp-remember-project.sh", "--help"
    # end
  end
  