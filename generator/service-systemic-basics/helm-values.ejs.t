---
to: .helm/values.yaml
---

# Default values for .helm.
# This is a YAML-formatted file.
# Declare variables to be passed into your templates.

image:
  repository: ilwebshops.azurecr.io/infinitaslearning/<%= h.inflection.dasherize(npm_package_name) %>
  tag: latest
  pullPolicy: Always

nameOverride: ""
fullnameOverride: "<%= h.inflection.dasherize(npm_package_name) %>"

environment:
  name: test
  hasSecret: false

service:
  type: ClusterIP
  port: 80

ingress:
  enabled: false
  annotations: {}
    # kubernetes.io/ingress.class: nginx
    # kubernetes.io/tls-acme: "true"
  path: /
  hosts:
    - chart-example.local
  tls: []
  #  - secretName: chart-example-tls
  #    hosts:
  #      - chart-example.local

resources:
  # We usually recommend not to specify default resources and to leave this as a conscious
  # choice for the user. This also increases chances charts run on environments with little
  # resources, such as Minikube. If you do want to specify resources, uncomment the following
  # lines, adjust them as necessary, and remove the curly braces after 'resources:'.
  limits:
    cpu: 400m
    memory: 512Mi
  requests:
    cpu: 200m
    memory: 128Mi

nodeSelector: {}

tolerations: []

affinity: {}