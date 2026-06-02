// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.process.*
import std.env.*
@When[os == "Linux"]
func stagePreBuild(): Int64 {
    return Process.run(
        "gcc",
        ["test01.c", "-shared", "-fPIC", "-o", "libtest01.so"]
    )

   
}

@When[target == "aarch64-linux-android26"]
func stagePreBuild(): Int64 {
    let NDK_ROOT = getVariable("NDK_ROOT").getOrThrow()
    let clang = "${NDK_ROOT}/bin/clang"
   

    return  Process.run(
        clang,
        ["test01.c","--target=aarch64-linux-android26", "-shared", "-fPIC", "--sysroot=${NDK_ROOT}/sysroot","-o", "libtest01.so"]
    )
}

@When[target == "aarch64-linux-android31"]
func stagePreBuild(): Int64 {
    let NDK_ROOT = getVariable("v").getOrThrow()
    let clang = "${NDK_ROOT}/bin/clang"
    

    return  Process.run(
        clang,
        ["test01.c","--target=aarch64-linux-android31", "-shared", "-fPIC", "--sysroot=${NDK_ROOT}/sysroot","-o", "libtest01.so"]
    )
}

@When[target == "aarch64-linux-android32"]
func stagePreBuild(): Int64 {
    let NDK_ROOT = getVariable("NDK_ROOT").getOrThrow()
    let clang = "${NDK_ROOT}/bin/clang"
   

    return  Process.run(
        clang,
        ["test01.c","--target=aarch64-linux-android32", "-shared", "-fPIC", "--sysroot=${NDK_ROOT}/sysroot","-o", "libtest01.so"]
    )
}
@When[target == "aarch64-linux-android35"]
func stagePreBuild(): Int64 {
    let NDK_ROOT = getVariable("NDK_ROOT").getOrThrow()
    let clang = "${NDK_ROOT}/bin/clang"
   

    return  Process.run(
        clang,
        ["test01.c","--target=aarch64-linux-android35", "-shared", "-fPIC", "--sysroot=${NDK_ROOT}/sysroot","-o", "libtest01.so"]
    )
}

@When[target == "x86_64-linux-ohos"]
func stagePreBuild(): Int64 {
    let OHOS_ROOT = getVariable("OHOS_ROOT").getOrThrow()
    let clang = "${OHOS_ROOT}/llvm/prebuilt/x86_64-linux-ohos/bin/clang"
 
    return  Process.run(
        clang,
        ["test01.c","--target=x86_64-linux-ohos", "-shared", "-fPIC", "--sysroot=${OHOS_ROOT}/llvm/prebuilt/x86_64-linux-ohos/sysroot","-o", "libtest01.so"]
    )
}

@When[target == "aarch64-linux-ohos"]
func stagePreBuild(): Int64 {
    let OHOS_ROOT = getVariable("OHOS_ROOT").getOrThrow()
    let clang = "${OHOS_ROOT}/llvm/bin/clang"


    return  Process.run(
        clang,
        ["test01.c","--target=aarch64-linux-ohos", "-shared", "-fPIC", "--sysroot=${OHOS_ROOT}/sysroot","-o", "libtest01.so"]
    )
}


main(): Int64 {
    match (Process.current.arguments[0]) {
        case "pre-build" => stagePreBuild()
        case _ => 0
    }
}
