#!/usr/bin/env bash

docker build . -t nuclei-3856
docker run -it nuclei-3856 "dnsmasq && dig example.com A @127.0.0.1 && nuclei -resolvers ./resolvers.txt -u http://example.com -t ./example.yaml -v"