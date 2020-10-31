
1. Create namespace using 1-create-ns.sh

2. Extract the values file to customize

cd /vagrant/efk

helm show values elastic/elasticsearch >> /vagrant/efk/elasticsearch.values

helm install elasticsearch elastic/elasticsearch -f elasticsearch.values -n efk

helm show values elastic/kibana >> /vagrant/efk/kibana.values

helm install kibana elastic/kibana -f kibana.values -n efk
