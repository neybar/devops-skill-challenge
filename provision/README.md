Simple Ansible playbook for setting up Boolio.

```sh
$ ansible-playbook -i hosts -kK playbook.yaml
```


Just for kicks I stood up a Nginx proxy infront of the docker container.  Nginx will proxy to port 8080, which is mapped to port 5000 in the container.

Note: there seems to be a problem with the booleans.io API service that this project is based on, so you can get the index page to load, but following operations will fail.