apptainer pull docker://qibin2020/vtrimg
apptainer shell --pwd "$PWD" --bind "$PWD":"$PWD" vtrimg_latest.sif
make run