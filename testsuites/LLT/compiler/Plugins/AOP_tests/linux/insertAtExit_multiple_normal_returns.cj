// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// (CJNATIVE and Linux)ASSERT: scan target.positive\nexit.value=1\ntarget.nonpositive\nexit.value=0\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

@InsertAtExit[
    packageName: "default",
    className: "",
    methodName: "multipleReturnTarget",
    isStatic: false,
    recursive: false,
    funcTypeStr: "(Int64)->Int64"
]
public func afterMultipleReturn(args: Array<Any>): Unit {
    match (args[0]) {
        case value: Int64 => println("exit.value=${value}")
        case _ => println("exit.value=<unexpected>")
    }
}

public func multipleReturnTarget(value: Int64): Int64 {
    if (value > 0) {
        println("target.positive")
        return value
    }
    println("target.nonpositive")
    return 0
}

main() {
    multipleReturnTarget(1)
    multipleReturnTarget(0)
    0
}
