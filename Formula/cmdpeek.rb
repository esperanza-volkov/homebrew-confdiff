class Cmdpeek < Formula
  desc "Interactive flag explorer & command builder for any CLI (from its --help)"
  homepage "https://github.com/esperanza-volkov/cmdpeek"
  url "https://registry.npmjs.org/cmdpeek/-/cmdpeek-0.3.0.tgz"
  sha256 "d09fbd8d98a0394f94ab88c9b8b401f9d1e1abe85fd765fe77d671aead3dff89"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    # Version string.
    assert_match version.to_s, shell_output("#{bin}/cmdpeek --version")

    # Non-interactive parse of a real command's --help (ls is always present).
    # --json emits the parsed structure; it must contain option "flags".
    assert_match "\"flags\"", shell_output("#{bin}/cmdpeek ls --json")
  end
end
