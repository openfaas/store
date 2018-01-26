Store Index

{{ range .StoreList }}
* {{ .Title }} {{ if .Icon }}<img src="{{ .Icon }}" title="{{ .Title }}" height="32">{{ end }}

  {{ .Description }}<br/>
  {{ .Image }}<br/>
  [Repository]({{ .RepoUrl }})
{{ end }}

Store Table

| Name | Description | Image | Repository |
| --- |:---:|:---:| ---:|
{{ range .StoreList -}}
| {{ .Title }} {{ if .Icon }}<img src="{{ .Icon }}" title="{{ .Title }}" height="32">{{ end }} | {{ .Description }} | {{ .Image }} | [Repository]({{ .RepoUrl }}) |
{{ end }}
