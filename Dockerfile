# java-tron FullNode - mainnet, REST on 8090
# Image already contains FullNode.jar; no need to download separately
FROM tronprotocol/java-tron:latest

COPY config.conf /config.conf

EXPOSE 8090 8091 18888 50051

# Default: run FullNode with mounted config and data dir
# Override CMD in compose to pass -c and -d
ENTRYPOINT ["java", "-Xmx24g", "-XX:+UseConcMarkSweepGC", "-jar", "FullNode.jar"]
CMD ["-c", "/config.conf", "-d", "/data"]
