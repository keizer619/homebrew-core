class Ballerina < Formula
  desc "Programming Language for Network Distributed Applications"
  homepage "https://ballerina.io"
  url "https://dist.ballerina.io/downloads/swan-lake-alpha2/ballerina-swan-lake-alpha2.zip"
  sha256 "17c8c2101d18d1058132a102d5f3e7d5536a0da503384f6ddc14318ac864fdf4"
  license "Apache-2.0"

  livecheck do
    url "https://ballerina.io/downloads/"
    regex(%r{href=.*?/downloads/.*?ballerina[._-]v?(\d+(?:\.\d+)+)\.}i)
  end

  bottle :unneeded

  depends_on "openjdk@11"

  def install
    # Remove Windows files
    rm Dir["bin/*.bat"]

    chmod 0755, "bin/bal"

    bin.install "bin/bal"
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("11"))
  end

  test do
    (testpath/"helloWorld.bal").write <<~EOS
      import ballerina/io;
      public function main() {
        io:println("Hello, World!");
      }
    EOS
    output = shell_output("#{bin}/bal run helloWorld.bal")
    assert_equal "Hello, World!", output.chomp
  end
end
