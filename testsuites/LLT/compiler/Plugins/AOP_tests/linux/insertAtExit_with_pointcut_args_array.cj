// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// (CJNATIVE and Linux)ASSERT: scan target=7:exit\nafter.size=2\nafter.number=7\nafter.text=exit\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

@InsertAtExit[
    packageName: "default",
    className: "",
    methodName: "pointcutAtExit",
    isStatic: false,
    recursive: false,
    funcTypeStr: "(std.core.Int64,std.core.String)->std.core.Unit"
]
public func captureArgsAtExit(args: Array<Any>): Unit {
    println("after.size=${args.size}")
    match (args[0]) {
        case value: Int64 => println("after.number=${value}")
        case _ => println("after.number=<unexpected>")
    }
    match (args[1]) {
        case value: String => println("after.text=${value}")
        case _ => println("after.text=<unexpected>")
    }
}

public func pointcutAtExit(number: Int64, text: String): Unit {
    println("target=${number}:${text}")
}

main() {
    pointcutAtExit(7, "exit")
    0
}
