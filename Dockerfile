FROM caddy:builder-alpine as builder

RUN xcaddy build \
--with github.com/caddy-dns/cloudflare \
--with github.com/lolPants/caddy-requestid

FROM caddy:alpine

RUN apk --no-cache add curl

COPY /caddy/Caddyfile /etc/caddy/Caddyfile

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
