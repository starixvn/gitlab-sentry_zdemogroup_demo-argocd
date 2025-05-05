{{/*
Generate dockerconfigjson
*/}}
{{- define "dockerconfigjson" }}
{{- with .Values.registry }}
{{- printf "{\"auths\":{\"%s\":{\"username\":\"%s\",\"password\":\"%s\",\"auth\":\"%s\"}}}" ((.baseUrl | urlParse).host) .username .password (printf "%s:%s" .username .password | b64enc) | b64enc }}
{{- end }}
{{- end }}