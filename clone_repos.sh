#! /bin/bash

ORGANIZATION_NAME="<your_org>"
GITHUB_TOKEN="<your_token>"

# Make sure SSH agent is running and add private key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/<your_ssh_key_file>

# Get list of repos in the organization
repos_url="https://api.github.com/orgs/$ORGANIZATION_NAME/repos?per_page=1000"
repo_list=$(curl -s -H "Authorization: token $GITHUB_TOKEN" "$repos_url")

# Clone each repository with the main branch using SSH
echo "$repo_list" | while IFS= read -r repo; do
    main_branch=$(echo "$repo" | grep -o '"default_branch": "[^"]*' | cut -d '"' -f4)

    if [ "$main_branch" == "main" ]; then
        ssh_url=$(echo "$repo" | grep -o '"ssh_url": "[^"]*' | cut -d '"' -f4)
        git clone --depth 1 --branch main --single-branch "$ssh_url"
    else
        repo_name=$(echo "$repo" | grep -o '"name": "[^"]*' | cut -d '"' -f4)
        echo "Skipping repository '$repo_name' without a 'main' branch."
    fi
done
