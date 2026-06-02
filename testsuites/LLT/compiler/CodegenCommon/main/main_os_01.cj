// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output | compare %f
// ASSERT: scan-begin args.size: 0
// ASSERT: scan-next argsTemp.size: 0
// ASSERT: scan-next argsMain.size: 0

import std.process

var args = process.Process.current.arguments

main(argsMain: Array<String>) {
    for (item in args) {
        println(item)
    }
    println("args.size: ${args.size}")

    var argsTemp = process.Process.current.arguments
    for (item in argsTemp) {
        println(item)
    }
    println("argsTemp.size: ${argsTemp.size}")

    for (item in argsMain) {
        println(item)
    }
    println("argsMain.size: ${argsMain.size}")
    return 0
}
