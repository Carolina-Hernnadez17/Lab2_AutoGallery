# AutoGallery

AutoGallery es una aplicación Ruby on Rails con Docker y MySQL para administrar marcas, vehículos y fotografías de autos. La interfaz usa Bootstrap y está pensada como una galería visual.

## Requisitos

Antes de empezar, instala lo siguiente:

* Docker Desktop
* VS Code
* TablePlus

## Estructura del proyecto

* `app/models` contiene `Marca`, `Vehiculo` y `Fotografia`.
* `app/controllers` contiene los controladores para listar y crear registros.
* `app/views` contiene las pantallas HTML ERB.
* `db/migrate` contiene las migraciones.
* `db/seeds.rb` carga datos de prueba.
* `docker-compose.yml` levanta MySQL y Rails.
* `.env` guarda las variables de entorno locales.

## Archivos importantes

* [Dockerfile](Dockerfile): define la imagen de desarrollo de Rails.
* [docker-compose.yml](docker-compose.yml): levanta MySQL y la app web.
* [config/database.yml](config/database.yml): conecta Rails con MySQL.
* [app/views/layouts/application.html.erb](app/views/layouts/application.html.erb): carga Bootstrap y la navbar.
* [db/seeds.rb](db/seeds.rb): inserta marcas, vehículos y fotografías.

## Configuración inicial

1. Abre la carpeta del proyecto en VS Code.
2. Verifica que Docker Desktop esté encendido.
3. Copia `.env.example` a `.env` si todavía no existe.
4. Revisa que el archivo `.env` tenga estas credenciales:

```env
MYSQL_ROOT_PASSWORD=root
MYSQL_ROOT_HOST=%
MYSQL_DATABASE=carrosdb
MYSQL_USER=autogallery
MYSQL_PASSWORD=autogallery123
DB_HOST=db
DB_PORT=3306
DB_NAME=carrosdb
DB_TEST_NAME=carrosdb_test
DB_USERNAME=autogallery
DB_PASSWORD=autogallery123
```

## Instalación paso a paso

1. Construye las imágenes:

```bash
docker compose build
```

2. Levanta MySQL y Rails:

```bash
docker compose up -d db web
```

3. Crea la base y aplica las migraciones:

```bash
docker compose exec web bin/rails db:migrate
```

4. Carga los datos de prueba:

```bash
docker compose exec web bin/rails db:seed
```

5. Abre la aplicación:

```text
http://localhost:3000
```

## TablePlus

Para conectarte desde TablePlus usa estos datos:

* Host: `127.0.0.1`
* Port: `3307`
* User: `autogallery`
* Password: `autogallery123`
* Database: `carrosdb`

Si TablePlus no conecta, primero asegúrate de que el contenedor MySQL esté arriba:

```bash
docker compose ps
```

## Crear datos desde la interfaz

La app ya permite crear registros desde el navegador:

1. En la página principal puedes entrar a `Nueva marca`.
2. Dentro de una marca puedes crear vehículos.
3. Dentro de un vehículo puedes agregar fotografías.

## Comandos útiles

* Iniciar todo: `docker compose up -d`
* Ver estado: `docker compose ps`
* Ver logs: `docker compose logs -f web`
* Reiniciar la app: `docker compose restart web`
* Borrar volúmenes y empezar de cero: `docker compose down -v`

## Si algo falla

* Si MySQL no levanta, revisa que el puerto `3307` no esté ocupado.
* Si Rails no arranca, reconstruye la imagen con `docker compose build --no-cache`.
* Si cambias `.env`, recrea los contenedores con `docker compose up -d --force-recreate`.

## Resultado esperado

Al final debes ver:

* Una portada con tarjetas de marcas.
* Una vista de vehículos por marca.
* Una vista de fotografías por vehículo.
* Formularios para crear marcas, vehículos y fotografías.
