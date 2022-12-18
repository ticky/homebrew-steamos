class BluezUtilsCompat < Formula
  desc "Development and debugging utilities for the bluetooth protocol stack"
  homepage "http://www.bluez.org/"
  url "http://www.kernel.org/pub/linux/bluetooth/bluez-5.66.tar.xz"
  sha256 "39fea64b590c9492984a0c27a89fc203e1cdc74866086efb8f4698677ab2b574"
  license "GPL-2.0-or-later"

  depends_on "docutils" => :build
  # NOTE: This is to work around Homebrew docutils formula bug homebrew/homebrew-core#118458
  depends_on "python@3.11" => :build
  depends_on "alsa-lib"
  depends_on "dbus"
  depends_on "glib"
  depends_on "libical"
  depends_on :linux

  def install
    system "./configure",
           *std_configure_args,
           "--disable-silent-rules",
           "--enable-midi",
           "--enable-sixaxis",
           "--enable-hid2hci",
           "--enable-mesh",
           "--enable-experimental",
           "--enable-library",
           "--enable-deprecated"
    system "make"
    system "make",
           "install-binPROGRAMS",
           "install-dist_zshcompletionDATA",
           "install-man1"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test bluez-utils-compat`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
