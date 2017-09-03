# Run brew fetch to get new sha256 after updating version.
# brew fetch Formula/amber.rb --build-from-source
class Amber < Formula
  desc "Amber CLI client for generating, scaffolding Amber web apps."
  version "0.2.2"
  homepage "https://www.ambercr.io"
  url "https://github.com/Amber-Crystal/amber/archive/v#{version}.tar.gz"
  sha256 "b586ff61d0114bf0d463a429121d6e0b00ff7271baf540690c3d78239d653c56"

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
