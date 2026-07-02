class LoAgent < Formula
  desc "Agent harness for local-LLM advantages: determinism, logits, KV branching"
  homepage "https://github.com/IMJONEZZ/lo-agent"
  url "https://github.com/IMJONEZZ/lo-agent/archive/refs/tags/v0.1.21.tar.gz"
  sha256 "6f2c5fc1f1a38ae9d1656578ad4f704c62152b7d301db9f1f27160fc895267da"
  license "MIT"

  depends_on "uv" => :build
  depends_on "python@3.13"

  def install
    python = Formula["python@3.13"].opt_bin/"python3.13"
    uv = Formula["uv"].opt_bin/"uv"
    system uv, "venv", libexec, "--python", python
    system uv, "pip", "install", "--python", libexec/"bin/python", "."
    bin.install_symlink libexec/"bin/lo"
  end

  test do
    assert_match "usage", shell_output("#{bin}/lo --help")
  end
end
