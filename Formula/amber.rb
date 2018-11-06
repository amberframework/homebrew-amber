class Amber < Formula
  desc "CLI client for generating and scaffolding Amber web applications"
  homepage "https://www.amberframework.org/"
  url "https://github.com/amberframework/amber/archive/v0.11.0.tar.gz"
  sha256 "a96b894823bb6be999bd2303520e0178d80b7062d8ab00fd875e840a286f6369"

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

