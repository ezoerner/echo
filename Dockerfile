FROM fpco/stack-run
WORKDIR /echo
ADD .stack-work/docker/_home/.local/bin/echozulu /echo/
ENTRYPOINT ["./echozulu"]