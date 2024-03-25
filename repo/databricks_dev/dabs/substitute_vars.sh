#!/bin/bash

# Substitute variables in databricks.yml
sed -i "s|\${DATABRICKS_HOST}|$DATABRICKS_HOST|g" databricks.yml
sed -i "s|\${CLUSTER_ID}|$CLUSTER_ID|g" databricks.yml
