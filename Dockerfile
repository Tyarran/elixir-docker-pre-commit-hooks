from elixir:latest

RUN useradd -ms /bin/bash mixuser
USER mixuser

RUN mkdir /home/mixuser/.mix
RUN mkdir /home/mixuser/.hex
RUN chmod -R 777 /home/mixuser/.mix
RUN chmod -R 777 /home/mixuser/.hex

ENV MIX_HOME=/home/mixuser/.mix
ENV HEX_HOME=/home/mixuser/.hex


RUN mix local.hex --force

WORKDIR /src

ADD ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]