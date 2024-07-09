#!/bin/bash

# Initialize an empty array to store the created users
users=()

while true; do
  # Prompt the user for a username
  echo "Please enter a username:"
  read username

  # Check if the username already exists
  if id "$username" &>/dev/null; then
    echo "User already exists"
  else
    # Prompt the user for a password
    echo "Please enter a password for $username:"
    read -s password

    # Prompt the user for the number of days until the account is deactivated
    echo "Please enter the number of days until the account is deactivated:"
    read days

    # Create the user with the provided password and expiration date
    sudo useradd -m -p $(openssl passwd -1 $password) -e $(date -d "+$days days" +%Y-%m-%d) $username

    # Check if the user was created successfully
    if [ $? -eq 0 ]; then
      echo "User created successfully"
      users+=("$username ($days days)")
    else
      echo "Error creating user"
    fi
  fi

  # Prompt the user if they want to create another user
  echo "Do you want to create another user? (Yes/No)"
  read answer

  # If the user answers "n", exit the loop
  if [ "$answer" == "No" ]; then
    break
  fi
done

# Display the list of created users
echo "Users created:"
for user in "${users[@]}"; do
  echo "- $user"
done