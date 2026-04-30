class AMemo < Formula
  desc "Lightweight memo CLI tool with SQLite + FTS5"
  homepage "https://github.com/coderfee/a-memo"
  version "1.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/coderfee/a-memo/releases/download/v1.5.1/memo-macos-arm64.tar.gz"
      sha256 "78e111ddab7c14ff2db4f5afa87662c95aca0fb4a131189c365832eb9a232b05"
    else
      url "https://github.com/coderfee/a-memo/releases/download/v1.5.1/memo-macos-x86_64.tar.gz"
      sha256 "44590302f729bba4bb332b4bffcb988cdb9021c632809e1207498fdfd7e0222a"
    end
  end

  def install
    bin.install "memo"
  end

  test do
    ENV["MEMO_DATA_DIR"] = testpath.to_s
    system "#{bin}/memo", "--version"
    system "#{bin}/memo", "add", "brew test #brew"
    assert_match "brew test", shell_output("#{bin}/memo list")
  end
end
