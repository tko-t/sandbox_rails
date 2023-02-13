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

### 小ネタ

#### ALTER TABLEをテーブル単位のDDLにまとめる
`--bulk-change` オプションを使う。
しかしindexの変更は分けたほうが良いという説もある

#### --bulk-changeを使いつつindexだけは個別にALTERする
indexだけは `execute` で記述する。
`execute("ALTER TABLE table_name ADD INDEX index_name (column_name)")`
他にやり方あるのかな？

