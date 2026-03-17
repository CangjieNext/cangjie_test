set -xe



source /Users/huawei_test/wubenteng/sdk/b103_ios/cangjie/envsetup.sh
cjc -v
export CANGJIE_STDX_PATH=/Users/huawei_test/wubenteng/sdk/b103_ios/darwin_aarch64_cjnative


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

./main
echo "静态链接，强制抽取"


cjc -v
