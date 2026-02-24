class Heictojpeg < Formula
  desc "Fast HEIC to JPEG converter with multi-threading support"
  homepage "https://github.com/cckalen/heictojpeg"
  head "https://github.com/cckalen/heictojpeg.git", branch: "main"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    (testpath / "test.txt").write("not a heic file")
    output = shell_output("#{bin}/heictojpeg 2>&1")
    assert_match "No .heic files found", output
  end
end
