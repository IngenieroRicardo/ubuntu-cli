# ubuntu-cli
localhost:8006

### Ejecutar con Docker compose:
```bash
sudo docker-compose up
```

### Compilar y Ejecutar Imagen Docker:
```bash
sudo docker build -t ubuntu-cli .
sudo docker run -d -p 8006:7681 --name ubuntu-cli ubuntu-cli
```
