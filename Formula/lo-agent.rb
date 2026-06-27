require "language/python"

class LoAgent < Formula
  desc "Agent harness that exploits local-LLM advantages: determinism, logit control, KV branching, free tokens"
  homepage "https://github.com/IMJONEZZ/lo-agent"
  url "https://github.com/IMJONEZZ/lo-agent/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "e1e5d340599ca7b9556e4aeb8338392f7817a6db5c03b5e26ffa6ef485c5c207"
  version "0.1.1"
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
    assert_match "lo", shell_output("#{bin}/lo --help")
  end
end