# data
The database migrations and database docker image

## Как обновить репозиторий
- клонировать репозиторий: `git clone https://github.com/apmath-web/data`
- забрать репозитории сабмодулей: `git submodule update --init --recursive`
- обновить сабмодули: `git submodule foreach git pull origin dev`
- закомитить: `git commit -a`
- запушить: `git push origin master`

## Как запустить все систему
- обновить сабмодули: `git submodule foreach git pull origin dev`
- запустить docker: `docker-compose up  --build -d`
- _система работает_
- выключить систему: `docker-compose down`

## Управление миграциями
Для запуска процедуры миграции необходимо выполнить: `docker-compose run migrate COMMAND`

Где `COMMAND` одно из 
- new       # generate a new migration file
- up        # create the database (if it does not already exist) and run any pending migrations
- create    # create the database
- drop      # drop the database
- migrate   # run any pending migrations
- rollback  # roll back the most recent migration
- down      # alias for rollback

Пример создания новой миграции:
`docker-compose run migrate new create_clients_table`

Файл создается под пользователем эксплуатирующим docker, поэтому есть ненулевая вероятность что после создания будет необходимо поменять владельца, например: `sudo chown jumper:jumper sql/20190409181921_create_clients_table.sql`

Все подробности тут https://github.com/amacneil/dbmate

## Code style
Придерживаемся https://www.sqlstyle.guide/

С некоторыми изменениями:
- id в качестве идентифицирующего поля в таблице
- именование всех сущностей - underscore_case
- все SQL ключевые слова UPPER CASE

## Порты сервисов
- clients 8080
- currency 8081
- expenses 8082
- loans 8083
- applications 8084
- calculations 8085
