# Docker-ElectrumX

## Build & Running

```bash
# clone the source
git clone https://github.com/zzir/Docker-ElectrumX

docker build -t electrumx:v1.8.2 Docker-ElectrumX/1.8.2
docker run -ti --rm -v /tmp/ex:/data electrumx:v1.8.2
```

## Config
*/tmp/ex/env*
```conf
DB_DIRECTORY=/data/btc
DAEMON_URL=http://rpcuser:rpcpassword@rpchost:8332/
ELECTRUMX=/usr/local/bin/electrumx_server.py
USERNAME=electrumx
COIN=BitcoinSegwit
NET=mainnet
DB_ENGINE=leveldb
REORG_LIMIT=200
HOST=192.168.1.111
TCP_PORT=50001
SSL_PORT=50002
RPC_PORT=8001
SSL_CERTFILE=/data/server.crt
SSL_KEYFILE=/data/server.key
```

*/tmp/ex/*
```bash
openssl req -newkey rsa:2048 -sha256 -nodes -x509 -days 365 -subj "/O=ElectrumX" -keyout "server.key" -out "server.crt"
```