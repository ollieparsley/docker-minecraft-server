# docker-minecraft-server
Minecraft server docker images

## Usage

For basic Minecraft server usage you can check out the available images here: https://hub.docker.com/r/ollieparsley/minecraft-server

## Customising

You can customise the minecraft server by using any of the following environment variables to override settings in the `server.properties` folder.

## Versions

These are the supported minecraft versions:

- `1.16.4`
- `1.16.3`
- `1.16.2`
- `1.16.1`
- `1.15.2`
- `1.15.1`

### Environment variables

These are the available variables and their defaults if not set. You can see defaults for each version in `resources/vanilla/<VERSION>`

#### Memory

You can change the mx and ms jvm memory settings using the following 2 environment variables:

```
MC_MEM_MX=1024M
MC_MEM_MS=1024M
```

#### Base

```
MC_ALLOW_FLIGHT=false
MC_ALLOW_NETHER=true
MC_BROADCAST_CONSOLE_TO_OPS=true
MC_BROADCAST_RCON_TO_OPS=true
MC_DIFFICULTY=easy
MC_ENABLE_COMMAND_BLOCK=false
MC_ENABLE_QUERY=false
MC_ENABLE_RCON=false
MC_ENFORCE_WHITELIST=false
MC_FORCE_GAMEMODE=false
MC_FUNCTION_PERMISSION_LEVEL=2
MC_GAMEMODE=survivial
MC_GENERATE_STRUCTURES=true
MC_GENERATOR_SETTINGS=
MC_HARDCORE=false
MC_LEVEL_NAME=Minecraft level name
MC_LEVEL_SEED=minecraft
MC_LEVEL_TYPE=default
MC_MAX_BUILD_HEIGHT=256
MC_MAX_PLAYERS=20
MC_MAX_TICK_TIME=60000
MC_MAX_WORLD_SIZE=29999984
MC_MOTD=Welcome to the server
MC_NETWORK_COMPRESSION_THRESHOLD=256
MC_ONLINE_MODE=true
MC_OP_PERMISSION_LEVEL=4
MC_PLAYER_IDLE_TIMEOUT=0
MC_PREVENT_PROXY_CONNECTIONS=false
MC_PVP=true
MC_QUERY_PORT=25565
MC_RCON_PASSWORD=
MC_RCON_PORT=25575
MC_RESOURCE_PACK=
MC_RESOURCE_PACK_SHA1=
MC_SERVER_IP=
MC_SERVER_PORT=25565
MC_SNOOPER_ENABLED=true
MC_SPAWN_ANIMALS=true
MC_SPAWN_MONSTERS=true
MC_SPAWN_NPCS=true
MC_SPAWN_PROTECTION=16
MC_USE_NATIVE_TRANSPORT=true
MC_VIEW_DISTANCE=10
MC_WHITE_LIST=false

```

#### Added in 1.16.2

```
MC_RATE_LIMIT=0
```

