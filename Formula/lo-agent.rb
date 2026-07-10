class LoAgent < Formula
  desc "Agent harness for local-LLM advantages: determinism, logits, KV branching"
  homepage "https://github.com/IMJONEZZ/lo-agent"
  url "https://github.com/IMJONEZZ/lo-agent/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "a3dd405fa6625c50f373f07829d1eeb429c7c1bf66ec55814098796d277bfa0f"
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
