# homebrew-lo-agent

Homebrew tap for [lo-agent](https://github.com/IMJONEZZ/lo-agent), an agent harness that exploits local-LLM advantages.

## What is lo-agent?

lo-agent is an agent harness built around the advantages local and self-hosted LLMs have over frontier APIs:

- **Determinism & exact replay** - every model call logged with its seed
- **Spec-driven grammar skills** - GBNF/Lark/JSON-schema constraints
- **Logit pipeline** - samplers, bias profiles, think-budget forcing, anti-slop
- **Guardrails** - rescue parsing, corrective nudges, schema validation
- **Tree search** - best-of-N, beam search, KV-cache-aware branching
- **Proxy mode** - OpenAI + Anthropic compatible API front door
- **Textual TUI** - live run monitoring and task launching

## Installation

### Add the tap

```bash
brew tap IMJONEZZ/lo-agent
```

### Install lo-agent

```bash
brew install lo-agent
```

## Quickstart

```bash
# Probe your server's capabilities
harness probe --url http://localhost:8080

# Run an agent task
harness run "Use the calculator tool to compute 17*23 plus 100."

# Start the TUI
harness tui

# Start the proxy
harness proxy --url http://localhost:8080 --port 8088
```

## uv Installation

lo-agent can also be installed directly with uv (recommended for most users):

```bash
uv tool install "git+https://github.com/IMJONEZZ/lo-agent"
```

## License

MIT