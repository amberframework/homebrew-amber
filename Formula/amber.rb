# Run brew fetch to get new sha256 after updating version.
# brew fetch Formula/amber.rb --build-from-source
require 'open-uri'
require 'json'

class Amber < Formula
  desc "Amber CLI client for generating, scaffolding Amber web apps."
  version ENV['AMBER_VERSION'] || JSON.parse(open("https://api.github.com/repos/amberframework/amber/releases/latest").read)["tag_name"]
  homepage "https://amberframework.org"
  url "https://github.com/amberframework/amber/archive/#{version}.tar.gz"
  sha256 "a5b5f7a4568cc52bba9458f705e64fe37884cbbafcb5b779058e0cb1bd67df3a"

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
