set -xe

export STATIC_OPENSSL_DIR=/Users/huawei_test/wubenteng/openssl/mac_aarch64

source /Users/huawei_test/wubenteng/sdk/b103_ios/cangjie/envsetup.sh
cjc -v
export CANGJIE_LOCAL_STDX_PATH=/Users/huawei_test/wubenteng/sdk/b103_ios/darwin_aarch64_cjnative
export CANGJIE_STDX_PATH=/Users/huawei_test/wubenteng/sdk/b103_ios/ios_simulator_aarch64_cjnative

PROJ=/Users/huawei_test/wubenteng/Cangjie-test/testsuites/HLT/configs/cjnative/ios/xcode_project_of_cangjie_ios_test

# # 动态链接
# cjc main.cj --import-path $CANGJIE_STDX_PATH/dynamic/stdx -L$CANGJIE_STDX_PATH/dynamic/stdx -lstdx.crypto.keys -lstdx.crypto.digest
# ./main
# echo "动态链接"
# otool -L ./main

# 静态链接，强制抽取
export DYLD_LIBRARY_PATH=$(pwd):$CANGJIE_HOME/runtime/lib/darwin_aarch64_cjnative:$CANGJIE_HOME/tools/lib:$DYLD_LIBRARY_PATH && 

cp libcangjie_main.a $PROJ/test_cangjie_ios_175/bridge_cangjie
# echo "静态链接，强制抽取"
# otool -L ./main

cjc -v
