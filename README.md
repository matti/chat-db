# chat-db

## run

```shell
echo "{}" > app/commands.json
echo "{}" > app/state.json

docker compose up --build --force-recreate
```

## shell

```shell
docker compose exec app bash
```

## run

```shell
docker compose exec app /app/entrypoint.sh run
```
