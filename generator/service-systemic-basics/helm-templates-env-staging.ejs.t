---
to: .helm/templates/env/staging.yaml
---
{{- if eq .Values.environment.name "staging" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Chart.Name }}
data:
  NODE_ENV: production
  SERVICE_ENV: {{ .Values.environment.name }}
{{- end }}