#!/bin/bash
DATASET_NAME="lerf_ovs" 
CASE_NAME="ramen"

cd gaussian-splatting
pip install submodules/diff-gaussian-rasterization
pip install submodules/simple-knn

python train.py -s ../${DATASET_NAME}/${CASE_NAME}

cd ..
pip install submodules/segment-anything-langsplat
pip install submodules/diff-gaussian-rasterization
pip install submodules/simple-knn

