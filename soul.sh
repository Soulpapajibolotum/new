#!/bin/bash

# Step 1: Add Jenkins key
echo "Adding Jenkins key..."
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Step 2: Add Jenkins apt repository entry
echo "Adding Jenkins repository..."
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Step 3: Update package index
echo "Updating package index..."
sudo apt-get update

# Step 4: Install required packages and Jenkins
echo "Installing required packages and Jenkins..."
sudo apt-get install -y fontconfig openjdk-17-jre
sudo apt-get install -y jenkins

# Step 5: Verify Jenkins installation
echo "Jenkins installation complete. Status:"
sudo systemctl status jenkins
