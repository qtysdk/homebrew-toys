class DailyScripts < Formula
  desc "Collection of daily scripts"
  homepage "https://github.com/qtysdk/toys"
  url "https://github.com/qtysdk/toys/releases/download/v0.0.9/daily-scripts.tar.gz"
  sha256 "11f7eeeba0b8d57ad8fa4cd592f302a770021af3558775c1d1da9b7185f5bdb2"
  version "0.0.9"

  def install
    ohai "Current directory: #{Dir.pwd}"
    bin.install "google-cloud-platform/gcp-pick-project.sh"
    bin.install "google-cloud-platform/gcp-remember-project.sh"
  end

  # test do
  #   system "#{bin}/gcp-pick-project.sh", "--help"
  #   system "#{bin}/gcp-remember-project.sh", "--help"
  # end
end
