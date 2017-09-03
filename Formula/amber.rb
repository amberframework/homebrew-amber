# Run brew fetch to get new sha256 after updating version.
# brew fetch Formula/amber.rb --build-from-source
class Amber < Formula
  desc "Amber CLI client for generating, scaffolding Amber web apps."
  version "0.2.2"
  homepage "https://www.ambercr.io"
  url "https://github.com/Amber-Crystal/amber/archive/v#{version}.tar.gz"
  sha256 "fdb80a39922b1d70713630dff74f7cf7e8c792b875d01954933b71cda2875e8b"

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
