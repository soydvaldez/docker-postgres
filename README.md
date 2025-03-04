# Servidor Postgres Dockerizado

**Este repositorio tiene la estructura:**

<div style=" display: flex; flex-direction: row;align-items: center;">
 <img src="image.png" alt="alt text" width="20" height="20">
 <span style="font-size: 16px; margin-left:10px;font-weight: bold">docker-postgres:</span>
 <span style="font-size: 16px; margin-left:5px">
 Es la raíz del espacio de trabajo.
</span>
</div>

<div style="display: flex; flex-direction: row;align-items: center;">
 <img src="image.png" alt="alt text" width="20" height="20">
 <span style="font-size: 16px; margin-left:10px;font-weight: bold">sql:</span>
 <span style="font-size: 16px; margin-left:5px">
 Scripts SQL para poblar la base de datos con tablas y registros de users, cuando el servidor este levantando.
</span>
</div>

<div style="display: flex; flex-direction: row;align-items: center; margin-bottom:10px">
 <img src="image-1.png" alt="alt text" width="20" height="20">
 <span style="font-size: 16px; margin-left:10px;font-weight: bold">deploy.sh:</span>
 <span style="font-size: 16px; margin-left:5px">
 Bash Script para desplegar el servidor.
</span>
</div>

### Utileria para desplegar un servidor postgresql en contenedor docker.
**Requisitos**: Debes de tener instalado docker en tu maquina.

**Descripción**: El servidor se inicializará con una base de datos llamada **mydatabase** junto con una tabla **users** junto con **5 registros insertados**.

**Nota:** Si deseas agregar tablas adicionales o crear nuevos registros,  edita el archivo: **sql/users.sql**

## Como levantar el servicio?

### Paso 1.- Descargar el repositorio:

```bash
# Clonamos el repositorio
git clone https://github.com/soydvaldez/docker-postgres.git

# Nos posicionamos sobre la raíz del espacio de trabajo:
cd docker-postgres/
```

### Paso 2.- Levantar el servicio 
  - 2.1 Copiando o pegando el comando en la terminal
  - 2.2 Mediante el script **deploy.sh**

#### 2.1 Copiando o pegando el comando en la terminal
```bash
CONTAINER_NAME=db-postgres

docker run \
  --name ${CONTAINER_NAME} \     # Asigna un nombre al contenedor
  -p 5432:5432 \
  -e POSTGRES_USER:postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=mydatabase \
  -v ./sql/users.sql:/docker-entrypoint-initdb.d/users.sql \
  -it --rm \
  -d \                           # Para levantar en segundo plano
  postgres:17-alpine
```

#### 2.2 Mediante el script **deploy.sh**

```bash
# Dar privilegios del ejecuccion para el usuario actual:
chmod u+x deploy.sh

# Correr el script:
bash deploy.sh
```

### Paso 3.- Verificamos los logs del servidor para verificar que haya levantado correctamente
```bash
 CONTAINER_NAME=db-postgres
 
 docker logs -f ${CONTAINER_NAME}
```

Con estos sencillos pasos tendremos un servidor corriendo por el puerto 5432 en localhost

### Paso 4.- Realizamos una conexion con psql (o otro cliente de tu preferencias)
```bash 
 psql -h localhost -U postgres --dbname=mydatabase   # Password: postgres
```