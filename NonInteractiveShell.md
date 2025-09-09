Task 1: Create a User with a Non-Interactive ShellDescriptionTo accommodate the backup agent tool's specifications, the system admin team at xFusionCorp Industries requires the creation of a user with a non-interactive shell.Your Script#!/bin/bash
# Create a user named 'anita' with a non-interactive shell
# '/sbin/nologin' prevents the user from logging in via a shell.
useradd -s /sbin/nologin anita

# Check if the previous command was successful

    echo "User 'anita' was successfully created with a non-interactive shell."
else
    echo "Failed to create user 'anita'."
fi
Explanation#!/bin/bash: This is a shebang that tells the system to execute the script using the bash shell.useradd: This command is used to create a new user account.-s /sbin/nologin: This flag specifies the user's login shell. By setting it to /sbin/nologin, you prevent the user from being able to log in and access a standard shell.anita: This is the name of the user you are creating.if [ $? -eq 0 ]: This is a conditional statement that checks the exit status of the previous command. An exit status of 0 indicates that the command was successful.echo: This command prints the specified message to the terminal, providing feedback on whether the user creation was successful or not.
