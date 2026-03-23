// EXEC-PIPE-1: bash -c 'sh $CANGJIE_HOME/envsetup.sh' 2>&1 | compare %f
// ASSERT: scan [ERROR] This script must be sourced, not executed directly.