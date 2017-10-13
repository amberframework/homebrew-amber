# Run brew fetch to get new sha256 after updating version.
# brew fetch Formula/amber.rb --build-from-source
require 'open-uri'
require 'json'

class Amber < Formula
  desc "Amber CLI client for generating, scaffolding Amber web apps."
  version ENV['VERSION'] || JSON.parse(open("https://api.github.com/repos/amberframework/amber/releases/latest").read)["tag_name"]
  homepage "https://www.ambercr.io"
  url "https://github.com/amberframework/amber/archive/#{version}.tar.gz"
  # sha256 "b1fce56cf0f3ae9db13775145c8916a9996d567f95223b67239cba92614a6262"


  depends_on "crystal-lang"
  depends_on "openssl"

  def install
    cd buildpath do
      system "shards", "install"
      system "crystal build -o amber src/amber/cli.cr -p --no-debug"
      bin.install "amber"
    end
  end

  test do
    system "#{bin}/amber", "--version"
  end
end
