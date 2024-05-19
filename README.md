
# Nostr-JampsV3

This is the Nsotr relay network project V3 with 3 relays for supply chain. This project currently contains 3 relays that have been chosen to parse data into relays in a supply chain environment. 


## [NIPs](https://github.com/nostr-protocol/nips) that are supported by this relay network

- [x] NIP-01: Basic protocol for all supply chain needs
- [x] NIP-02: Contact list and petnames in identifying supply chain users.
- [x] NIP-04: Encrypted Direct messaging for supply chain customers and merchants
- [x] NIP-09: Event deletion
- [x] NIP-11: Relay information document
- [x] NIP-12: Generic tag queries
- [x] NIP-15: End of Stored Events Notice
- [x] NIP-16: Event Treatment
- [x] NIP-20: Command Results
- [x] NIP-22: Event `created_at` Limits
- [x] NIP-26: Delegated Event Signing
- [x] NIP-28: Public Chat
- [x] NIP-33: Parameterized Replaceable Events
- [x] NIP-40: Expiration Timestamp
- [x] NIP-42: Authentication of clients to relays
- [x] NIP-45: Counting results. [experimental](#count)
- [x] NIP-50: Keywords filter. [experimental](#search)

## Prepare and config

Clone this project into your IDE.

```shell

git clone https://github.com/1845ajy/nostr.git
cd nostr
```

## Quick Start (using Shell)

You need to have Docker installed and update in your system for this project 

cd into the directory for the nostr project 

Make sure your Bash has executable permissions. If it doesn't, you can grant execute permissions using the chmod command:

```shell
chmod +x build_and_run.sh
```

Run the bash script 

```shell
./run_relays.sh
```
Now all 3 relays are running, you can check the status of the relays using ```docker ps ``` command. 

Stop all relays using command 

```shell
./stop_relays.sh
```


## Quick Start (using docker)

Make sure docker is installed in your system and updated 

The provided docker compose file will build and complile the project. IF you wish to change the bind mounts you can edit the bind mounts in the docker-compose.yml file to the bind mounts you want. Currently both the relays (containers) have been bound to 8080 port and the host is connected to 7001 (nostr-rs-relay) ,7002(rnostr) relay and 7003 (pyrelay)  

The command below will create docker images and start all the relays (containers) ⚠️ make sure to cd into the project first

```shell
docker-compose up -d
```

All the relays should be up and running now, you can access the relays in your browser at http://localhost:7001/, http://localhost:7002/
and http://localhost:7003/

following command will stop all the realays 

```shell
docker-compose down
```

if you want to stop and remove all volumes you can use the -v flag 

```shell
docker-compose down -v
```


## Check the SQlite database of nostr-rs-relay

make sure you have sqlite installed in your computer

```shell
cd \Nostr\nostr-rs-relay
```
you can look in the databse using the follwing commands

NOTE : ⚠️ carefull with this one as you might damage the db

```shell
sqlite3 nostr.db

sqlite> .databases
sqlite> .tables
sqlite> select * from event;
sqlite> select count(*) from event;
```

Connect your client
If you made it so far, congrats !!

## Connecting to a client

These relays are now running in this host system and can be accessed only though the host system.⚠️ So any clients that needs to be conncted to this relay needs to be in the host computer and cannot be accessed though the internet. 

Now is time to connect your client and see it at work !!

connect your client to 

- `ws://localhost:7001/`
- `ws://localhost:7002/`
- `ws://localhost:7003/`

 you can add the client to other relays you might have put in the projct and would be aviable in a similar way with the ports you have setup. Send some messages, see the log get them in real time and find them in the database.

## Adding additional relays

You can add additional relays to this relay network. Simply add the relay into the notr main folder and create the docker file within the new relay folder. Then add your relay to the all the executable methods 

If the relay you want to add has its own docker container, its recommended you modify the bash script to run the docker container seperately. 

If the relay doesnt have its own docker compose, and has its own dockerfile only, you can change the names of the relays as you wish and the name of the docker files as you wish as well. Following example shows you how edit the main docker file.

```shell
version: '3'

services:
  nostr-rs-relay:
    build: ./nostr-rs-relay
    ports:
      - "7001:8080"

  rnostr:
    build: ./rnostr
    ports:
      - "7002:8080"

  relay3:
    build: ./path_to_relay3_dockerfile
    ports:
      - "7003:8080"

  relay4:
    build: ./path_to_relay4_dockerfile
    ports:
      - "7004:8080"
```
## Lisence 


## External Documentation and Links

Relays that have been tested and discarded




- [Bucket](https://github.com/coracle-social/bucket)![stars](https://img.shields.io/github/stars/coracle-social/bucket.svg?style=social) - in-memory-only nodejs relay for testing/hacking on. Stupid simple, <100 LOC.
- [cagliostr](https://github.com/mattn/cagliostr)![stars](https://img.shields.io/github/stars/mattn/cagliostr.svg?style=social) - Faster Nostr relay in C++ backend by sqlite3.
- [gnost-relay](https://github.com/barkyq/gnost-relay) ![stars](https://img.shields.io/github/stars/barkyq/gnost-relay.svg?style=social) - nostr relay written in go backed by postgresql database.
- [knostr](https://github.com/lpicanco/knostr)![stars](https://img.shields.io/github/stars/lpicanco/knostr.svg?style=social) - a nostr relay implemented in Kotlin with support for Postgres and metrics(micrometer).
- [NNostr](https://github.com/Kukks/NNostr)![stars](https://img.shields.io/github/stars/Kukks/NNostr.svg?style=social) - a C# relay
- [nostr_relay](https://code.pobblelabs.org/fossil/nostr_relay/) - a nostr relay written in python, backed by SQLite
- [nostr-filter-relay](https://github.com/atrifat/nostr-filter-relay)![stars](https://img.shields.io/github/stars/atrifat/nostr-filter-relay.svg?style=social) - A nostr relay docker image package which filter content based on content type (SFW/NSFW), user type, language, hate speech (toxic comment), and various rules.
- [nostr-relay-nestjs](https://github.com/CodyTseng/nostr-relay-nestjs)![stars](https://img.shields.io/github/stars/CodyTseng/nostr-relay-nestjs.svg?style=social) - A Nostr relay with a clear architecture and high test coverage (PostgreSQL, MeiliSearch, NestJS)
- [nostring](https://github.com/xbol0/nostring)![stars](https://img.shields.io/github/stars/xbol0/nostring.svg?style=social) - A Nostr relay written in Deno.
- [NostrPostr Relay](https://github.com/Giszmo/NostrPostr/tree/master/NostrRelay) - a Kotlin Relay supporting both SQLite and Postgresql
- [Nostpy](https://github.com/UTXOnly/nost-py/tree/main)![stars](https://img.shields.io/github/stars/UTXOnly/nost-py.svg?style=social) - An easy to deploy/audit Python relay for beginner relay operators

## Further Improvememnt 

For the improvement of the relay network more research needs to be done on the nips that needs to be
implemented on the relays. https://github.com/hoytech/strfry is a relay that uses LMDB database than a SQlite databse (which is in the nostr rs relay) LMDB databses have high durability and data integrity.So implementing the LMDB databse stucture in the Nostr-rs-relay is recomended. THe rnostr relay in this project is a relay written in rust with a LMBD databse integrated so it would be a great start. PostgreSQL is also another great alternative that can be used in nostr relays.

"# nostr-jamps-v3" 
