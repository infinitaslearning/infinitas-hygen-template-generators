---
to: .helm/templates/autoscale.yaml
---
apiVersion: autoscaling/v1
kind: HorizontalPodAutoscaler
metadata:
  name: {{ .Release.Name }}
spec:
  maxReplicas: {{ default 1 (.Values.maxReplicas | toString | atoi) }} # define max replica count
  minReplicas: {{ default 1 (.Values.minReplicas | toString | atoi) }} # define min replica count
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: {{ .Release.Name }}
  targetCPUUtilizationPercentage: {{ .Values.cpuPercentScale | default 50 }} # target CPU utilization
