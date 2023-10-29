class Linuxconsole < Formula
  desc "Set of utilities for joysticks and serial devices"
  homepage "https://sourceforge.net/projects/linuxconsole/"
  url "https://prdownloads.sourceforge.net/linuxconsole/linuxconsoletools-1.8.1.tar.bz2"
  sha256 "4da29745c782b7db18f5f37c49e77bf163121dd3761e2fc7636fa0cbf35c2456"
  license "GPL"

  depends_on :linux
  depends_on "sdl2"

  def install
    system "make", "SYSTEMD_SUPPORT=1"
    cd "utils" do
      bin.install "jstest"
      bin.install "jscal"
      bin.install "jscal-restore"
      bin.install "jscal-store"
      bin.install "evdev-joystick"
      bin.install "inputattach"
      bin.install "fftest"
      bin.install "ffmvforce"
      bin.install "ffset"
      bin.install "ffcfstress"
    end
  end

  test do
    system "#{bin}/evdev-joystick", "--help"
  end
end
