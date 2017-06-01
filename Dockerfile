FROM fpco/stack-run
WORKDIR /echo
ADD .stack-work/docker/_home/.local/bin/echozulu /echo/
# Set what will run when a container is started for this image
ENTRYPOINT ["./echozulu"]