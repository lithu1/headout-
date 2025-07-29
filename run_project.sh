#!/bin/bash
set -e
REPO_SSH="git@github.com:your-username/your-repo.git"
git clone "$REPO_SSH" myapp
cd myapp
nohup java -jar build/libs/project.jar > logs.txt 2>&1 &
echo "App running on http://localhost:9000"
