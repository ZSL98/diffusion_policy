# Define an array of pipe_degrees
declare -a pipe_degrees=(2 3 4 5 6)
declare -a context_update=(1)
declare -a inference_step=(20 40 60 80 100 120 140 160)
declare -a skewness=(-1 -0.5 -0.2 -0.1 0 0.1 0.2 0.5 1)

for value in "${context_update[@]}"; do
    export CONTEXT_UPDATE="$value"
    for pipeline_degree in "${pipe_degrees[@]}"; do

        export PIPE_DEGREE="$pipeline_degree"
        for inf_step in "${inference_step[@]}"; do
            export INF_STEP="$inf_step"
            for skew in "${skewness[@]}"; do
                export SKEW="$skew"
                echo "Running Python script with PIPE_DEGREE=$PIPE_DEGREE"
                # python eval.py --checkpoint data/pusht/cnn/epoch\=1850-test_mean_score\=0.898.ckpt \
                #                     --output_dir data/pusht/eval_output --device cuda:0 -r 0003
                
                python eval.py --checkpoint data/pusht/transformer/epoch\=0400-test_mean_score\=0.817.ckpt \
                                --output_dir data/pusht/eval_output --device cuda:0 -r 0004

                # python eval.py --checkpoint data/can_mh/cnn/latest.ckpt --output_dir data/can_mh/eval_output --device cuda:0 -r 1005
                # python eval.py --checkpoint data/can_mh/transformer/latest.ckpt --output_dir data/can_mh/eval_output --device cuda:0 -r 1006

                # python eval.py --checkpoint data/can_ph/cnn/latest.ckpt --output_dir data/can_ph/eval_output --device cuda:0 -r 2005
                # python eval.py --checkpoint data/can_ph/transformer/latest.ckpt --output_dir data/can_ph/eval_output --device cuda:0 -r 2006

                # python eval.py --checkpoint data/square_mh/cnn/latest.ckpt --output_dir data/square_mh/eval_output --device cuda:0 -r 3005
                # python eval.py --checkpoint data/square_mh/transformer/latest.ckpt --output_dir data/square_mh/eval_output --device cuda:0 -r 3006

                # python eval.py --checkpoint data/transport_mh/cnn/latest.ckpt --output_dir data/transport_mh/eval_output --device cuda:0 -r 4005
                # python eval.py --checkpoint data/transport_mh/transformer/latest.ckpt --output_dir data/transport_mh/eval_output --device cuda:0 -r 4006

                # python eval.py --checkpoint data/can_mh/transformer/latest.ckpt --output_dir data/can_mh/eval_output --device cuda:0 -r 1006

                # python eval.py --checkpoint data/transport_mh/transformer/latest.ckpt --output_dir data/transport_mh/eval_output --device cuda:0 -r 4006
                # python eval.py --checkpoint data/transport_mh/transformer/latest.ckpt --output_dir data/transport_mh/eval_output --device cuda:0 -r 4006
                rm -rf /dev/shm/*
            done
        done
    done
done