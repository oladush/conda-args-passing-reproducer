#!/bin/bash

# Set name of tool environment
ENV_NAME="args-passing-reproducer"
echo "Environment name of tool: $ENV_NAME"
TOOL_PATH=$(conda run -n $ENV_NAME eval "echo \$TOOL_PATH")

args="$@"
conda run --no-capture-output -n "$ENV_NAME" python3 -- "$TOOL_PATH/print_args.py" $args
