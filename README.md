# docker-radicale-htpasswd

Extends [https://github.com/tomsquest/docker-radicale](https://github.com/tomsquest/docker-radicale) by allowing the user to setup a htpasswd file on container start.

## Environment variables
- `RADICALE_NUM_USERS=1` how many users you want to set up
- `RADICALE_USER1=testuser` The first user's username
- `RADICALE_PASS1=testpass` The first user's password
- `...`
- `RADICALE_USER<num>=` Replace <num> with an integer number
- `RADICALE_PASS<num>=` Replace <num> with an integer number
