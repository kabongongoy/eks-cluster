#!/bin/bash

# Define the base directory for the module
MODULE_DIR="./modules/kubernetes_addons"

# Create the folder structure
echo "Creating module folder structure..."
mkdir -p "${MODULE_DIR}"

# Navigate to the module directory
cd "${MODULE_DIR}" || exit

# Create Terraform files
echo "Creating Terraform files..."
touch main.tf variables.tf outputs.tf

# Provide confirmation
echo "Folder structure created successfully!"
echo "Module directory: ${MODULE_DIR}"
echo "Files: main.tf, variables.tf, outputs.tf"
