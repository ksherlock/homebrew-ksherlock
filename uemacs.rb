class Uemacs < Formula
  desc "uEmacs/PK 4.0"
  homepage "https://git.kernel.org/pub/scm/editors/uemacs/uemacs.git/"

  head "git://git.kernel.org/pub/scm/editors/uemacs/uemacs.git"
  version ""

  patch :DATA

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    system "make"
    bin.install "em"
    (share/"uemacs").install "emacs.hlp"
    (share/"uemacs").install "emacs.rc" 
  end

  test do
    system "true"
  end
end

__END__
diff --git a/Makefile b/Makefile
index ed9d81c..beb9702 100644
--- a/Makefile
+++ b/Makefile
@@ -46,7 +46,7 @@ ifeq ($(uname_S),FreeBSD)
  DEFINES=-DAUTOCONF -DPOSIX -DSYSV -D_FREEBSD_C_SOURCE -D_BSD_SOURCE -D_SVID_SOURCE -D_XOPEN_SOURCE=600
 endif
 ifeq ($(uname_S),Darwin)
- DEFINES=-DAUTOCONF -DPOSIX -DSYSV -D_DARWIN_C_SOURCE -D_BSD_SOURCE -D_SVID_SOURCE -D_XOPEN_SOURCE=600
+ DEFINES=-DAUTOCONF -DPOSIX -DSYSV -D_DARWIN_C_SOURCE -D_BSD_SOURCE -D_SVID_SOURCE -D_XOPEN_SOURCE=600 -D_FORTIFY_SOURCE=0
 endif
 #DEFINES=-DAUTOCONF
 #LIBS=-ltermcap			# BSD
diff --git a/epath.h b/epath.h
index 1e85aaa..447be5d 100644
--- a/epath.h
+++ b/epath.h
@@ -24,7 +24,8 @@ static char *pathname[] =
 
 #if	V7 | BSD | USG
 {
-	".emacsrc", "emacs.hlp",
+	"emacsrc", "emacs.hlp",
+	"/usr/local/share/uemacs/",
 #if	PKCODE
 	    "/usr/global/lib/", "/usr/local/bin/", "/usr/local/lib/",
 #endif

