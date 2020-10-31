kubectl create -f 2-create-pv.yaml
helm install elasticsearch elastic/elasticsearch -f elasticsearch.values -n efk
