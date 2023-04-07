#!/bin/bash

# Define the list of services
services=(
  aix
  subfinder
  dnsx
  naabu
  httpx
  nuclei
  uncover
  cloudlist
  proxify
  tlsx
  notify
  chaos-client
  shuffledns
  mapcidr
  interactsh-client
  katana
  asnmap
  simplehttpserver
)

# Define the template for a service
service_template_alpine=$(cat << EOF
\n  %s:
    container_name: %s
    hostname: %s
    build:
      context: ./image_docker
      dockerfile: socle_alpine_Dockerfile
    volumes:
      - ./bin/%s:/root/.pdtm/go/bin/%s
EOF
)
service_template_debian=$(cat << EOF
\n  %s:
    container_name: %s
    hostname: %s
    build:
      context: ./image_docker
      dockerfile: socle_debian_Dockerfile
    volumes:
      - ./bin/%s:/root/.pdtm/go/bin/%s
EOF
)
# Generate the services section of the docker-compose.yml file
services_section=""
for service in "${services[@]}"; do
  if [[ "$service" == "dnsx" || "$service" == "naabu" || "$service" == "proxify" || "$service" == "mapcidr" || "$service" == "asnmap" || "$service" == "simplehttpserver" ]]; then
    service_config=$(printf "$service_template_debian" "$service" "$service" "$service" "$service" "$service")
  else
    service_config=$(printf "$service_template_alpine" "$service" "$service" "$service" "$service" "$service")
  fi
    services_section+="$service_config"
done

# Generate the complete docker-compose.yml file
docker_compose=$(cat << EOF
version: '3'
services:
$services_section
EOF
)

# Save the docker-compose.yml file
echo "$docker_compose" > docker-compose.yml
