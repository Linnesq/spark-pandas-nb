FROM quay.io/jupyter/pyspark-notebook:spark-3.5.2 as base
WORKDIR /app

# File etc
COPY data data
COPY notebooks notebooks
EXPOSE 8888

# Make workdir editable
USER root
RUN chown -R jovyan: /app

USER jovyan
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "notebooks"]