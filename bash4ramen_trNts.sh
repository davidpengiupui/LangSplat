#!/bin/bash
SET_NAME="lerf_ovs" 
CASE_NAME="ramen"

cd autoencoder
python train.py --dataset_path ../${SET_NAME}/${CASE_NAME} --encoder_dims 256 128 64 32 3 --decoder_dims 16 32 64 128 256 256 512 --lr 0.0007 --dataset_name ${CASE_NAME}
python test.py --dataset_path ../${SET_NAME}/${CASE_NAME} --dataset_name ${CASE_NAME}

cd ..
python train.py -s ./${SET_NAME}/${CASE_NAME} -m ./output/${CASE_NAME} --start_checkpoint ./output/${CASE_NAME}/chkpnt30000.pth --feature_level 1
python train.py -s ./${SET_NAME}/${CASE_NAME} -m ./output/${CASE_NAME} --start_checkpoint ./output/${CASE_NAME}/chkpnt30000.pth --feature_level 2
python train.py -s ./${SET_NAME}/${CASE_NAME} -m ./output/${CASE_NAME} --start_checkpoint ./output/${CASE_NAME}/chkpnt30000.pth --feature_level 3

python render.py -m ./output/${CASE_NAME}_1
python render.py -m ./output/${CASE_NAME}_1 --include_feature
python render.py -m ./output/${CASE_NAME}_2
python render.py -m ./output/${CASE_NAME}_2 --include_feature
python render.py -m ./output/${CASE_NAME}_3
python render.py -m ./output/${CASE_NAME}_3 --include_feature

cd eval
bash eval.sh
