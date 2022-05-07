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

Before running the notebooks, check if `JAVA_HOME` is set (you're expecting an output to a directory): `echo $JAVA_HOME`

If that's all good, run the notebook server: `make run-notebooks`

# Install & Setup (docker)

If you don't want to spend time on installing java and python etc, and you have docker installed (with docker-compose), 
then getting this project running locally should be as simple as:

```commandline
docker-compose up
```

This will start up the notebook server with the `/notebooks` directory mounted to the container,
so changes you make in the notebook will be reflected on your machine's filesystem. The output in your terminal will 
look something like this:

```
spark-pandas-nb-spark-notebook-1  | [I 10:16:21.385 NotebookApp] Serving notebooks from local directory: /app/notebooks
spark-pandas-nb-spark-notebook-1  | [I 10:16:21.386 NotebookApp] Jupyter Notebook 6.4.11 is running at:
spark-pandas-nb-spark-notebook-1  | [I 10:16:21.387 NotebookApp] http://7aec0300664e:8888/?token=212ecc78896d043b1b473d978290dc6b1b3d56bfd0e7e476
spark-pandas-nb-spark-notebook-1  | [I 10:16:21.387 NotebookApp]  or http://127.0.0.1:8888/?token=212ecc78896d043b1b473d978290dc6b1b3d56bfd0e7e476
spark-pandas-nb-spark-notebook-1  | [I 10:16:21.387 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).

```

Click on the link to localhost (`127.0.0.1`) and you should see the jupyter UI and the contents of the `./notebooks` directory.
