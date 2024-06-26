# export https_proxy="http://xx.xx.xx.xx:xxxx"
# export http_proxy="http://xx.xx.xx.xx:xxxx"

accelerate launch --config_file scripts/fsdp.yaml train_phi3v.py \
    --data_path /path/to/your/training/data.json \
    --image_folder /path/to/your/image/folder \
    --model_id /path/to/Phi-3-vision-128k-instruct \
    --output_dir output/test_train_lora \
    --num_train_epochs 1 \
    --learning_rate 1e-4 \
    --per_device_train_batch_size 2 \
    --gradient_accumulation_steps 8 \
    --num_lora_modules 10 \
    --lora_namespan_exclude "['self_attn', 'lm_head']" \
    --max_seq_length 3072 \
    --report_to none \
    --logging_dir tf-logs \
    --lora_rank 128 \
    --lora_alpha 256 \
    --lora_dropout 0.05 \
    --logging_steps 1 \
    --dataloader_num_workers 4 | tee logs/$(date +"%Y-%m-%d_%H_%M").log
    # --quantization \
    # --disable_flash_attn2 \
