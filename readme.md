# Install & Setup (host)

You'll need Java 8 installed.

If you have pyenv and pyenv-virtualenv installed, you can do the following to install python dependencies:

```
make create-virtualenv
make pip-install
```

Otherwise you'll need to look at the commands in the Makefile and figure out how to adapt them to your setup - for example:

```
# instead of make pip-install
pip install -r requirements.txt
```

Running the notebook server: `make run-notebooks`

# Install & Setup (docker)

