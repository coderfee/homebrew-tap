class AMemo < Formula
  include Language::Python::Virtualenv

  desc "Lightweight memo CLI tool with SQLite + FTS5"
  homepage "https://github.com/coderfee/a-memo"
  url "https://github.com/coderfee/a-memo/releases/download/v1.5.3/a_memo-1.5.3.tar.gz"
  sha256 "948ea4cde803e2bcc5b14cdf6e2b65a3b898a8f1cc409538e20805a3a4f3e498"
  version "1.5.3"
  license "MIT"

  depends_on "pillow"
  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources using: "python3.13"
  end

  test do
    ENV["MEMO_DATA_DIR"] = testpath.to_s
    system "#{bin}/memo", "--version"
    system "#{bin}/memo", "add", "brew test #brew"
    assert_match "brew test", shell_output("#{bin}/memo list")
  end
end
