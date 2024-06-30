class DailyScripts < Formula
  desc "Collection of daily scripts"
  homepage "https://github.com/qtysdk/toys"
  url "https://github.com/qtysdk/toys/releases/download/v0.0.8/daily-scripts.tar.gz"
  sha256 "c66c850f479bf0611a61eddb0ee144823d3a7258b63d30b743cd3279abc0d02d"
  version "0.0.8"

  def install
    bin.install "google-cloud-platform/gcp-pick-project.sh"
    bin.install "google-cloud-platform/gcp-remember-project.sh"
  end

  # test do
  #   system "#{bin}/gcp-pick-project.sh", "--help"
  #   system "#{bin}/gcp-remember-project.sh", "--help"
  # end
end
