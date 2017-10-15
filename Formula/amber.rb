# Run brew fetch to get new sha256 after updating version.
# brew fetch Formula/amber.rb --build-from-source
require 'open-uri'
require 'json'

class Amber < Formula
  desc "Amber CLI client for generating, scaffolding Amber web apps."
  version ENV['AMBER_VERSION'] || JSON.parse(open("https://api.github.com/repos/amberframework/amber/releases/latest").read)["tag_name"]
  homepage "https://www.ambercr.io"
  url "https://github.com/amberframework/amber/archive/#{version}.tar.gz"
  sha256 "16b602d2bc866c748c5ca151297e6b0201f6a939e251f92cd39861b76bd222d9"

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
