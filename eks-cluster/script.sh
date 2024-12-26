#!/bin/bash

# Root module and submodule directories
ROOT_DIR="root"
MODULES_DIR="$ROOT_DIR/modules"
MODULE_NAMES=("eks_cluster" "iam_node_group" "cluster_autoscaler" "aws_lbc")

# Files to create
FILES=("main.tf" "variables.tf" "outputs.tf")

# Function to create module structure
create_module_structure() {
  local module_name=$1
  local module_path="$MODULES_DIR/$module_name"

  echo "Creating structure for module: $module_name"
  mkdir -p "$module_path"

  for file in "${FILES[@]}"; do
    local file_path="$module_path/$file"
    touch "$file_path"
    echo "# Placeholder for $file in $module_name" > "$file_path"
    echo "  - Created $file_path"
  done
}

# Main script logic
echo "Creating root module structure..."

# Create root directory
mkdir -p "$ROOT_DIR"

# Create root files
for file in "${FILES[@]}"; do
  file_path="$ROOT_DIR/$file"
  touch "$file_path"
  echo "# Placeholder for $file in root module" > "$file_path"
  echo "  - Created $file_path"
done

# Create modules directory and module subdirectories
mkdir -p "$MODULES_DIR"
for module in "${MODULE_NAMES[@]}"; do
  create_module_structure "$module"
done

echo "Root module structure created successfully!"
