// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output Hello "" CJC | compare %f
// ASSERT: scan HelloCJC
// ASSERT: scan args.size: 3

main(args: Array<String>): Int64 {
    for (item in args) {
        print(item)
    }
    println("\nargs.size: ${args.size}")
    return 0
}
