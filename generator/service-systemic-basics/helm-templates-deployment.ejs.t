---
to: .helm/templates/deployment.yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include ".helm.fullname" . }}
  labels:
    app.kubernetes.io/name: {{ include ".helm.name" . }}
    helm.sh/chart: {{ include ".helm.chart" . }}
    app.kubernetes.io/instance: {{ .Release.Name }}
    app.kubernetes.io/managed-by: {{ .Release.Service }}
spec:
  replicas: {{ default 1 (.Values.minReplicas | toString | atoi) }}
  selector:
    matchLabels:
      app.kubernetes.io/name: {{ include ".helm.name" . }}
      app.kubernetes.io/instance: {{ .Release.Name }}
  template:
    metadata:
      labels:
        app.kubernetes.io/name: {{ include ".helm.name" . }}
        app.kubernetes.io/instance: {{ .Release.Name }}
    spec:
      imagePullSecrets:
        - name: docker-secret
      containers:
        - name: {{ .Chart.Name }}
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
          imagePullPolicy: {{ .Values.image.pullPolicy }}
          ports:
            - name: http
              containerPort: 4000
              protocol: TCP
          envFrom:
            - configMapRef:
                name: {{ .Chart.Name }}
            - secretRef:
                name: {{ .Chart.Name }}
          livenessProbe:
            httpGet:
              path: /__/manifest
              port: http
          readinessProbe:
            httpGet:
              path: /__/manifest
              port: http
          resources:
{{ toYaml .Values.resources | indent 12 }}
    {{- with .Values.nodeSelector }}
      nodeSelector:
{{ toYaml . | indent 8 }}
    {{- end }}
    {{- with .Values.affinity }}
      affinity:
{{ toYaml . | indent 8 }}
    {{- end }}
    {{- with .Values.tolerations }}
      tolerations:
{{ toYaml . | indent 8 }}
    {{- end }}
