---
to: .helm/templates/env/production.yaml
---
{{- if eq .Values.environment.name "production" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Chart.Name }}
data:
  NODE_ENV: production
  SERVICE_ENV: {{ .Values.environment.name }}
{{- end }}