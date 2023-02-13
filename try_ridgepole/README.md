# README

ridgepoleを試してみる場所

### Usage

* docker-compose build  
まずは
* docker-compose up -d  
ridgepoleのコンテナは立ち上がりません
* docker-compose exec app rails db:drop db:create db:migrate db:seed
rails db:resetでも
* make export_schemafile
db/Schemafileをダンプ
* make migrate
ridgepoleでmigrate
* make migrate_dry_run
migrateをdry_run

### 公式  
https://github.com/ridgepole/ridgepole
