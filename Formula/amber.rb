# Run brew fetch to get new sha256 after updating version.
# brew fetch Formula/amber.rb --build-from-source
class Amber < Formula
  desc "Amber CLI client for generating, scaffolding Amber web apps."
  version "0.2.5"
  homepage "https://www.ambercr.io"
  url "https://github.com/Amber-Crystal/amber/archive/v#{version}.tar.gz"
  sha256 "1743bc45afa170763102879e459d79b565bdabf189faca2559955385bb8d0c30"

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
