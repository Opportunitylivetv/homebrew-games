class FuseEmulator < Formula
  desc "Free Unix Spectrum Emulator"
  homepage "http://fuse-emulator.sourceforge.net/"
  url "https://downloads.sourceforge.net/project/fuse-emulator/fuse/1.2.2/fuse-1.2.2.tar.gz"
  sha256 "c56b00abc9c9627738abfcc5b6647ce966d6627051643b6b640797b315e5fde6"

  bottle do
    sha256 "8b271e1fe5638f1dad076aa5b16cf49bf70d6b86a3c70a6f36ca99431881f9ba" => :el_capitan
    sha256 "67999176bba4628f933ebdf32132f8d92df7a3d385f0deaf71f1a31a9d1f141e" => :yosemite
    sha256 "4ffdee878de3878af4eb64ae9deaeabce2703c31a1d3409cc814518fe932156e" => :mavericks
  end

  head do
    url "http://svn.code.sf.net/p/fuse-emulator/code/trunk/fuse"
    depends_on "automake" => :build
    depends_on "autoconf" => :build
    depends_on "libtool" => :build
  end

  depends_on "pkg-config" => :build
  depends_on "sdl"
  depends_on "libspectrum"
  depends_on "libpng"

  def install
    system "./autogen.sh" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--disable-sdltest",
                          "--with-sdl",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/fuse", "--version"
  end
end
