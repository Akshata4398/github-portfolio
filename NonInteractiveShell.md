Task 1:
To accommodate the backup agent tool's specifications, the system admin team at xFusionCorp Industries requires the creation of a user with a non-interactive shell. Here's your task: 
Create a user named anita with a non-interactive shell on App Server 3.

#!/bin/bash
useradd -s /sbin/nologin anita

if [ $? -eq 0 ]; then
echo "User 'anita' was successfully created with a non-interactive shell."
else
echo "Failed to create user 'anita'."
fi
