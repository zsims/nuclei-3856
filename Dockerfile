FROM golang:1.20
RUN apt update && apt install -y dnsmasq ca-certificates dnsutils
RUN go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@v2.9.8

# resolve everything to our test server running locally
RUN echo "address=/#/127.0.0.1" > /etc/dnsmasq.conf

WORKDIR /opt/repro
ADD example.yaml /opt/repro
ADD resolvers.txt /opt/repro
ENTRYPOINT ["/bin/bash", "-c"]