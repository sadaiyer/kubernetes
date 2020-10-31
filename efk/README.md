# https://logz.io/blog/deploying-the-elk-stack-on-kubernetes-with-helm/
# https://www.youtube.com/watch?v=rKkFGVMvAPM&t=1668s

1. Create namespace using 1-create-ns.sh

2. Extract the values file to customize

cd /vagrant/efk

helm show values elastic/elasticsearch >> /vagrant/efk/elasticsearch.values

helm install elasticsearch elastic/elasticsearch -f elasticsearch.values -n efk

helm show values elastic/kibana >> /vagrant/efk/kibana.values

helm install kibana elastic/kibana -f kibana.values -n efk

helm install filebeat elastic/filebeat -n efk

# Optional
helm show values elastic/metricbeat >>metricbeat.values

# Update hostNetworking as true
helm install metricbeat elastic/metricbeat -f metricbeat.values

