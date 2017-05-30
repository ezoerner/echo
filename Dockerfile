FROM fpco/stack-run
WORKDIR /function
ADD .stack-work/docker/_home/.local/bin/echo-exe /function/
# Set what will run when a container is started for this image
ENTRYPOINT ["./echo-exe"]