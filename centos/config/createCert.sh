#!/bin/sh

# サーバホスト名
SSL_HOST_NAME="localhost"

# サーバ証明書及び鍵を配置するディレクトリ
SSL_PKI_DIR="/etc/pki/tls/certs"

SERVER_SUBJECT="/C=JP/ST=Tokyo/L=Shibuya/O=Sample/OU=Dev/CN=localhost"

DAYS=3650

# 秘密鍵作成時のパスワード
# 実際の使用時に変更すること
PKI_PASS="password"


mkdir -p ${SSL_PKI_DIR}

# 秘密鍵作成
openssl genrsa -aes256 -passout pass:${PKI_PASS} -out ${SSL_PKI_DIR}/server.key 2048

# パスフレーズなしにする
openssl rsa -passin pass:${PKI_PASS} -in ${SSL_PKI_DIR}/server.key -out ${SSL_PKI_DIR}/server.key

# CSRを作成
openssl req -new -key ${SSL_PKI_DIR}/server.key -out ${SSL_PKI_DIR}/server.csr -subj "${SERVER_SUBJECT}"

# SANリストを作成
echo "subjectAltName = DNS:local, IP:127.0.0.1" > ${SSL_PKI_DIR}/san.txt

openssl x509 -req -days ${DAYS} -in ${SSL_PKI_DIR}/server.csr -signkey ${SSL_PKI_DIR}/server.key -out ${SSL_PKI_DIR}/server.crt -extfile ${SSL_PKI_DIR}/san.txt
