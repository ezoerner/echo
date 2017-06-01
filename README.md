# echo
Experimentation with FaaS (Functions as a Service) implemented in Haskell.

If you don't have Docker already installed, install [Docker](https://docs.docker.com/engine/installation/) first. Note that docker
integration with `stack` does not currently work on Windows (see [#2421](https://github.com/commercialhaskell/stack/issues/2421)).

_This downloads the official stack-build docker image from fpco (FP Complete)_

    > stack docker pull

To build the executable:

    > stack install

To execute the project using stack:

    > stack exec echozulu

To build an executable docker image:  
_Builds a docker image that can be run without stack being installed_

    > docker build -t ezoerner/echo .

To execute using docker:

    > docker run -i -t ezoerner/echo