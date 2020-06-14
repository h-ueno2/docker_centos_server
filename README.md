# 本リポジトリについて
Docker習熟用にCentOSのコンテナを立ち上げて色々弄ってみた結果です。

# Dockerコマンドの復習

## Docekrfileのビルド
```shell
docker build -t <image名>:<tag> <Dockerfile配置ディレクトリ>

# 例
docker build -t my-centos:1 .
```

## コンテナ作成
```shell
docker run -it -d -p <ホスト側のポート>:<コンテナ側のポート> --name <コンテナ名> <image>

# 例
docker run -it -d -p 8080:80 --name my-centos my-centos:1

# CentOSコンテナでsystemctlを使用したい場合は以下
docker run --privileged -d -p 8080:80 --name my-centos my-centos:1 /sbin/init 
```

* `-d` - バッググラウンド実行する。
* `-it` - コンテナを操作する。
* `-v` - コンテナとディレクトリを共有する。


## コンテナに接続
```shell
docker exec -it <コンテナ名> bash

# 例
docker exec -it my-centos bash
```
