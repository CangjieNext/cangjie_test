// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.process.*

@When[os == "Linux"]
func stagePreBuild(): Int64 {
    Process.run(
        "gcc",
        ["test01.c", "-shared", "-fPIC", "-o", "libtest01.so"]
    )

    return  Process.run(
        "gcc",
        ["test02.c", "-shared", "-fPIC", "-o", "libtest02.so"]
    )
}

@When[os == "Windows"]
func stagePreBuild(): Int64 {
    Process.run(
        "gcc",
        ["test01.c", "-shared", "-fPIC", "-o", "libtest01.dll"]
    )

    return  Process.run(
        "gcc",
        ["test02.c", "-shared", "-fPIC", "-o", "libtest02.dll"]
    )
}

@When[os == "macOS"]
func stagePreBuild(): Int64 {
    Process.run(
        "gcc",
        ["test01.c", "-shared", "-fPIC", "-o", "libtest01.dylib"]
    )

    return  Process.run(
        "gcc",
        ["test02.c", "-shared", "-fPIC", "-o", "libtest02.dylib"]
    )
}

@When[env == "ohos"]
func stagePreBuild(): Int64 {
    Process.run(
        "gcc",
        ["test01.c", "-shared", "-fPIC", "-o", "libtest01.so"]
    )

    return  Process.run(
        "gcc",
        ["test02.c", "-shared", "-fPIC", "-o", "libtest02.so"]
    )
}

main(): Int64 {
    match (Process.current.arguments[0]) {
        case "pre-build" => stagePreBuild()
        case _ => 0
    }
}
