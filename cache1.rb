class Amber < Formula
  desc "Amber CLI client for generating, scaffolding Amber web apps."
  version ENV['AMBER_VERSION'] || JSON.parse(open("https://api.github.com/repos/amberframework/amber/releases/latest").read)["tag_name"]
  homepage "https://amberframework.org"
  url "https://github.com/amberframework/amber/archive/#{version}.tar.gz"
  sha256 "dfcf79a51a5ed6f1693cba0fc4761b4cd4cb7472f35df23182e68e4f4fa29e96"

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
