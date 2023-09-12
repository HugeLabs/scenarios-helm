#!/bin/bash

# this script will ensure that the template is properly created for step 3 in case we
# do not want to do it interactively during the presentation

# make the directory and copy the spec files
mkdir -p /root/my-helm-chart/templates
cp -r /root/spec/* /root/my-helm-chart/templates

# replace the values in the spec files
for file in /root/my-helm-chart/templates/*; do
  sed -i 's/replicas: .*/replicas: {{ .Values.replicas }}/g' $file
  sed -i 's/color: \w*/color: {{ .Values.color }}/g' $file
  sed -i 's/port: .*/port: {{ .Values.port }}/g' $file
done

# create the Chart.yaml and values.yaml files
cat <<EOF > /root/my-helm-chart/Chart.yaml
apiVersion: v2
type: application
version: 0.1.0
EOF

cat <<EOF > /root/my-helm-chart/values.yaml
replicas: 1
color: blue
port: 80
EOF
