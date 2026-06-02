/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex at foo|main
// (not O2) ASSERT: scan throwable_30005.cj:18

var test = {
    =>
    func foo(a!: Int64 = if (true) {
            throw Exception();
            0
        } else {
            1
        }) {}
    foo()
}

main() {
    test()
    return 5
}
