#!/bin/sh

/kong-build-tools/openresty-build-tools/kong-ngx-build \
  --prefix deps \
  --work work \
  --openresty 1.17.8.2 \
  --openssl 1.1.1h \
  --kong-nginx-module master \
  --luarocks 3.3.1 \
  --pcre 8.44 \
  --jobs 6 \
  --force

export OPENSSL_DIR=$(pwd)/deps/openssl
export PATH=$(pwd)/deps/openresty/bin:$PATH
export PATH=$(pwd)/deps/openresty/nginx/sbin:$PATH
export PATH=$(pwd)/deps/openssl/bin:$PATH
export PATH=$(pwd)/deps/luarocks/bin:$PATH

sudo luarocks install busted
sudo luarocks install luacheck
