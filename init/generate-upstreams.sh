#!/bin/bash

docker run -e DEBIAN_FRONTEND=noninteractive bitnami/git:latest bash -c "git clone --quiet https://github.com/czarly/rpc-endpoints.git /endpoints && cd /endpoints && apt update -qq -y &> /dev/null && apt install -y -qq jq bc &> /dev/null && chmod +x generate_list.sh && ./generate_list.sh" > upstreams
