
class Lemonxx < Formula
  desc "lemon parser generator with improved c++ support"
  homepage "https://github.com/ksherlock/lemonxx/"
  url "https://github.com/ksherlock/lemonxx/archive/2017-07-03.tar.gz"
  sha256 "36f4f17d76d94b9ebaafca036528922b3bda9013d8a12fbd782065171d345a50"

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
