---
to: .helm/templates/env/secrets.yaml
---
{{- if .Values.environment.hasSecret -}}
apiVersion: v1
kind: Secret
metadata:
  name: {{ .Chart.Name }}
type: Opaque
stringData:
  AZURE_SERVICE_BUS_CONNECTION_STRING: "${ServicesAzureServiceBusConnectionString}"
{{- end }}