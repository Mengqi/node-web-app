###
# guide: https://nodejs.org/en/docs/guides/nodejs-docker-webapp/
# @author mengqi
#

image-name=zongmengqi/node-web-app

build:
	docker build -t ${image-name} .
run:
	docker run -p 49160:8080 -d ${image-name}
stop:
	docker stop $$(docker ps -a -q --filter ancestor=${image-name} --format="{{.ID}}")
rm:
	docker rm $$(docker ps -a -q --filter ancestor=${image-name} --format="{{.ID}}")
clean:
	make stop
	make rm
test:
	curl localhost:49160
logs:
	docker logs $$(docker ps -a -q --filter ancestor=${image-name} --format="{{.ID}}")

