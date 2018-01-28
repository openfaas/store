| Name | Description | Image | Repository |
| --- |:---:|:---:| ---:|
{{ range .StoreList -}}
| {{ .Title }} {{ if .Icon }}<img src="{{ .Icon }}" title="{{ .Title }}" height="32">{{ end }} | {{ .Description }} | {{ .Image }} | [Repository]({{ .RepoUrl }}) |
{{ end }}
