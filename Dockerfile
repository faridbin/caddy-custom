FROM caddy:2.5.2-builder-alpine as builder

RUN xcaddy build \
--with github.com/caddy-dns/cloudflare \
--with github.com/lolPants/caddy-requestid

FROM caddy:2.5.2-alpine

RUN apk --no-cache add curl

COPY /caddy/Caddyfile /etc/caddy/Caddyfile

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
