@REM @echo off
setlocal enabledelayedexpansion

call E:\sdk\b804_android\cangjie\envsetup.bat
set "NDK_ROOT=C:\Users\wuben\AppData\Local\Android\Sdk\ndk\30.0.14904198\toolchains\llvm\prebuilt\windows-x86_64"
set "ANDROID_HOME=C:\Users\wuben\AppData\Local\Android\Sdk"

REM 设置调试模式（可选）
REM set -xe 的批处理等效
set echo=on
set errexit=on

REM 设置环境变量
set TEST_CASE_PATH=%CD%
if "%CANGJIE_TEST%"=="" set CANGJIE_TEST=请设置CANGJIE_TEST环境变量
if "%CANGJIE_HOME%"=="" set CANGJIE_HOME=请设置CANGJIE_HOME环境变量
if "%NDK_ROOT%"=="" set NDK_ROOT=请设置NDK_ROOT环境变量

REM 复制 Logger.java 和 logger.cj 到测试用例目录
copy "%CANGJIE_TEST%\testsuites\HLT\compiler\cjnative\FFI\jffi\android\util\logger.cj" "%TEST_CASE_PATH%\logger.cj"
copy "%CANGJIE_TEST%\testsuites\HLT\compiler\cjnative\FFI\jffi\android\util\Logger.java" "%TEST_CASE_PATH%\Logger.java"


REM 重置 Android 项目中的 UNNAMED 目录
@REM set ANDROID_PROJ_PATH=%CANGJIE_TEST%\testsuites\HLT\configs\cjnative\android\MyApplication
set ANDROID_PROJ_PATH=C:\Users\wuben\AndroidStudioProjects\MyApplication5
if exist "%ANDROID_PROJ_PATH%\app\src\main\java\UNNAMED" rmdir /s /q "%ANDROID_PROJ_PATH%\app\src\main\java\UNNAMED"
mkdir "%ANDROID_PROJ_PATH%\app\src\main\java\UNNAMED"

REM 如果有，复制 cjc 生成的 Java 镜像文件到 Android 项目
if exist "%TEST_CASE_PATH%\java-gen" (
    copy "%TEST_CASE_PATH%\java-gen\*" "%ANDROID_PROJ_PATH%\app\src\main\java\UNNAMED\"
)

REM 重置 Android 项目中的 com/example/myapplication 目录
if exist "%ANDROID_PROJ_PATH%\app\src\main\java\com\example\myapplication" rmdir /s /q "%ANDROID_PROJ_PATH%\app\src\main\java\com\example\myapplication"
mkdir "%ANDROID_PROJ_PATH%\app\src\main\java\com\example\myapplication"

REM 复制 Logger.java 到 app/src/main/java/com/example/myapplication
copy "%TEST_CASE_PATH%\Logger.java" "%ANDROID_PROJ_PATH%\app\src\main\java\com\example\myapplication\Logger.java"

set UNITTEST_FILE=MainInstrumentedTest.java

REM 清除之前复制到 app/src/main/java/com 的所有 .java 和 .class 文件
if exist "%ANDROID_PROJ_PATH%\app\src\main\java\com\*.java" del /q "%ANDROID_PROJ_PATH%\app\src\main\java\com\*.java"
if exist "%ANDROID_PROJ_PATH%\app\src\main\java\com\*.class" del /q "%ANDROID_PROJ_PATH%\app\src\main\java\com\*.class"

REM 复制测试用例 Java 源文件到 Android Studio 项目
xcopy /E /I "%TEST_CASE_PATH%\com" "%ANDROID_PROJ_PATH%\app\src\main\java\com\"

REM 设置 JNI 库路径
REM 注意：文档中注释了 arm64-v8a 和 armeabi-v7a 两种选择
set JNI_LIB_PATH=%ANDROID_PROJ_PATH%\app\src\main\jniLibs\arm64-v8a
@REM set JNI_LIB_PATH=%ANDROID_PROJ_PATH%\app\src\main\jniLibs\armeabi-v7a

REM 清除 jniLibs
if exist "%JNI_LIB_PATH%" rmdir /s /q "%JNI_LIB_PATH%"
mkdir "%JNI_LIB_PATH%"

REM 复制 Cangjie 动态库到 jniLibs
copy "%TEST_CASE_PATH%\libUNNAMED.so" "%JNI_LIB_PATH%\libUNNAMED.so"

