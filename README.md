# openapi_codegenerator_shell

## 概要
OpenAPI定義を記述した`OpenAPI.yaml`ファイルを元に、`openapi-generator-cli`を利用してソースコードを自動生成するためのShell

## 作成対象
### frontend
- typescript-axios

### backend
- php

## 使い方
### ソースコードの自動生成
※`build`配下に作成されるファイルはgit管理対象外にしています。

```
// frontend, backendのソースコードを作成する場合
make generate-all

// frontendのソースコードを作成する場合
make generate-frontend-api

// backendのソースコードを作成する場合
make generate-backend-api
```

### OpenAPI.yamlファイルを一つに統合
※`build`配下に作成されるファイルはgit管理対象外にしています。

```
// swagger-cliのインストール
npm install -g @apidevtools/swagger-cli

// ファイル結合コマンドの実行
swagger-cli bundle -o ./build/openapi_merged.yaml -t yaml ./spec/openapi.yaml
```

## 参考
- [OpenAPI Guide](https://swagger.io/docs/specification/v3_0/about/)
- [Swagger Editor](https://editor-next.swagger.io/)
