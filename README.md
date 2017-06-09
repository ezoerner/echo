# echo
Experiments in deploying Haskell functions in a platform-independent way.
The function "echozulu" is just a barebones Haskell function that echoes the first line.

## Project Setup
To build Haskell code in this project, install [Stack](https://docs.haskellstack.org/en/stable/README/).

If you don't have Docker already installed, install [Docker](https://docs.docker.com/engine/installation/) first. Note that docker
integration with `stack` does not currently work on Windows (see [#2421](https://github.com/commercialhaskell/stack/issues/2421)).

## Experiment 1: Building and Running a Haskell program with Docker
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

## Experiment 2: Building and Running a Haskell program as an [IronFunction](https://github.com/iron-io/functions)
Experimentation with FaaS (Functions as a Service) implemented in Haskell.

Fire up an `iron/functions` container:

    > docker run --rm -it --name functions -v ${PWD}/data:/app/data -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 iron/functions

Install the `fn` CLI tool:

    > curl -LSs https://goo.gl/VZrL8t | sh

If you are using a runtime that IronFunctions knows about (**rust**, **dotnet** (F# or C#), **go**, **node**, **ruby**, **python**) then `fn init` will create a `Dockerfile` and `func.yaml` for you. Otherwise (which is this case, **haskell**), you need to create the `Dockerfile` yourself before running `fn init` to create the `func.yaml` file. See `Dockerfile` in this project.

    > fn init ezoerner/echo

You can add your own build instructions to the `fn.yaml` file:

    ...
    build:
      - stack install

Create an IronFunctions app:

    > fn apps create echo

Create an HTTP route in the app:

    > fn routes create echo /echozulu ezoerner/echo

`fn build` will build the Docker image based on `func.yaml` and your `Dockerfile`:

    > fn build

Test your function. To pass input, pipe data into stdin:

    > echo "Hallo Wereld" | fn run

Call your function via HTTP:

    > curl -H "Content-Type: text/plain" -X POST --data "Hallo Wereld" http://localhost:8080/r/echo/echozulu

