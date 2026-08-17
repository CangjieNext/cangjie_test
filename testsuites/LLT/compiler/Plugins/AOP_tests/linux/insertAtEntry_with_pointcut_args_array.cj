// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// (CJNATIVE and Linux)ASSERT: scan args.size=3\narg0=42\narg1=aspect-cj\narg2=true\ntarget\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

@InsertAtEntry[
    packageName: "default",
    className: "",
    methodName: "pointcutWithArgs",
    isStatic: false,
    recursive: false,
    funcTypeStr: "(std.core.Int64,std.core.String,std.core.Bool)->std.core.Unit"
]
public func capturePointcutArgs(args: Array<Any>) {
    println("args.size=${args.size}")
    match (args[0]) {
        case value: Int64 => println("arg0=${value}")
        case _ => println("arg0=<unexpected>")
    }
    match (args[1]) {
        case value: String => println("arg1=${value}")
        case _ => println("arg1=<unexpected>")
    }
    match (args[2]) {
        case value: Bool => println("arg2=${value}")
        case _ => println("arg2=<unexpected>")
    }
}

public func pointcutWithArgs(number: Int64, text: String, flag: Bool): Unit {
    println("target")
}

main() {
    pointcutWithArgs(42, "aspect-cj", true)
    0
}
