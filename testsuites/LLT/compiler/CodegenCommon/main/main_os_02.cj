// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output CJC | compare %f
// ASSERT: scan-begin CJC
// ASSERT: scan-next args.size: 1
// ASSERT: scan-next CJC
// ASSERT: scan-next argsTemp.size: 1

import std.process

var args = process.Process.current.arguments

main() {
    for (item in args) {
        print(item)
    }
    println("\nargs.size: ${args.size}")

    var argsTemp = process.Process.current.arguments
    for (item in argsTemp) {
        print(item)
    }
    println("\nargsTemp.size: ${argsTemp.size}")
    return 0
}
