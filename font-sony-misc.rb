class FontSonyMisc < Formula
  desc "X.Org Fonts: font sony misc"
  homepage "http://www.x.org/"
  ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7font.html
  url    "https://www.x.org/pub/individual/font/font-sony-misc-1.0.3.tar.bz2"
  mirror "https://xorg.freedesktop.org/archive/individual/font/font-sony-misc-1.0.3.tar.bz2"
  mirror "https://ftp.x.org/archive/individual/font/font-sony-misc-1.0.3.tar.bz2"
  sha256 "2043a326ba347c9da5ca1e9bc363e2521c3ea40b43b1f9662d333efd4867cff5"
  revision 1
  # tag "linuxbrew"

  bottle do
    sha256 "0c25b9c97a94670867c137b1c1f03beb5f458bb4df8c2fb2d475a9677e16b08d" => :x86_64_linux
  end

  keg_only "Part of Xorg-fonts package"

  depends_on "pkg-config" => :build
  depends_on "linuxbrew/xorg/font-util"  =>  :build
  depends_on "linuxbrew/xorg/bdftopcf"   =>  :build
  depends_on "linuxbrew/xorg/mkfontdir"  =>  :build
  depends_on "fontconfig" =>  :build
  depends_on "bzip2"      => [:build, :recommended]

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
      --disable-dependency-tracking
      --disable-silent-rules
      --with-fontrootdir=#{share}/fonts/X11
    ]
    args << "--with-compression=bzip2" if build.with?("bzip2")

    system "./configure", *args
    system "make"
    system "make", "install"
  end
end
