# Use the official Kali Linux image
FROM kalilinux/kali-rolling

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    sudo \
    && apt-get clean

# Copy the script into the container
COPY asl.sh /usr/local/bin/asl.sh

# Make the script executable
RUN chmod +x /usr/local/bin/asl.sh

# Set the entrypoint to the script
ENTRYPOINT ["/usr/local/bin/asl.sh"]