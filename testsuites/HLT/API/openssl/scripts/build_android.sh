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

# # 静态链接，未强制抽取
# cjc main.cj --import-path $CANGJIE_STDX_PATH/static/stdx -L$CANGJIE_STDX_PATH/static/stdx --link-option --start-group -lstdx.chir -lstdx.unittest.data -lstdx.unittest -lstdx.encoding.json -lstdx.serialization.serialization -lstdx.serialization -lstdx.net.http -lstdx.net.tls -lstdx.net.tls.common -lstdx.net -lstdx.logger -lstdx.log -lstdx.encoding.url -lstdx.encoding.json.stream -lstdx.crypto.kit -lstdx.crypto.x509 -lstdx.crypto.crypto -lstdx.crypto.keys -lstdx.crypto.digest -lstdx.crypto.common -lstdx.encoding.hex -lstdx.encoding.base64 -lstdx.encoding -lstdx.compress.tar -lstdx.crypto -lstdx.compress.zlib -lstdx.compress -lstdx.actors -lstdx --link-option --end-group
# ./main
# echo "静态链接，未强制抽取"
# otool -L ./main

# 静态链接，强制抽取
export DYLD_LIBRARY_PATH=$(pwd):$CANGJIE_HOME/runtime/lib/darwin_aarch64_cjnative:$CANGJIE_HOME/tools/lib:$DYLD_LIBRARY_PATH && cjc --import-path $CANGJIE_LOCAL_STDX_PATH cangjie_main.cj --import-path $CANGJIE_STDX_PATH/static/stdx --target=arm64-apple-ios-simulator --sysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk -L$CANGJIE_STDX_PATH/static/stdx -lstdx.unittest.data -lstdx.unittest -lstdx.encoding.json -lstdx.serialization.serialization -lstdx.serialization -lstdx.net.http -lstdx.net.tls -lstdx.net.tls.common -lstdx.net -lstdx.logger -lstdx.log -lstdx.encoding.url -lstdx.encoding.json.stream -lstdx.crypto.kit -lstdx.crypto.x509 -lstdx.crypto.crypto -lstdx.crypto.keys -lstdx.crypto.digest -lstdx.crypto.common -lstdx.encoding.hex -lstdx.encoding.base64 -lstdx.encoding -lstdx.compress.tar -lstdx.crypto -lstdx.compress.zlib -lstdx.compress -lstdx.actors -lstdx -L/usr/local/lib64 -lpthread -ldl --link-option "-force_load" --link-option "$STATIC_OPENSSL_DIR/libssl.a" --link-option "-force_load" --link-option "$STATIC_OPENSSL_DIR/libcrypto.a" --output-type=staticlib -o libcangjie_main.a

cp libcangjie_main.a $PROJ/test_cangjie_ios_175/bridge_cangjie
# echo "静态链接，强制抽取"
# otool -L ./main

cjc -v
