## README

### setup

```
$ docker-compose build
$ docker-compose up -d
$ docker-compose exec app rails db:setup
```

### db_mainに接続

```
$ docker-compose exec app rails db --db main
```

### db_subに接続

```
$ docker-compose exec app rails db --db sub
```
