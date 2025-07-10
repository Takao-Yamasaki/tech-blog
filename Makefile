.DEFAULT_GOAL := help

new-api: ## Railsプロジェクトを新規作成
	docker compose exec api rails _7.1.0_ new . --api
new-web: ## Reactプロジェクトを新規作成
	docker compose exec web npx create-react-app .
bundle-install: ## bundle installを実行
	docker compose exec api bundle install
add-react-router: ## React Routerをインストール
	docker compose exec web yarn add react-router-dom
add-axios: ## axiosをインストール
	docker compose exec web yarn add axios
create: ## db:createを実行
	docker compose exec api rails db:create
migrate: ## db:migrationを実行
	docker compose exec api rails db:migrate
healthcheck: ## healthcheckを実行
	curl -I localhost:3010/health_check
up: ## コンテナを起動
	docker compose up -d
down:  ## コンテナを停止
	docker compose down
nginx: ## nginxコンテナに入る
	docker compose exec -it nginx /bin/sh
web: ## webコンテナに入る
	docker compose exec -it web /bin/sh
api: ## apiコンテナに入る
	docker compose exec -it api bash
db: ## MySQLサーバーに接続
	docker compose exec -it db bash -c "mysql -u root -ppassword"
ps: ## コンテナの起動状況を確認
	docker compose ps
rebuild: ## 全イメージを再ビルドしてコンテナを起動
	docker compose up -d --build
rebuild-nginx: ## nginxイメージを再ビルドしてコンテナを起動
	docker compose up nginx -d --build
rebuild-web: ## webイメージを再ビルドしてコンテナを起動
	docker compose up web -d --build
rebuild-api: ## apiイメージを再ビルドしてコンテナを起動
	docker compose up api -d --build
rebuild-db: ## dbイメージを再ビルドしてコンテナを起動
	docker compose up db -d --build
logs: ## 全コンテナのログ確認
	docker compose logs
logs-nginx: ## nginxコンテナのログ確認
	docker compose logs nginx
logs-web: ## webコンテナのログ確認
	docker compose logs web
logs-api: ## apiコンテナのログ確認
	docker compose logs api
logs-db: ## dbコンテナのログ確認
	docker compose logs db
config: ## コンフィグファイルの検証
	docker compose config
help: ## ヘルプを表示する
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
