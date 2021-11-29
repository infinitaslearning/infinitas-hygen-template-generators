---
to: .helm/Chart.yaml
---

apiVersion: v1
appVersion: "1.0"
description: "<%= npm_package_description %>"
name: <%= h.inflection.dasherize(npm_package_name) %>
version: 0.1.0
icon: https://avatars.githubusercontent.com/u/38781119?s=200&v=4
