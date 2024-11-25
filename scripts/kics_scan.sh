#!/bin/sh
kics scan --path *.tf -q /root/kics/assets/queries --report-formats "html,json" -o ./output  --output-name kics-result-tf-cicd
