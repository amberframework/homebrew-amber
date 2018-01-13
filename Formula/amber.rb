require 'open-uri'
require 'json'

class Amber < Formula
  desc "Amber CLI client for generating, scaffolding Amber web apps."
  version ENV['AMBER_VERSION'] || JSON.parse(open("https://api.github.com/repos/amberframework/amber/releases/latest").read)["tag_name"]
  homepage "https://amberframework.org"
  url "https://github.com/amberframework/amber/archive/#{version}.tar.gz"
  sha256 "188790b260accb35e4f077abd1c37eafef9aedd9b580194a56e6d95edb4f5e51"
  depends_on "crystal-lang"

  def install
    system "shards", "install"
    system "make", "install", "PREFIX=#{prefix}"
    bin.install "bin/amber"
  end

  test do
    assert_match "Amber CLI (amberframework.org) - #{version}", shell_output("#{bin}/amber -v")
  end
end
