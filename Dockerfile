FROM debian:buster-slim

RUN apt-get update \
    && apt-get install -y curl python3-pip openssh-client git \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install pre-commit

# Create a user with 1000:1000
RUN useradd -ms /bin/bash node

WORKDIR /home/node

COPY . .

ENTRYPOINT [ "pre-commit" ]

CMD [ "try-repo",  ".", "npm-postinstall", "-a" ]
