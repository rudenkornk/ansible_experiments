# Ansible experiments

Simple Ansible template.
This is an extremely incomplete draft only created to save it somewhere.
It lacks CI, formatting & linting and even some dummy inventory is missing.

## Test

```bash
nix develop
molecule test -s bootstrap
molecule test -s security
```
