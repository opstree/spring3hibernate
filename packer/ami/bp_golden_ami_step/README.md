# bp_golden_ami_step
I'll let people to create golden ami via this step

## Setup
* Clone the code available at [spring3hibernate](https://github.com/opstree/spring3hibernate)
* Build the docker image

```
git submodule init
git submodule update
docker build -t ot/org-golden-ami:0.0.1 .
```

* Do local testing via image only

```
# upload with default 
docker run -it --rm -v $PWD:/src -e WORKSPACE=/src -e CODEBASE_DIR=/ ot/org-golden-ami:0.0.1

```