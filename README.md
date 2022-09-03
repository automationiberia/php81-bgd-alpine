

## Example 

```bash
$ podman build -t php81-bgd-alpine .
$ podman run --name bgd -p8080:8080 -itd php81-bgd-alpine
$ podman exec -it bgd bash

```


