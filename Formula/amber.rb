# Run brew fetch to get new sha256 after updating version.
# brew fetch Formula/amber.rb --build-from-source
class Amber < Formula
  desc "Amber CLI client for generating, scaffolding Amber web apps."
  version "0.1.20"
  homepage "https://www.ambercr.io"
  url "https://github.com/Amber-Crystal/amber-cmd/archive/v#{version}.tar.gz"
  sha256 "d39bf693dfdac6c4ca6d0ebb15dfb1323b86c695552d013d48f502d46aeb2201"

  depends_on "crystal-lang"
  depends_on "openssl"

  def install
    cd buildpath do
      system "shards", "install"
      system "crystal", "build", "-o", "amber", "src/amber_cmd.cr"
      bin.install "amber"
    end
  end

  test do
    system "#{bin}/amber", "--version"
  end
end
