// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 
// RUN-EXEC-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-2 aaa
// ASSERT: scan-1 bbb
// ASSERT: scan-1 ccc
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func test(x: Int64): (Bool, Bool, Bool) {
    println("aaa")
    if (x > 0) {
        return (true, true, true)
    }
    return (false, false, false)
}

main() {
    if (test(0) != (true, true, true)) {
        println("bbb")
    }
    if ((true, true, true) != test(0)) {
        println("ccc")
    }
    0
}
