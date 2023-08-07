#!/bin/bash
set -e

# Sample patches of SIZE x SIZE at LEVEL 
# LEVEL=1#再高分辨率，高分辨率失败了
# LEVEL=2 #先低分辨率 数字越大，分辨率越低
LEVEL=1

SIZE=256

# Path where CLAM is installed
DIR_REPO=../CLAM

# Root path to pathology images 
DIR_RAW_DATA=/home/jupyter-ljh/data/mntdata/data0/LIU_shaojun/TCGA-BRCA/WSI/
# DIR_EXP_DATA=/home/jupyter-ljh/data/mntdata/data0/LI_jihao/DSCA-BRCA
DIR_EXP_DATA=/home/jupyter-ljh/data/mntdata/data0/LI_jihao/DSCA-BRCA-NEW-PRESET

# Sub-directory to the patch coordinates generated from S03
SUBDIR_READ=tiles-l${LEVEL}-s${SIZE}
#tiles-l2-s256
# Sub-directory to the patch features 
SUBDIR_SAVE=feats-l${LEVEL}-s${SIZE}-RN50-color_norm
#feats-l2-s256-RN50-color_norm
cd ${DIR_REPO}
#${DIR_EXP_DATA}/${SUBDIR_READ} 存放分割后的h5文件的位置   /home/jupyter-ljh/data/mntdata/data0/LI_jihao/DSCA-BRCA/tiles-l2-s256
#${DIR_RAW_DATA} 存放原始wsi文件的位置     /home/jupyter-ljh/data/mntdata/data0/LIU_shaojun/TCGA-BRCA/WSI/
#${DIR_EXP_DATA}/${SUBDIR_READ}/process_list_autogen.csv 如何处理每个分割后的文件的规定 /home/jupyter-ljh/data/mntdata/data0/LI_jihao/DSCA-BRCA/tiles-l2-s256/pro..
#${DIR_EXP_DATA}/${SUBDIR_SAVE} 存放提取patch特征的位置 /home/jupyter-ljh/data/mntdata/data0/LI_jihao/DSCA-BRCA/feats-l2-s256-RN50-color_norm
#no_auto_skip默认不会覆盖，若设置则会覆盖
echo "running for extracting features from all tiles"
# CUDA_VISIBLE_DEVICES=0 python3 extract_features_fp.py \
#     --data_h5_dir ${DIR_EXP_DATA}/${SUBDIR_READ} \ 
#     --data_slide_dir ${DIR_RAW_DATA} \ 
#     --csv_path ${DIR_EXP_DATA}/${SUBDIR_READ}/process_list_autogen.csv \ 
#     --feat_dir ${DIR_EXP_DATA}/${SUBDIR_SAVE} \ 
#     --batch_size 128 \ 
#     --slide_ext .svs \
#     --color_norm \
#     --no_auto_skip
# CUDA_VISIBLE_DEVICES=0 python3 extract_features_fp.py \
#     --data_h5_dir ${DIR_EXP_DATA}/${SUBDIR_READ} \
#     --data_slide_dir ${DIR_RAW_DATA} \
#     --csv_path ${DIR_EXP_DATA}/${SUBDIR_READ}/process_list_autogen.csv \
#     --feat_dir ${DIR_EXP_DATA}/${SUBDIR_SAVE} \
#     --batch_size 128 \
#     --slide_ext .svs \
#     --color_norm \
#     --no_auto_skip
#new l1
# CUDA_VISIBLE_DEVICES=0 python3 extract_features_fp.py --data_h5_dir /home/jupyter-ljh/data/mntdata/data0/LI_jihao/DSCA-BRCA-NEW-PRESET/tiles-l1-s256 --data_slide_dir /home/jupyter-ljh/data/mntdata/data0/LIU_shaojun/TCGA-BRCA/WSI/ --csv_path /home/jupyter-ljh/data/mntdata/data0/LI_jihao/DSCA-BRCA-NEW-PRESET/tiles-l1-s256/process_list_autogen.csv --feat_dir /home/jupyter-ljh/data/mntdata/data0/LI_jihao/DSCA-BRCA-NEW-PRESET/feats-l1-s256-RN50-color_norm --batch_size 128 --slide_ext .svs --color_norm --no_auto_skip
# new l2
# CUDA_VISIBLE_DEVICES=0 python3 extract_features_fp.py --data_h5_dir /home/jupyter-ljh/data/mntdata/data0/LI_jihao/DSCA-BRCA-NEW-PRESET/tiles-l2-s256 --data_slide_dir /home/jupyter-ljh/data/mntdata/data0/LIU_shaojun/TCGA-BRCA/WSI/ --csv_path /home/jupyter-ljh/data/mntdata/data0/LI_jihao/DSCA-BRCA-NEW-PRESET/tiles-l2-s256/process_list_autogen.csv --feat_dir /home/jupyter-ljh/data/mntdata/data0/LI_jihao/DSCA-BRCA-NEW-PRESET/feats-l2-s256-RN50-color_norm --batch_size 128 --slide_ext .svs --color_norm --no_auto_skip
# old l1
# CUDA_VISIBLE_DEVICES=0 python3 extract_features_fp.py --data_h5_dir /home/jupyter-ljh/data/mntdata/data0/LI_jihao/DSCA-BRCA/tiles-l1-s256 --data_slide_dir /home/jupyter-ljh/data/mntdata/data0/LIU_shaojun/TCGA-BRCA/WSI/ --csv_path /home/jupyter-ljh/data/mntdata/data0/LI_jihao/DSCA-BRCA/tiles-l1-s256/process_list_autogen.csv --feat_dir /home/jupyter-ljh/data/mntdata/data0/LI_jihao/DSCA-BRCA/feats-l1-s256-RN50-color_norm --batch_size 128 --slide_ext .svs --color_norm --no_auto_skip
# old l2
# CUDA_VISIBLE_DEVICES=0 python3 extract_features_fp.py --data_h5_dir /home/jupyter-ljh/data/mntdata/data0/LI_jihao/DSCA-BRCA/tiles-l2-s256 --data_slide_dir /home/jupyter-ljh/data/mntdata/data0/LIU_shaojun/TCGA-BRCA/WSI/ --csv_path /home/jupyter-ljh/data/mntdata/data0/LI_jihao/DSCA-BRCA/tiles-l2-s256/process_list_autogen.csv --feat_dir /home/jupyter-ljh/data/mntdata/data0/LI_jihao/DSCA-BRCA/feats-l2-s256-RN50-color_norm-2 --batch_size 128 --slide_ext .svs --color_norm --no_auto_skip
# old l2 2
# CUDA_VISIBLE_DEVICES=0 python3 extract_features_fp.py --data_h5_dir /home/jupyter-ljh/data/mntdata/data0/LI_jihao/DSCA-BRCA/tiles-l2-s256 --data_slide_dir /home/jupyter-ljh/data/mntdata/data0/LIU_shaojun/TCGA-BRCA/WSI/ --csv_path /home/jupyter-ljh/data/mntdata/data0/LI_jihao/DSCA-BRCA/tiles-l2-s256/process_list_autogen.csv --feat_dir /home/jupyter-ljh/data/mntdata/data0/LI_jihao/DSCA-BRCA/feats-l2-s256-RN50-color_norm-2 --batch_size 128 --slide_ext .svs --color_norm --no_auto_skip
# copy old l1
CUDA_VISIBLE_DEVICES=0 python3 extract_features_fp.py --data_h5_dir /home/jupyter-ljh/data/mntdata/data0/LI_jihao/DSCA-BRCA/copy/tiles-l1-s256 --data_slide_dir /home/jupyter-ljh/data/mntdata/data0/LIU_shaojun/TCGA-BRCA/WSI/ --csv_path /home/jupyter-ljh/data/mntdata/data0/LI_jihao/DSCA-BRCA/copy/tiles-l1-s256/process_list_autogen.csv --feat_dir /home/jupyter-ljh/data/mntdata/data0/LI_jihao/DSCA-BRCA/copy/feats-l1-s256-RN50-color_norm --batch_size 128 --slide_ext .svs --color_norm --no_auto_skip
