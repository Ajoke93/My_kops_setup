#!/bin/bash

# Replace <YOUR_BUCKET_NAME> with the actual bucket name
BUCKET_NAME="ajoke30.k8s.local"

# Get the list of all object versions from the bucket in JSON format
versions_json=$(aws s3api list-object-versions --bucket "$BUCKET_NAME" --output json)

# Extract the object versions and version IDs using jq
object_versions=$(echo "$versions_json" | jq '.Versions[]')

# Loop through each object version and delete it using aws s3api delete-object
for object_version in $object_versions; do
  version_id=$(echo "$object_version" | jq -r '.VersionId')
  key=$(echo "$object_version" | jq -r '.Key')

  # Delete the object version
  aws s3api delete-object --bucket "$BUCKET_NAME" --key "$key" --version-id "$version_id"
done

