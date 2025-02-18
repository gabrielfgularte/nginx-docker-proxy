up:
	./openssl.sh
	docker-compose up --build -d
	make logs

down:
	docker-compose down -v

logs:
	docker-compose logs -f nginx

reset:
	make down
	make up
