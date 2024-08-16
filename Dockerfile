FROM oven/bun:latest

LABEL org.opencontainers.image.description BullMQ Proxy - Access BullMQ Queues via HTTP

EXPOSE 8080

ENV NODE_ENV=production

COPY package.json ./
COPY bun.lockb ./
COPY src ./src

RUN bun install --production --ignore-scripts

#CMD bun start
CMD bun run --watch src/index.ts
# HEALTHCHECK --interval=10s --timeout=20s --retries=10 CMD wget localhost:8080 -q -O - > /dev/null 2>&1
ßHEALTHCHECK --interval=10s --timeout=20s --retries=10 CMD ls -l

LABEL org.opencontainers.image.source="https://github.com/taskforcesh/bullmq-proxy"
LABEL org.opencontainers.image.description "BullMQ Proxy - Access BullMQ Queues via HTTP and WebSockets"
