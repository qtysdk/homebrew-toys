class DailyScripts < Formula
  desc "Collection of daily scripts"
  homepage "https://github.com/qtysdk/toys"
  url "https://github.com/qtysdk/toys/releases/download/v0.0.10/daily-scripts.tar.gz"
  sha256 "377d16c26f5f5286dec8ea9d868b4e772655253b02cb15d62071a15b3ad0dbce"
  version "0.0.10"

  def install
    bin.install "google-cloud-platform/gcp-pick-project.sh"
    bin.install "google-cloud-platform/gcp-remember-project.sh"
  end

  # test do
  #   system "#{bin}/gcp-pick-project.sh", "--help"
  #   system "#{bin}/gcp-remember-project.sh", "--help"
  # end
end
