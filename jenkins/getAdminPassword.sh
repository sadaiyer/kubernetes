path="{.data.jenkins-admin-password}"
secret=$(kubectl get secret -n jenkins jenkins -o jsonpath=$path)
echo $(echo $secret | base64 --decode)
