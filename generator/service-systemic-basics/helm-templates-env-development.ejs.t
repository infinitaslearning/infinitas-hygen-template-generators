---
to: .helm/templates/env/development.yaml
---
{{- if eq .Values.environment.name "development" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Chart.Name }}
data:
  NODE_ENV: production
  SERVICE_ENV: {{ .Values.environment.name }}
{{- end }}