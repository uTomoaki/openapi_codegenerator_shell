#!/bin/sh

# カラーコード
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# 開始
echo "${GREEN}========== [START] OpenAPI Generator: frontend ==========${NC}"

# バリデーションチェック
echo "${GREEN}[info] バリデーションチェック START${NC}"

if docker run --rm -v $(pwd):/local openapitools/openapi-generator-cli:v7.7.0 validate -i /local/spec/openapi.yaml; then
    echo "${GREEN}[info] バリデーションチェック OK${NC}"
else
    echo "${RED}[Error] バリデーションチェックに失敗しました。${NC}"
    exit 1
fi

# コード生成
echo "${GREEN}[info] コード生成 START${NC}"

if docker run --rm -v $(pwd):/local openapitools/openapi-generator-cli:v7.7.0 generate \
    -i /local/spec/openapi.yaml \
    -g typescript-axios \
    -o /local/build/frontend; then
    echo "${GREEN}[info] コード生成に成功しました${NC}"
else
    echo "${RED}[Error] コード生成に失敗しました。${NC}"
    exit 1
fi
echo "${GREEN}[info] コード生成 OK${NC}"

# 終了
echo "${GREEN}========== [FINISH] OpenAPI Generator: frontend ==========${NC}"
