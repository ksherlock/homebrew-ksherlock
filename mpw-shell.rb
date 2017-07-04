class MpwShell < Formula
  desc "A shell for those that prefer Macintosh Programmer's Workshop."
  homepage "https://github.com/ksherlock/mpw-shell"
  url "https://github.com/ksherlock/mpw-shell/archive/0.4.tar.gz"
  sha256 "92cb014eb5977305ea759800cfb8bf8cc1f0e636832c2488a7e306bdc17eded9"
  head "https://github.com/ksherlock/mpw-shell.git"

  depends_on "cmake" => :build
  depends_on "ragel" => :build
  depends_on "lemonxx" => :build

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    system "true"
  end
end
