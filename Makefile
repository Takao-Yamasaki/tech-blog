.DEFAULT_GOAL := help

new: ## railsプロジェクトを新規作成
	docker compose exec api rails _7.1.0_ new . --api
install: ## bundle installを実行
	docker compose exec api bundle install
create: ## createを実行
	docker compose exec api rails db:create
migrate: ## migrationを実行
	docker compose exec api rails db:migrate
up: ## コンテナを起動
	docker compose up -d
down:  ## コンテナを停止
	docker compose down
api: ## apiコンテナに入る
	docker compose exec -it api bash
db: ## MySQLサーバーに接続
	docker compose exec -it db bash -c "mysql -u root -ppassword"
ps: ## コンテナの起動状況を確認
	docker compose ps
rebuild: ## イメージを再ビルドしてコンテナを起動
	docker compose up -d --build
config: ## コンフィグファイルの検証
	docker compose config
help: ## ヘルプを表示する
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
