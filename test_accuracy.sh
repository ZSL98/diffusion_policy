# Define an array of pipe_degrees
declare -a pipe_degrees=(1 2 3 4 5 6)
declare -a context_update=(0 1)

for value in "${context_update[@]}"; do
    export CONTEXT_UPDATE="$value"
    for pipeline_degree in "${pipe_degrees[@]}"; do

        export PIPE_DEGREE="$pipeline_degree"
        echo "Running Python script with PIPE_DEGREE=$PIPE_DEGREE"
        python eval.py --checkpoint data/pusht/cnn/epoch\=1850-test_mean_score\=0.898.ckpt \
                        --output_dir data/pusht/eval_output --device cuda:0 -r 0003
        
        python eval.py --checkpoint data/pusht/transformer/epoch\=0400-test_mean_score\=0.817.ckpt \
                        --output_dir data/pusht/eval_output --device cuda:0 -r 0004

    done

done