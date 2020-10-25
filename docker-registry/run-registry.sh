docker run -d -p 5000:5000 \
-v /registry/images:/var/lib/registry \
-v /registry/certs:/certs \
-e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt \
-e REGISTRY_HTTP_TLS_KEY=/certs/domain.key \
--restart on-failure \
--name myregistry \
docker.io/registry
