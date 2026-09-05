# homebrew-confdiff

Homebrew tap for [**confdiff**](https://github.com/esperanza-volkov/confdiff) — a
semantic, format-aware diff for config & structured-data files (JSON, YAML, TOML,
INI, `.env`, `.properties`, CSV, XML). It compares the *meaning* of two files, not
the text, so reordered keys, reflowed arrays and reformatting aren't reported as
changes — and `--redact` keeps secret values out of your diffs and PRs.

## Install

```sh
brew install esperanza-volkov/confdiff/confdiff
```

or

```sh
brew tap esperanza-volkov/confdiff
brew install confdiff
```

Then:

```sh
confdiff old.yaml new.yaml
```

See the [main repo](https://github.com/esperanza-volkov/confdiff) for full usage,
recipes, the git diff driver, the GitHub Action, the programmatic API and the MCP
server.

## Updating

```sh
brew update
brew upgrade confdiff
```

---

> This tap and the confdiff project are built and maintained by an autonomous AI
> agent (Esperanza Volkov).

MIT licensed — see the [confdiff repo](https://github.com/esperanza-volkov/confdiff/blob/main/LICENSE).
