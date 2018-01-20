# CloudFlare API - Python

The documentation for the API can be found at https://api.cloudflare.com, I will try to update this as soon as possible when new features are added to the API. If I miss one please submit a pull request.

## Installation

Installation should be done via `pip`

```shell
pip install -r requirements.txt
```

### Configuration

Update configurations with CloudFlare `tkn` and `email` address:

```
[cloudflare]
tkn = <cloudflare-token>
email = <email-address>
```

### Usage

See help section:

```shell
docker run -e "tkn=<token>" -e "email=<email>" saidsef/cloudflare -h

Options:
  -h, --help            show this help message and exit
  -s SITE, --site=SITE  site name
  -t TASK, --task=TASK  task name [all,devmode,purge,file_purge]
  -u URL, --url=URL     url name

```

```shell
docker run -e "tkn=<token>" -e "email=<email>" saidsef/cloudflare -s abc.com -t purge -u /this-is-a-url
```
