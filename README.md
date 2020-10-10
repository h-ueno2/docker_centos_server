# 本リポジトリについて
https接続できるPHP環境を作成します。  
自己証明書をコンテナ内で作成し、使用しています。

# 実行方法
本リポジトリのRootにて以下を実行します。
```shell
docker-compose up -d
```

コンテナの終了方法については下記のDocker-composeコマンドを参照してください。

# Google Chromeでの実行について
Google Chromeでは自己証明書を使用した環境へのアクセス時に警告が表示されてしまい、ページの表示ができません。  
以下の設定を`Enabled`に変更する必要があります。

```
chrome://flags/#allow-insecure-localhost
```

# Dockerコマンド
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

# Docker-composeコマンド

## コンテナの起動
```shell
docker-compose up -d
```

## 起動中のコマンド確認
```shell
docker-compose ps
```

## imageの作成
```shell
docker-compose build
```

## コンテナの停止
```shell
docker-compose stop
```

## コンテナの削除
```shell
docker-compose rm
```

## 停止、削除、ネットワーク削除を実行
``` shell
docker-compose down
```

## imageも合わせて削除
```shell
docker-compose down --rmi all
```
