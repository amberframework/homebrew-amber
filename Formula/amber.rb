# Run brew fetch to get new sha256 after updating version.
# brew fetch Formula/amber.rb --build-from-source
class Amber < Formula
  desc "Amber CLI client for generating, scaffolding Amber web apps."
  version "0.2.3"
  homepage "https://www.ambercr.io"
  url "https://github.com/Amber-Crystal/amber/archive/v#{version}.tar.gz"
  sha256 "d808b6ec7807675069e563eea4aa27a64931e7cc324acbd33ae9cff38e275c86"

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
