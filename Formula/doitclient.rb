class Doitclient < Formula
  desc "The Unix client program of Simon Tatham's DoIt - yet another remote-execution daemon for Windows" 
  homepage "https://www.chiark.greenend.org.uk/~sgtatham/doit/"
  url "https://www.chiark.greenend.org.uk/~sgtatham/doit/doit.tar.gz"

  sha256 "77b1079bdd528a6d2cd2f9523ecfebc8c2c7e75255fc8df3b66861476fcfb379"
  version "20181215.2c7e897"

  depends_on "gawk" => :build
  depends_on "gcc" => :build

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "check"
    system "make", "install"
  end

  # We are fine if the executable does not error out, so we know linking
  # and building the software was ok.
  test do
    system bin/"doitclient", "--version"
  end
end
