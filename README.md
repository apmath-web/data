# data
The database migrations and database docker image

## Как обновить репозиторий
- клонировать репозиторий: `git clone https://github.com/apmath-web/data`
- обновить сабмодули: `git submodule foreach git pull origin dev`
- закомитить: `git commit -a'
- запушить: `git push origin master`

## Как запустить все систему
- обновить сабмодули: `git submodule foreach git pull origin dev`
- запустить docker: `docker-compose up  --build -d`
- _система работает_
- выключить систему: `docker-compose down`

## Порты сервисов
- client 8080
- currency 8081
- expenses 8082
