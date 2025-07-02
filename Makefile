.DEFAULT_GOAL := help

new: ## railsプロジェクトを新規作成
	docker compose exec api rails _7.1.0_ new . --api
install: ## bundle installを実行する
	docker compose exec api bundle install
up: ## コンテナを起動
	docker compose up -d
down:  ## コンテナを停止
	docker compose down
api: ## apiコンテナに入る
	docker compose exec -it api bash
ps: ## コンテナの起動状況を確認
	docker compose ps
rebuild: ## イメージを再ビルドしてコンテナを起動
	docker compose up -d --build
help: ## ヘルプを表示する
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
