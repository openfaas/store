# OpenFaaS Function Store

[![Build Status](https://travis-ci.org/openfaas/store.svg?branch=master)](https://travis-ci.org/openfaas/store)

The Function Store is a curated index of OpenFaaS functions which have been tested by the community and chosen for their experience.

See the [announcement here](https://twitter.com/alexellisuk/status/936160369516654592)

![](https://pbs.twimg.com/media/DP3od15X4AEXoDI.jpg)

## Q&A

* How much does this cost?

It's free

* What's happening conceptually?

The concept is that we will keep a curated list of interesting functions that you can deploy in one-click to your existing OpenFaaS API Gateway using the UI. We do not need access to your API gateway.

We may update the CLI to make use of the store future too.

* Where are functions hosted?

In any public Docker registry whether that be the Docker Hub, Quay or elsewhere.

* Where is the list/definition kept?

We are using a .json file in this repository and GitHub's raw download CDN.

* Why is it called a store if I don't have to pay money?

See also: Google Play Store/Apple App Store.

## Make a submission to the Function Store

If you'd like to make a submission then raise an issue to propose it. This should follow the [CONTRIBUTION guide](https://github.com/openfaas/faas/blob/master/CONTRIBUTING.md) for OpenFaaS.

Here are two example function definitions.

### Version 0.1.0 (`store.json`)

```json
[
  {
    "title": "Inception",
    "description": "This is a forked version of the work by Magnus Erik Hvass Pedersen - it has been re-packaged as an OpenFaaS serverless function.",
    "image": "alexellis/inception",
    "name": "inception",
    "fprocess": "python3 index.py",
    "network": "func_functions",
    "repo_url": "https://github.com/faas-and-furious/inception-function",
    "labels": {
      "com.openfaas.ui.ext": "json"
    },
    "environment": {
      "write_timeout": "30"
    }
  }
]
```

### Version 0.2.0 (`functions.json`)

```json
{
    "version": "0.2.0",
    "functions": [
    {
        "title": "NodeInfo",
        "name": "nodeinfo",
        "description": "Get info about the machine that you're deployed on. Tells CPU count, hostname, OS, and Uptime",
        "images": {
            "arm64": "functions/nodeinfo:arm64",
            "armhf": "functions/nodeinfo:latest-armhf",
            "x86_64": "functions/nodeinfo:latest"
        },
        "labels": {
          "com.openfaas.ui.ext": "json"
        },
        "environment": {
          "write_timeout": "30"
        },
        "fprocess": "node main.js",
        "network": "func_functions",
        "repo_url": "https://github.com/openfaas/faas/tree/master/sample-functions/NodeInfo"
    }
  ]
}
```

### See also:

* `labels`

You can set the file extension used by the UI to download a result from your function i.e. csv/mp3/txt

* `environment`

Set timeouts etc

# OpenFaaS Template Store

The Template Store contains all the templates from OpenFaaS and [OpenFaaS-Incubator](https://github.com/openfaas-incubator) organizations, along with user-defined templates which have been approved by the community.

## How to submit to the Template Store

If you'd like to see your template in the official store follow these steps:

1. Open an issue to propose the template and include a link to your template repository. This should follow the [CONTRIBUTION guide](https://github.com/openfaas/faas/blob/master/CONTRIBUTING.md) for OpenFaaS.
2. Await feedback on, and subsequent approval of, your proposal from the community.
3. Add your template to the `templates.json` file. Here is example of a template definition:
```
    {
        "template": "go",
        "platform": "x86_64",
        "language": "Go",
        "source": "openfaas",
        "description": "Classic Golang template",
        "repo": "https://github.com/openfaas/templates",
        "official": "true"
    },
```
4. Open PR for your template to be merged in the Template Store

Once merged you can see your template displayed by typing `faas-cli template store list` in the terminal.

## Templates created by the community:

Those are the custom templates created by the community:

* [Rust template](https://github.com/booyaa/openfaas-rust-template) by [booyaa](https://github.com/booyaa/)
* [Crystal template](https://github.com/tpei/crystal_openfaas) by [tpei](https://github.com/tpei/)
* [C# HTTP template](https://github.com/distantcam/csharp-httprequest-template) by [distantcam](https://github.com/distantcam/)