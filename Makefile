


image-name=zongmengqi/node-web-app

build:
	docker build -t ${image-name} .
run:
	docker run -p 49160:8080 -d ${image-name}
stop:
	docker stop $$(docker ps -a -q --filter ancestor=${image-name} --format="{{.ID}}")
test:
	curl http://localhost:49160
