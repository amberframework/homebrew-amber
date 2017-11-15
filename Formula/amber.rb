# Run brew fetch to get new sha256 after updating version.
# brew fetch Formula/amber.rb --build-from-source
require 'open-uri'
require 'json'

class Amber < Formula
  desc "Amber CLI client for generating, scaffolding Amber web apps."
  version ENV['AMBER_VERSION'] || JSON.parse(open("https://api.github.com/repos/amberframework/amber/releases/latest").read)["tag_name"]
  homepage "https://amberframework.org"
  url "https://github.com/amberframework/amber/archive/#{version}.tar.gz"
  sha256 "5bc48be991083b3d5d41ed7630a6ec29163d2bab4b29f74979ce495a30888fe1"

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
