
class Lemonxx < Formula
  desc "lemon parser generator with improved c++ support"
  homepage "https://github.com/ksherlock/lemonxx/"
  url "https://github.com/ksherlock/lemonxx/archive/2017-09-30.tar.gz"
  sha256 "768677ee7d6f03084c6d8b6aedac967fd1274a0b2b3f55567248668fe687ad2f"

  head "https://github.com/ksherlock/lemonxx.git"

  def install
    (share/"lemon").install "lempar.c"
    (share/"lemon").install "lempar.cpp"
    (share/"lemon").install "lempar.cxx"
    include.install "lemon_base.h"

    system "make HOMEBREW_TEMPLATE_PATH=#{share}/lemon/"
    bin.install "lemon"
    bin.install "lemon++"
    bin.install "lemon--"
  end

  conflicts_with "lemon", :because => "both install `lemon` binaries"

  test do
    # system "false"
    system "true"
  end
end
