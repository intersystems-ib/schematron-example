ARG IMAGE=intersystems/irishealth:2022.1.0FHIRSQL.31.0
ARG IMAGE=intersystemsdc/irishealth-community:latest
ARG IMAGE=intersystems/irishealth-community:2022.1.0.209.0
ARG IMAGE=containers.intersystems.com/intersystems/irishealth-community:2022.3.0.589.0
FROM $IMAGE

USER root

# change ownership
RUN mkdir -p /opt/irisapp
RUN chown -R ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisapp
WORKDIR /opt/irisapp

USER ${ISC_PACKAGE_MGRUSER}

# copy license
#COPY iris.key /usr/irissys/mgr/iris.key

# copy source
COPY iris.script iris.script
COPY dc.schematron.cls dc.schematron.cls

# install lxml module
RUN pip3 install --target /usr/irissys/mgr/python lxml

# run iris.script
RUN iris start IRIS \
    && iris session IRIS < /opt/irisapp/iris.script \
    && iris stop IRIS quietly
