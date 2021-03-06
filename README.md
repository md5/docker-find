# docker-find

Utility to run [`find(1)`](http://www.gnu.org/software/findutils/manual/html_mono/find.html#Invoking-find) inside each layer of a Docker image or container. Useful if you want to figure out which layer of a Docker image contributed a particular file or directory.

**Note**: `docker-find` currently supports only AUFS-based Docker installations. Support for other storage drivers may be added in future revisions.

## Usage

If you have a shell directly on the Docker host, install `docker-find` somewhere on your `PATH` and use it like you would use `find` (include `sudo` if you are not running as `root`):

    docker-find CONTAINER_OR_IMAGE / -name '*.sh'

If you would like to find files on a remote Docker host (including Docker `machine` or `boot2docker`), you can run `docker-find` from its Docker image:

    docker run -it --rm \
        -v /var/lib/docker:/var/lib/docker:ro \
        -v /var/run/docker.sock:/tmp/docker.sock \
        mdillon/docker-find CONTAINER_OR_IMAGE / -name '*.sh'

This can be added to your `.bash_profile` or equivalent to make it possible to use the first form with a remote host as well:

```shell
docker-find() {
	docker run -it --rm -v /var/run/docker.sock:/tmp/docker.sock -v /var/lib/docker:/var/lib/docker:ro mdillon/docker-find "$@"
}
```

## License

MIT
