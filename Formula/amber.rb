class Amber < Formula
  desc "CLI client for generating and scaffolding Amber web applications"
  homepage "https://www.amberframework.org/"
<<<<<<< HEAD
  url "https://github.com/amberframework/amber/archive/v0.27.0.tar.gz"
  sha256 "b585cc7d9c6ac05c9483eebf83fd9b433dd124f8313478e22bf473af468d0e78"
=======
  url "https://github.com/amberframework/amber/archive/v0.11.3.tar.gz"
  sha256 "4ffd4f81a856480686e350a2674aae29de085d7a0de3101fce1715632b634a34"
>>>>>>> 6c206b67506b600c9aa03f8bde3882dbac3c8dd3

  depends_on "crystal"

  def install
    system "shards", "install"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    output = shell_output("#{bin}/amber new test_app")
    %w[
      config/environments
      amber.yml
      shard.yml
      public
      src/controllers
      src/views
      src/assets
      src/test_app.cr
    ].each do |path|
      assert_match path, output
    end

    cd "test_app" do
      build_app = shell_output("shards build test_app")
      assert_match "Building", build_app
      assert_predicate testpath/"test_app/bin/test_app", :exist?
    end
  end
end

