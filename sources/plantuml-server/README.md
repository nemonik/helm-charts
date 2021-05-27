# plantuml-sever-helm

A helm chart for PlantUML-Server

## Requirements

Written for Helm 3.

## Example use

You can clone this repo, enter the repository folder and then execute something like the [start_plantuml-server.sh](start_plantuml-server.sh):

```
./start_plantuml-server.sh
```

The script will spin up PlantUML-Server using the example [example_values.yaml](example_values.yaml) values file.  You will need
to provide your own if you want to configure other settings, and ingress, etc.  Look at the [values.yaml](values.yaml) file
for what to place in your own.

## To install via my chart repository

```
helm repo add nemonik https://nemonik.github.io/helm-charts/
helm repo update
helm search repo plantuml-server
wget https://raw.githubusercontent.com/nemonik/plantuml-server-helm/master/example-values.yaml
helm install plantuml-server nemonik/plantuml-server --namespace plantuml-server --create-namespace -f example-values.yaml
watch -n 15 kubectl get pods -n plantuml-server
```

## Accessing PlantUML-Server

If you've spun up PlantUML-Server using the [start_plantuml-server.sh](start_plantuml-server.sh) script, you can access it in your
browser via exposing via `kubectl port-forward` like so

```
kubectl port-forward -n plantuml-server service/plantuml-server 8080:80
```

then open in your browser [http://localhost:8080](http://localhost:8080)

Or configure an ingress via your values file by adding an `ingress` configuration under
in your values file likes so:

```
ingress:
  enabled: true
  annotations:
    traefik.ingress.kubernetes.io/router.entrypoints: web
  hosts:
    - host: plantuml.example.com
      paths:
        -  "/"
  tls: []
``` 

This example uses Traefik to expose the ingress.  Configuring Traefik is out of scope of this 
readme.  

In my forthcoming updated Hands-on DevOps class I do this exposing PlantUML-Server over https, so when that
drops you can find some insight how to do so there.

## License

3-Clause BSD License

## Author Information

Michael Joseph Walsh <mjwalsh@nemonik.com>
