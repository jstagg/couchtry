# Specify the node base image
FROM couchdb:latest

# Maintainer
LABEL maintainer="jstagg@gmail.com"

# Install app dependencies
COPY aliases.csv ./
COPY load.sh ./

# Ready the container
RUN apt update && apt install -y dos2unix npm && apt clean
RUN dos2unix ./load.sh && chmod +x ./load.sh
RUN npm i npm@latest -g
RUN npm install -g couchimport

# Explicitly expose the port(s)
EXPOSE 5984

# Run the process and the loader
# CMD ["./start.sh"]