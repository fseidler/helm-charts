{{/* vim: set filetype=mustache: */}}

{{- define "cadence.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "cadence.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "cadence.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "cadence.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "cadence.commonlabels" -}}
app.kubernetes.io/name: {{ include "cadence.name" . }}
helm.sh/chart: {{ include "cadence.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | replace "+" "_" }}
app.kubernetes.io/part-of: {{ .Chart.Name }}
{{- end -}}

{{- define "postgres.endpoint" -}}
{{ .Values.postgres.endpoint | default (printf "postgres-postgresql.%s.svc.cluster.local" $.Release.Namespace)  }}
{{- end -}}

{{- define "postgres.credentials.username" -}}
{{ .Values.postgres.credentials.username | default "postgres"  }}
{{- end -}}

{{- define "postgres.credentials.password" -}}
{{ .Values.postgres.credentials.password | default "postgres"  }}
{{- end -}}

{{- define "postgres.port" -}}
{{ .Values.postgres.port | default "5432"  }}
{{- end -}}
