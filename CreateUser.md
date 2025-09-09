Task 2:

As part of the temporary assignment to the Nautilus project, a developer named ravi requires access for a limited duration. To ensure smooth access management, a temporary user account with an expiry date is needed. Here's what you need to do:
Create a user named ravi on App Server 1 in Stratos Datacenter. Set the expiry date to 2024-03-28, ensuring the user is created in lowercase as per standard protocol.

Solution:

bash

sudo useradd -e 2024-03-28 ravi

sudo: This command is necessary to run useradd with administrative privileges.
useradd: The command to create a new user account.
-e 2024-03-28: The -e (or --expiredate) flag sets the expiry date for the account. The date format is YYYY-MM-DD.
ravi: The username to be created.

<img width="1534" height="906" alt="image" src="https://github.com/user-attachments/assets/77fdd024-c10f-41e3-9f65-164cd7a6c6a2" />
