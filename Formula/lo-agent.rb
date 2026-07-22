class LoAgent < Formula
  desc "Agent harness for local-LLM advantages: determinism, logits, KV branching"
  homepage "https://github.com/IMJONEZZ/lo-agent"
  url "https://github.com/IMJONEZZ/lo-agent/archive/refs/tags/v0.2.22.tar.gz"
  sha256 "66be54c2a15e1b7f2aeb06240bb6cc9233c4374dc9bed602df6ad64ec2d0368c"
  # lo-agent Community License 1.0 — source-available, not an SPDX license.
  license :cannot_represent

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
