# RUN and EXPOSE

- Set up ngix configuration to listen at port:
  - 8081
  - 8082
  - 8083

```
# Build
docker build -t demo-expose:v1 .

# RUN
docker run --name expose-app -p 8080:80 -p 8081:8081 -p 8082:8082 -d demo-expose:v1

# Acces site
http://localhost:8080/
http://localhost:8081/
http://localhost:8082/
```