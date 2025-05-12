
api_key=API_KEY
model_name=MODEL_NAME

#Automatic evaluation method
modes=(
    "WebJudge_Online_Mind2Web_eval"
    "WebJudge_general_eval"
    "Autonomous_eval"
    "WebVoyager_eval"
    "AgentTrek_eval"
)

base_dir="./data/example"
for mode in "${modes[@]}"; do
    python ./src/run.py \
        --mode "$mode" \
        --model "${model_name}" \
        --trajectories_dir "$base_dir" \
        --api_key "${api_key}" \
        --output_path ${base_dir}_result \
        --num_worker 1 \
        --score_threshold 3
done
