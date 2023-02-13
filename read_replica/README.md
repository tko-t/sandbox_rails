# README

疑似リードレプリカ環境をローカルに作ってみました。
運用環境は実際のhostを指定すればよろしいかと。

```
$ docker-compose build
$ docker-compose up -d
$ docker-compose exec app rails db:reset
$ curl GET -c cookie.txt -b cookie.txt http://localhost:3000/dogs
$ curl POST -c cookie.txt -b cookie.txt http://localhost:3000/dogs -d "dog[name]=ダルメシアン"
```
