call E:\sdk\b103\cangjie-sdk-windows-x64-1.1.0-beta.23\cangjie\envsetup.bat
cjc -v
set "CANGJIE_STDX_PATH=E:\sdk\b103\cangjie-stdx-windows-x64-1.1.0-beta.23.1\windows_x86_64_cjnative"
@REM 动态链接
set PATH=%CANGJIE_STDX_PATH%/dynamic/stdx;%PATH%
cjc main.cj --import-path %CANGJIE_STDX_PATH%/dynamic/stdx -L%CANGJIE_STDX_PATH%/dynamic/stdx -lstdx.crypto.keys -lstdx.crypto.digest
dumpbin /dependents main.exe
main.exe

@REM 静态链接，未强制抽取
@REM cjc main.cj --import-path %CANGJIE_STDX_PATH%/static/stdx -L%CANGJIE_STDX_PATH%/static/stdx --link-option --start-group -lstdx.chir -lstdx.unittest.data -lstdx.unittest -lstdx.encoding.json -lstdx.serialization.serialization -lstdx.serialization -lstdx.net.http -lstdx.net.tls -lstdx.net.tls.common -lstdx.net -lstdx.logger -lstdx.log -lstdx.encoding.url -lstdx.encoding.json.stream -lstdx.crypto.kit -lstdx.crypto.x509 -lstdx.crypto.crypto -lstdx.crypto.keys -lstdx.crypto.digest -lstdx.crypto.common -lstdx.encoding.hex -lstdx.encoding.base64 -lstdx.encoding -lstdx.compress.tar -lstdx.crypto -lstdx.compress.zlib -lstdx.compress -lstdx.actors -lstdx --link-option --end-group
@REM main.exe

@REM 静态链接，强制抽取
cjc main.cj -L "%CANGJIE_STDX_PATH%\static\stdx" --link-option --start-group -l stdx.crypto.keys -l stdx.crypto.common -l stdx.encoding.base64 -l stdx.crypto.digest -l stdx.encoding.hex --link-option --end-group --import-path "%CANGJIE_STDX_PATH%\static\stdx" -L "C:\msys64\usr\local\openssl\lib64" --link-option --whole-archive -lssl -lcrypto --link-option --no-whole-archive --link-option -lws2_32 --link-option -lcrypt32 -Woff all
echo 静态链接，强制抽取
dumpbin /dependents main.exe
main.exe
