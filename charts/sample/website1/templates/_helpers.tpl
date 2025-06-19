{{/*
Read file content from configs directory
Usage: {{ include "readConfigFile" (dict "root" . "file" "appsettings.json") }}
*/}}
{{- define "readConfigFile" -}}
{{- $root := .root -}}
{{- $file := .file -}}
{{- $root.Files.Get (printf "configs/%s" $file) | nindent 4 -}}
{{- end -}}

{{/*
Read appsettings.json content (backward compatibility)
*/}}
{{- define "website1.appsettings" -}}
{{- include "readConfigFile" (dict "root" . "file" "appsettings.json") -}}
{{- end -}} 