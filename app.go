package main

import (
  "io/ioutil"
  "log"
  "encoding/json"
  "strings"
  "os"
  "text/template"
  "fmt"
)

type StoreSchema struct {
  Icon string `json:"icon"`
  Title string `json:"title"`
  Description string `json:"description"`
  Image string `json:"image"`
  Name string `json:"name"`
  RepoUrl string `json:"repo_url"`
  Labels map[string]string `json:"labels"`
  Environment map[string]string `json:"environment"`
}

func main() {
  if len(os.Args) == 1 {
    fmt.Println("Usage: store <store.json>")
    os.Exit(1)
  }

  file := os.Args[1]
  if data, err :=ioutil.ReadFile(file); err != nil {
    log.Fatal(err)
  } else {
    var store []StoreSchema
    if err := json.Unmarshal(data, &store); err !=nil {
      log.Fatal(err)
    }

    f, err := os.OpenFile(strings.Replace(file, "json", "md", 1), os.O_CREATE|os.O_TRUNC|os.O_WRONLY, 0644)
    if err != nil {
      log.Fatal(err)
    }
    defer f.Close()

    templating, err := template.ParseFiles("template.tpl")
    if err != nil {
      log.Fatal(err)
    }

    if err := templating.Execute(f, struct {
      StoreList []StoreSchema
    }{
      StoreList: store,
    }); err != nil {
      log.Fatal(err)
    }
  }
}
