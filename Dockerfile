# Go公式イメージを使用
FROM golang:1.22

# 作業ディレクトリを設定
WORKDIR /app

# ソースコードをコンテナにコピー
COPY go.mod ./
RUN go mod download || true  # ダミーでもエラーにならないようにする

COPY . .

# アプリをビルド
RUN go build -o app && chmod +x app

# アプリ実行
CMD ["/bin/sh", "-c", "./app"]