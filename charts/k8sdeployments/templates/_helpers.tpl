{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "k8sdeployments.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "k8sdeployments.labels" -}}
helm.sh/chart: {{ include "k8sdeployments.chart" . }}
{{ include "k8sdeployments.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "k8sdeployments.selectorLabels" -}}
app.kubernetes.io/name: {{ include "k8sdeployments.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

