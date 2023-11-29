# GitHub-Organization-Clone
This script allows you to mass-clone repositories from a GitHub organization.

## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Prerequisites](#prerequisites)

## Introduction

When working with a GitHub organization, you may need to clone multiple repositories at once. This script simplifies the process by cloning repositories that have a specified main branch from the organization.

## Usage

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/your-username/GitHub-Organization-Clone.git
   ```
2. Navigate to the cloned directory:

    ```bash
    cd GitHub-Organization-Clone
    ```
3. Make the script executable:
    ```bash
    chmod +x clone_repos.sh
    ```
4. Create an ssh key
    ```
    ssh-keygen -t ed25519 <your_email>
    ```
5. Update the script with your GitHub organization name, personal access token, and ssh key.    
6. Run the script:
    ```bash
    ./clone_repos.sh
    ```
    The script will clone repositories with the specified main branch from your GitHub organization.

## Prerequisites
• Git installed on your machine.    
• A GitHub personal access token with the repo scope.
