require 'open-uri'
require 'json'

class Amber < Formula
  desc "Amber CLI client for generating, scaffolding Amber web apps."
  version ENV['AMBER_VERSION'] || JSON.parse(open("https://api.github.com/repos/amberframework/amber/releases/latest").read)["tag_name"]
  homepage "https://amberframework.org"
  url "https://github.com/amberframework/amber/archive/#{version}.tar.gz"
  sha256 "edeed6d43524a79948ac3e307340d6cea56dd9c4009e4c946c4cf395c9a6ac1d"

  depends_on "crystal-lang"

  def install
    system "shards", "install"
    system "make", "install", "PREFIX=#{prefix}"
    bin.install "bin/amber"
  end

  test do
    assert_match "Amber CLI (amberframework.org) - v0.6.0", shell_output("#{bin}/amber -v")
  end
end
