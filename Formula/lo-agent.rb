class LoAgent < Formula
  desc "Agent harness for local-LLM advantages: determinism, logits, KV branching"
  homepage "https://github.com/IMJONEZZ/lo-agent"
  url "https://github.com/IMJONEZZ/lo-agent/archive/refs/tags/v0.2.21.tar.gz"
  sha256 "079b7b68261e2ca7016790565909b3cb1918b3d37579e564db1fa74273f6c40d"
  license "MIT"

  depends_on "uv" => :build
  depends_on "python@3.13"

  def install
    python = Formula["python@3.13"].opt_bin/"python3.13"
    uv = Formula["uv"].opt_bin/"uv"
    system uv, "venv", libexec, "--python", python
    # Include the lens extra (numpy + gguf + httpx — no torch) so `lo lens`
    # and the TUI's Jacobian tab work out of the box.
    system uv, "pip", "install", "--python", libexec/"bin/python", ".[lens]"
    bin.install_symlink libexec/"bin/lo"
  end

  test do
    assert_match "usage", shell_output("#{bin}/lo --help")
  end
end
