REM Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
REM This source file is part of the Cangjie project, licensed under Apache-2.0
REM with Runtime Library Exception.

REM See https://cangjie-lang.cn/pages/LICENSE for license information.

@REM @echo off
setlocal enabledelayedexpansion

set echo=on
set errexit=on

set TEST_CASE_PATH=%CD%

REM 复制 Logger.java 和 logger.cj 到测试用例目录
copy "%CANGJIE_TEST%\testsuites\HLT\compiler\cjnative\FFI\jffi\android\util\logger.cj" "%TEST_CASE_PATH%\logger.cj"
copy "%CANGJIE_TEST%\testsuites\HLT\compiler\cjnative\FFI\jffi\android\util\Logger.java" "%TEST_CASE_PATH%\Logger.java"

set ANDROID_PROJ_PATH=%CANGJIE_TEST%\testsuites\HLT\configs\cjnative\android\MyApplication

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
IF "%1"=="linux_android_aarch64_cjnative" (
    SET JNI_LIB_PATH=%ANDROID_PROJ_PATH%\app\src\main\jniLibs\arm64-v8a
) ELSE IF "%1"=="linux_android23_arm_cjnative" (
    SET JNI_LIB_PATH=%ANDROID_PROJ_PATH%\app\src\main\jniLibs\armeabi-v7a
) ELSE (
    SET JNI_LIB_PATH=%ANDROID_PROJ_PATH%\app\src\main\jniLibs\arm64-v8a
)

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
IF "%1"=="linux_android_aarch64_cjnative" (
    copy "%NDK_ROOT%\sysroot\usr\lib\aarch64-linux-android\libc++_shared.so" "%JNI_LIB_PATH%\libc++_shared.so"
) ELSE IF "%1"=="linux_android23_arm_cjnative" (
    copy "%NDK_ROOT%\sysroot\usr\lib\arm-linux-androideabi\libc++_shared.so" "%JNI_LIB_PATH%\libc++_shared.so"
) ELSE (
    copy "%NDK_ROOT%\sysroot\usr\lib\aarch64-linux-android\libc++_shared.so" "%JNI_LIB_PATH%\libc++_shared.so"
)

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

call gradlew.bat assembleAndroidTest
if %ERRORLEVEL% neq 0 (
    echo 构建 app-debug-androidTest.apk 失败
    exit /b 1
)

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
if exist "%ANDROID_PROJ_PATH%\app\build" rmdir /s /q "%ANDROID_PROJ_PATH%\app\build"
if exist "%ANDROID_PROJ_PATH%\app\libs" rmdir /s /q "%ANDROID_PROJ_PATH%\app\libs"
if exist "%ANDROID_PROJ_PATH%\app\src\main\jniLibs" rmdir /s /q "%ANDROID_PROJ_PATH%\app\src\main\jniLibs"

REM 输出结果
type result.txt

REM 检查测试结果
findstr "OK (" result.txt >nul
if %ERRORLEVEL% equ 0 (
    exit /b 0
) else (
    exit /b 1
)
