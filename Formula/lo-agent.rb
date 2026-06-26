require "language/python"

class LoAgent < Formula
  desc "Agent harness that exploits local-LLM advantages: determinism, logit control, KV branching, free tokens"
  homepage "https://github.com/IMJONEZZ/lo-agent"
  url "https://github.com/IMJONEZZ/lo-agent/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "08cd7b7da778906c72d7cc636f814f18154920c5a0047b24bb3ece470aed69aa"
  version "0.1.0"
  license "MIT"

  depends_on "python@3.13"
  depends_on "uv"

  includes Language::Python::Virtualenv

  def python
    deps.find { |d| d.name.match?(/^python@3/) }.to_formula
  end

  def install
    virtualenv_install_with_resources do |v|
      v.pip_install "-e", "."
    end
  end

  test do
    assert_match "harness", shell_output("#{bin}/harness --help")
  end
end