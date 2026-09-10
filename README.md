# 7samael7/tap

Homebrew formulae for [7samael7](https://github.com/7samael7)'s projects.

| Formula | Project |
|---------|---------|
| `aum`   | [agent-usage-monitor](https://github.com/7samael7/agent-usage-monitor) — a private, local-first terminal monitor for the token usage of coding agents |

## Installing

```bash
brew install 7samael7/tap/aum
```

The fully qualified name is enough: Homebrew 6 trusts exactly that one formula. To install by
short name instead, trust it first:

```bash
brew tap 7samael7/tap
brew trust --formula 7samael7/tap/aum
brew install aum
```

The formula builds the tagged release from source, so the first install compiles for a few
minutes; Homebrew brings in Rust as a build dependency if it is not already there.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
