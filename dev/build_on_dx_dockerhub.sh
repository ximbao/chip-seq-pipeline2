#!/bin/bash
set -e

VER=$(cat chip.wdl | grep "String pipeline_ver = " | awk '{gsub("'"'"'",""); print $4}')
DOCKER=encodedcc/chip-seq-pipeline:$VER
DXWDL=~/dxWDL-v1.46.4.jar

# check if docker image exists on dockerhub
docker pull $DOCKER

# general
java -jar ${DXWDL} compile chip.wdl -project "ENCODE Uniform Processing Pipelines" -extras \
<(echo "{\"default_runtime_attributes\":{\"docker\":\"${DOCKER}\"}}") -f -folder \
/ChIP-seq2/workflows/$VER/general -defaults example_input_json/dx/template_general.json

# hg38
java -jar ${DXWDL} compile chip.wdl -project "ENCODE Uniform Processing Pipelines" -extras \
<(echo "{\"default_runtime_attributes\":{\"docker\":\"${DOCKER}\"}}") -f -folder \
/ChIP-seq2/workflows/$VER/hg38 -defaults example_input_json/dx/template_hg38.json

# hg19
java -jar ${DXWDL} compile chip.wdl -project "ENCODE Uniform Processing Pipelines" -extras \
<(echo "{\"default_runtime_attributes\":{\"docker\":\"${DOCKER}\"}}") -f -folder \
/ChIP-seq2/workflows/$VER/hg19 -defaults example_input_json/dx/template_hg19.json

# mm10
java -jar ${DXWDL} compile chip.wdl -project "ENCODE Uniform Processing Pipelines" -extras \
<(echo "{\"default_runtime_attributes\":{\"docker\":\"${DOCKER}\"}}") -f -folder \
/ChIP-seq2/workflows/$VER/mm10 -defaults example_input_json/dx/template_mm10.json

# mm9
java -jar ${DXWDL} compile chip.wdl -project "ENCODE Uniform Processing Pipelines" -extras \
<(echo "{\"default_runtime_attributes\":{\"docker\":\"${DOCKER}\"}}") -f -folder \
/ChIP-seq2/workflows/$VER/mm9 -defaults example_input_json/dx/template_mm9.json

# test sample PE ENCSR936XTK (full)
java -jar ${DXWDL} compile chip.wdl -project "ENCODE Uniform Processing Pipelines" -extras \
<(echo "{\"default_runtime_attributes\":{\"docker\":\"${DOCKER}\"}}") -f -folder \
/ChIP-seq2/workflows/$VER/test_ENCSR936XTK -defaults example_input_json/dx/ENCSR936XTK_dx.json

# test sample SE ENCSR000DYI (full)
java -jar ${DXWDL} compile chip.wdl -project "ENCODE Uniform Processing Pipelines" -extras \
<(echo "{\"default_runtime_attributes\":{\"docker\":\"${DOCKER}\"}}") -f -folder \
/ChIP-seq2/workflows/$VER/test_ENCSR000DYI -defaults example_input_json/dx/ENCSR000DYI_dx.json

# test sample SE ENCSR000DYI (subsampled, chr19/chrM only)
java -jar ${DXWDL} compile chip.wdl -project "ENCODE Uniform Processing Pipelines" -extras \
<(echo "{\"default_runtime_attributes\":{\"docker\":\"${DOCKER}\"}}") -f -folder \
/ChIP-seq2/workflows/$VER/test_ENCSR000DYI_subsampled_chr19_only -defaults example_input_json/dx/ENCSR000DYI_subsampled_chr19_only_dx.json

# test sample SE ENCSR000DYI (subsampled, chr19/chrM only, rep1)
java -jar ${DXWDL} compile chip.wdl -project "ENCODE Uniform Processing Pipelines" -extras \
<(echo "{\"default_runtime_attributes\":{\"docker\":\"${DOCKER}\"}}") -f -folder \
/ChIP-seq2/workflows/$VER/test_ENCSR000DYI_subsampled_chr19_only_rep1 -defaults example_input_json/dx/ENCSR000DYI_subsampled_chr19_only_rep1_dx.json

## DX Azure

# general
java -jar ${DXWDL} compile chip.wdl -project "ENCODE Uniform Processing Pipelines Azure" -extras \
<(echo "{\"default_runtime_attributes\":{\"docker\":\"${DOCKER}\"}}") -f -folder \
/ChIP-seq2/workflows/$VER/general -defaults example_input_json/dx_azure/template_general.json

# hg38
java -jar ${DXWDL} compile chip.wdl -project "ENCODE Uniform Processing Pipelines Azure" -extras \
<(echo "{\"default_runtime_attributes\":{\"docker\":\"${DOCKER}\"}}") -f -folder \
/ChIP-seq2/workflows/$VER/hg38 -defaults example_input_json/dx_azure/template_hg38.json

# hg19
java -jar ${DXWDL} compile chip.wdl -project "ENCODE Uniform Processing Pipelines Azure" -extras \
<(echo "{\"default_runtime_attributes\":{\"docker\":\"${DOCKER}\"}}") -f -folder \
/ChIP-seq2/workflows/$VER/hg19 -defaults example_input_json/dx_azure/template_hg19.json

# mm10
java -jar ${DXWDL} compile chip.wdl -project "ENCODE Uniform Processing Pipelines Azure" -extras \
<(echo "{\"default_runtime_attributes\":{\"docker\":\"${DOCKER}\"}}") -f -folder \
/ChIP-seq2/workflows/$VER/mm10 -defaults example_input_json/dx_azure/template_mm10.json

# mm9
java -jar ${DXWDL} compile chip.wdl -project "ENCODE Uniform Processing Pipelines Azure" -extras \
<(echo "{\"default_runtime_attributes\":{\"docker\":\"${DOCKER}\"}}") -f -folder \
/ChIP-seq2/workflows/$VER/mm9 -defaults example_input_json/dx_azure/template_mm9.json

# test sample PE ENCSR936XTK (full)
java -jar ${DXWDL} compile chip.wdl -project "ENCODE Uniform Processing Pipelines Azure" -extras \
<(echo "{\"default_runtime_attributes\":{\"docker\":\"${DOCKER}\"}}") -f -folder \
/ChIP-seq2/workflows/$VER/test_ENCSR936XTK -defaults example_input_json/dx_azure/ENCSR936XTK_dx_azure.json

# test sample SE ENCSR000DYI (full)
java -jar ${DXWDL} compile chip.wdl -project "ENCODE Uniform Processing Pipelines Azure" -extras \
<(echo "{\"default_runtime_attributes\":{\"docker\":\"${DOCKER}\"}}") -f -folder \
/ChIP-seq2/workflows/$VER/test_ENCSR000DYI -defaults example_input_json/dx_azure/ENCSR000DYI_dx_azure.json

# test sample SE ENCSR000DYI (subsampled, chr19/chrM only)
java -jar ${DXWDL} compile chip.wdl -project "ENCODE Uniform Processing Pipelines Azure" -extras \
<(echo "{\"default_runtime_attributes\":{\"docker\":\"${DOCKER}\"}}") -f -folder \
/ChIP-seq2/workflows/$VER/test_ENCSR000DYI_subsampled_chr19_only -defaults example_input_json/dx_azure/ENCSR000DYI_subsampled_chr19_only_dx_azure.json