REM 复制必要的动态库从 Cangjie SDK
if exist "%CANGJIE_HOME%\runtime\lib\%1\" (
    copy "%CANGJIE_HOME%\runtime\lib\%1\*" "%JNI_LIB_PATH%\"
)

REM 从 Android NDK 复制 libc++_shared.so
REM 注意：文档中包含 darwin-x86_64 和 windows-x86_64 两个版本
REM cp "$NDK_ROOTsysroot/usr/lib/$2/libc++_shared.so" "$JNI_LIB_PATH/libc++_shared.so"
copy "%NDK_ROOT%\sysroot\usr\lib\aarch64-linux-android\libc++_shared.so" "%JNI_LIB_PATH%\libc++_shared.so"
@REM copy "%NDK_ROOT%\sysroot\usr\lib\arm-linux-androideabi\libc++_shared.so" "%JNI_LIB_PATH%\libc++_shared.so"

REM 复制插桩测试源文件
if exist "%ANDROID_PROJ_PATH%\app\src\androidTest\java\com\example\myapplication" rmdir /s /q "%ANDROID_PROJ_PATH%\app\src\androidTest\java\com\example\myapplication"
mkdir "%ANDROID_PROJ_PATH%\app\src\androidTest\java\com\example\myapplication"
copy "%UNITTEST_FILE%" "%ANDROID_PROJ_PATH%\app\src\androidTest\java\com\example\myapplication\%UNITTEST_FILE%"

REM 复制 library-loader.jar 到 app/libs
if exist "%ANDROID_PROJ_PATH%\app\libs" rmdir /s /q "%ANDROID_PROJ_PATH%\app\libs"
mkdir "%ANDROID_PROJ_PATH%\app\libs"
copy "%CANGJIE_HOME%\lib\library-loader.jar" "%ANDROID_PROJ_PATH%\app\libs\library-loader.jar"

REM 切换到 Android 项目目录
cd /d "%ANDROID_PROJ_PATH%"

REM 构建 APKs
call gradlew.bat assembleDebug
if %ERRORLEVEL% neq 0 (
    echo 构建 app-debug.apk 失败
    exit /b 1
)

call gradlew assembleAndroidTest
if %ERRORLEVEL% neq 0 (
    echo 构建 app-debug-androidTest.apk 失败
    exit /b 1
)

REM 设置设备 ID
@REM if "%DEVICE_ID%"=="" set DEVICE_ID=emulator-5554
if "%DEVICE_ID%"=="" set DEVICE_ID=e81d5158

REM 安装主 APK
adb -s "%DEVICE_ID%" install -t "%ANDROID_PROJ_PATH%\app\build\outputs\apk\debug\app-debug.apk"
if %ERRORLEVEL% neq 0 (
    echo 安装 app-debug.apk 失败
    exit /b 1
)

REM 安装测试 APK
adb -s "%DEVICE_ID%" install -t "%ANDROID_PROJ_PATH%\app\build\outputs\apk\androidTest\debug\app-debug-androidTest.apk"
if %ERRORLEVEL% neq 0 (
    echo 安装 app-debug-androidTest.apk 失败
    exit /b 1
)

REM 运行测试
adb -s "%DEVICE_ID%" shell am instrument -w -e junitXml "/sdcard/report.xml" "com.example.myapplication.test/androidx.test.runner.AndroidJUnitRunner" 2>&1 > result.txt

REM 清理
@REM if exist "%ANDROID_PROJ_PATH%\app\build" rmdir /s /q "%ANDROID_PROJ_PATH%\app\build"
@REM if exist "%ANDROID_PROJ_PATH%\app\libs" rmdir /s /q "%ANDROID_PROJ_PATH%\app\libs"
@REM if exist "%ANDROID_PROJ_PATH%\app\src\main\jniLibs" rmdir /s /q "%ANDROID_PROJ_PATH%\app\src\main\jniLibs"

REM 输出结果
type result.txt

REM 检查测试结果
findstr "OK (" result.txt >nul
if %ERRORLEVEL% equ 0 (
    exit /b 0
) else (
    exit /b 1
)




@REM dir "%TEST_CASE_PATH%"
@REM dir "%JNI_LIB_PATH%"
