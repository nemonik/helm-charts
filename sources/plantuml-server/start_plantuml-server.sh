#!/bin/bash

# Copyright (C) 2020 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

# Intall PlantUML-Server

# PlantUML-Server installed via Helm chart out out of this repo
helm install plantuml-server . --namespace plantuml-server --create-namespace -f example-values.yaml

# PlantUML-Server installed via Helm chart
# helm repo add nemonik https://nemonik.github.io/helm-charts/
# helm repo update
# helm install plantuml-server nemonik/plantuml-server --namespace plantuml-server --create-namespace -f example-value.yaml 

