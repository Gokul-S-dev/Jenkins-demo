#!/bin/bash

echo "Pushing code to GitHub..."

git add .

git commit -m "Update project"

git push -u origin main

echo "Code pushed successfully!"