# Schematron-example
XML Schematron example using Python

## Setup
```
git clone https://github.com/intersystems-ib/schematron-example.git
docker-compose build
docker-compose up -d
````

## Example execution
```
zn "USER"
d ##class(dc.schematron).simpleTest()
````

