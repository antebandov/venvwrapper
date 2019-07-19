# venvwrapper
A wrapper for managing Python virtual enviroments written in Bash

# Installation

To install this software just clone this repository and run the venvwrapper-install script.
The install script will create/modify the following files and directories:

- add an alias for venvwrapper to your ~/.bash_aliases
- create a local ~/.bash_completion file that sources all files in ~/.local/share/bash-completion
- create the ~/.local/share/bash-completion, if it doesn't exist
- add the venvwrapper-completion script to ~/.local/share/bash-completion

# Usage

```bash
# creates a new venv
venvwrapper -c <name of new venv>
```

```bash
# opens a existing venv in current terminal instance
venvwrapper -o <name of existing venv>
```

```bash
# prints all installed python packages of a specific venv
venvwrapper -i <name of existing venv>
```

```bash
# removes an specific venv
venvwrapper -r <name of existing venv>
```

```bash
# prints a list with all existing venvs
venvwrapper -l
```

# Info

- The created venvs are stored in ~/.venv
- To use the bash-completion install the "bash-completion" package from your distributions repositories
