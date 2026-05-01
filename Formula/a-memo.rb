class AMemo < Formula
  include Language::Python::Virtualenv

  desc "Lightweight memo CLI tool with SQLite + FTS5"
  homepage "https://github.com/coderfee/a-memo"
  url "https://github.com/coderfee/a-memo/releases/download/v1.6.0/a_memo-1.6.0.tar.gz"
  sha256 "2f7d05b4ae13b1ea742e63b442a1f4db59f2e835c25be8c54e4556d7800b22ca"
  version "1.6.0"
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
