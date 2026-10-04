#!/usr/bin/env bash

git add .
read -r -p "Enter commit message: " userInput
git commit -m "$userInput"
git push origin main