# 本リポジトリについて
Docker習熟用にCentOSのコンテナを立ち上げて色々弄ってみた結果です。

# Dockerコマンドの復習

## Docekrfileのビルド
```shell
docker build -t <image名>:<tag> <Dockerfile配置ディレクトリ>

# 例
docekr build -t my-centos:1 .
```

## コンテナ作成
```shell
docker run -it -d -p <ホスト側のポート>:<コンテナ側のポート> --name <コンテナ名> <image>

# 例
docker run -it -d -p 8080:8080 --name my-centos my-centos:1
```

* `-d` - バッググラウンド実行
* `-it` - 


## コンテナに接続
```
docker exec -it tomcat2 bash
```
