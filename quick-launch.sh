model=bigscience/bloom-560m
num_shard=1
volume=$PWD/data # share a volume with the Docker container to avoid downloading weights every run
extras="--disable-custom-kernels" # required if using GPU other than A100

#docker run --gpus all --shm-size 1g -p 8080:80 -v $volume:/data ghcr.io/huggingface/text-generation-inference:0.8 --model-id $model --num-shard $num_shard
docker run --shm-size 1g -p 8088:80 -v $volume:/data ghcr.io/huggingface/text-generation-inference:0.8 --model-id $model --num-shard $num_shard $extras
