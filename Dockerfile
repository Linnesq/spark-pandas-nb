FROM jupyter/pyspark-notebook:hub-2.2.2 as base
WORKDIR /app
COPY requirements-docker.txt .
RUN pip install -r requirements-docker.txt

# File etc
COPY data data
COPY notebooks notebooks
EXPOSE 8888

# Make workdir editable
USER root
RUN chown -R jovyan: /app

USER jovyan
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "notebooks"]