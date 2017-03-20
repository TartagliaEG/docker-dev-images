#!/bin/bash 

if [ ! -f /data/db/.created ]; then
  # Initialize the mongod service asynchronously (No args here to avoid mongo cli lock after creating the admin account). 
  /entrypoint.sh "mongod" &

  # Hold until the connection was estabilished.
  while ! nc -vz localhost 27017; do sleep 0.4; done

  # Load the creation javascript.
  SCRIPT=`cat /scripts/first_mongo_run.js`

  # Run the Script on the admin database.
  mongo admin --eval "$SCRIPT"

  # Shutdown the mongo service so that the changes can be saved.
  mongod --shutdown

  # Create the .created file in the /data/db/.created path to skip this step in future runs.
  touch /data/db/.created
fi

# Initialize the mongd service synchronously with the --auth arg
/entrypoint.sh $@ --auth 


