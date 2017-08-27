# Run brew fetch to get new sha256 after updating version.
# brew fetch Formula/amber.rb --build-from-source
class Amber < Formula
  desc "Amber CLI client for generating, scaffolding Amber web apps."
  version "0.1.21"
  homepage "https://www.ambercr.io"
  url "https://github.com/Amber-Crystal/amber-cmd/archive/v#{version}.tar.gz"
  sha256 "8fc7bdd55421c74b715e188014eb1bd37dc9975365d9f4c115087a600213b8b6"

  depends_on "crystal-lang"
  depends_on "openssl"

  def install
    cd buildpath do
      system "shards", "install"
      system "crystal build -o amber src/amber_cmd.cr -p --no-debug"
      bin.install "amber"
    end
  end

  test do
    system "#{bin}/amber", "--version"
  end
end
