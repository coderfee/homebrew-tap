class AMemo < Formula
  include Language::Python::Virtualenv

  desc "Lightweight memo CLI tool with SQLite + FTS5"
  homepage "https://github.com/coderfee/a-memo"
  url "https://github.com/coderfee/a-memo/releases/download/v1.6.1/a_memo-1.6.1.tar.gz"
  sha256 "6955b6833cbd7ccc3036086de09ea6ac56923796335f67be3af07e6bdd0dee09"
  version "1.6.1"
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
