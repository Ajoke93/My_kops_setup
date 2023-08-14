sudo apt install jq
aws s3api delete-objects --bucket ajoke30.k8s.local --delete "$(aws s3api list-object-versions --bucket ajoke30.k8s.local --output json | jq '{"Objects": [.Versions[] | {"Key": .Key, "VersionId": .VersionId}], "Quiet": false}')"
aws s3 rb s3://ajoke30.k8s.local --force



aws s3 ls s3://ajoke30.k8s.local --recursive
aws s3 rm s3://ajoke30.k8s.local --recursive
aws s3 rb s3://ajoke30.k8s.local --force
