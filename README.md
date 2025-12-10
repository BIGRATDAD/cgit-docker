# cgit-docker

### About
cgit is a CGI web interface for git scm developed by the guy who created wireguard. You can read more on the cgit project [here](https://git.zx2c4.com/cgit/about).  
  
There's no official docker container for cgit. However, this will you to easily deploy it.

### Installation
You can use Docker Compose to create an instance of the server.

```yaml
name: 'cgit-docker'

services:
  cgit:
    container_name: cgit-docker
    image: ratdad/cgit-docker:latest
    ports:
      - 80:80
    volumes:
      - ./etc/httpd/conf/httpd.conf:/etc/httpd/conf/httpd.conf # apply custom httpd config
      - ./etc/cgitrc:/etc/cgitrc # apply custom cgit runtime config
      - ./opt/highlight.sh:/opt/highlight.sh # use a custom highlight script
      - ./srv/git/:/srv/git # mount the dir cgit reads for repositories
```
