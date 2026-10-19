FROM rabbitmq:4.3.6-management

COPY rabbitmq.conf /etc/rabbitmq/

ENV RABBITMQ_NODENAME=rabbit@localhost

# 3.8 data can't be upgraded in place to 4.x (it needs every 3.x minor in
# between), so 4.x starts a fresh node in its own directory on the same disk.
# The 3.8 data stays untouched under /var/lib/rabbitmq/mnesia for a rollback.
ENV RABBITMQ_MNESIA_BASE=/var/lib/rabbitmq/v4

RUN chown rabbitmq:rabbitmq /etc/rabbitmq/rabbitmq.conf

USER rabbitmq:rabbitmq
