class DailyScripts < Formula
  desc "Collection of daily scripts"
  homepage "https://github.com/qtysdk/toys"
  url "https://github.com/qtysdk/toys/releases/download/v0.0.11/daily-scripts.tar.gz"
  sha256 "b50dc130c7e79e300a14f04996a4070077a4f43579630b4735a83fb34d01c1cf"
  version "0.0.11"

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
