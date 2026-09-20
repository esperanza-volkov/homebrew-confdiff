class Confdiff < Formula
  desc "Semantic, format-aware diff for config & structured-data files"
  homepage "https://github.com/esperanza-volkov/confdiff"
  url "https://registry.npmjs.org/confdiff/-/confdiff-0.17.2.tgz"
  sha256 "a8b4f85884eabaa099b0a2850e8646d734599cf342787afffb0e68b8bfa2bdb0"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    # Reordering keys is NOT a semantic change (exit 0).
    (testpath/"a.yaml").write "a: 1\nb: 2\n"
    (testpath/"b.yaml").write "b: 2\na: 1\n"
    assert_match "no semantic differences",
      shell_output("#{bin}/confdiff #{testpath}/a.yaml #{testpath}/b.yaml")

    # A real value change IS reported (confdiff exits 1 when files differ).
    (testpath/"c.yaml").write "a: 3\nb: 2\n"
    assert_match "a", shell_output("#{bin}/confdiff #{testpath}/a.yaml #{testpath}/c.yaml", 1)
  end
end
