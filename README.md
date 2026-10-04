# shankar-sachin's Homebrew tap

```bash
brew install shankar-sachin/tap/askphysics
```

That installs the `askphysics` command for [Ask Physics](https://github.com/shankar-sachin/ask-physics)
on macOS and Linux. Then:

```bash
askphysics ask "How fast does a ball dropped from 20 m hit the ground?"
```

Upgrade with `brew upgrade askphysics`; uninstall with `brew uninstall askphysics`.

The one-line installer in the main repo (`curl ... | sh`) is the recommended route;
this tap is for people who like their software brewed.

## Releasing

When a new `vX.Y.Z` tag lands in the main repo, update `url` and `sha256` in
`Formula/askphysics.rb`:

```bash
curl -L https://github.com/shankar-sachin/ask-physics/archive/refs/tags/vX.Y.Z.tar.gz | shasum -a 256
```

License: MIT, same as Ask Physics.
