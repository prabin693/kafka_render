# Use the official Kafka image from Docker Hub
FROM confluentinc/cp-kafka:latest

# Set the environment variables
ENV KAFKA_BROKER_ID=1
ENV KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181
ENV KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://kafka:9092,PLAINTEXT_HOST://localhost:29092
ENV KAFKA_LISTENER_SECURITY_PROTOCOL_MAP=PLAINTEXT:PLAINTEXT,PLAINTEXT_HOST:PLAINTEXT
ENV KAFKA_INTER_BROKER_LISTENER_NAME=PLAINTEXT
ENV KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1

# Build the Docker image
RUN docker build -t my-kafka .

# Run the Docker container
CMD ["docker", "run", "-d", "--name=my-kafka", "-p", "29092:29092", "my-kafka"]
