#!/bin/bash

# 獲取 SHA256 值和版本號
SHA256=$1
VERSION=$2

# 更新 Formula 文件
cat > Formula/daily-scripts.rb <<EOF
class DailyScripts < Formula
  desc "Collection of daily scripts"
  homepage "https://github.com/qtysdk/toys"
  url "https://github.com/qtysdk/toys/releases/download/v${VERSION}/daily-scripts.tar.gz"
  sha256 "${SHA256}"
  version "${VERSION}"

  def install
    bin.install "google-cloud-platform/gcp-pick-project.sh"
    bin.install "google-cloud-platform/gcp-remember-project.sh"
  end

  # test do
  #   system "#{bin}/gcp-pick-project.sh", "--help"
  #   system "#{bin}/gcp-remember-project.sh", "--help"
  # end
end
EOF
